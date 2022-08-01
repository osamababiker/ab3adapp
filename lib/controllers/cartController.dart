import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:ab3ad/models/cart.dart';

class CartDbController extends GetxController {
  static final CartDbController _instance =
      CartDbController.internal();

  factory CartDbController() => _instance;
  final String table = "cart";
  final String id = "id";
  final String itemId = "itemId";
  final String categoryId = "categoryId";
  final String name = "name";
  final String image = "image";
  final String uploadedImage = "uploadedImage";
  final String price = "price";
  final String quantity = "quantity";
  final String deliveryTime = "deliveryTime";
  final String deliveryNote = "deliveryNote"; 

  RxInt cartCounter = 0.obs;
  RxDouble cartTotal = 0.0.obs;
  RxList itemsList = [].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    getCount();
    getCartTotal();
    getItems();
    super.onInit();
  }

  
  Future<Database> get db async {
    Database _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    //deleteDB();
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "maindb.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $table($id INTEGER PRIMARY KEY AUTOINCREMENT, $itemId INTEGER, $categoryId INTEGER, $name TEXT, $image TEXT ,$uploadedImage TEXT , $price TEXT, $deliveryTime TEXT, $deliveryNote TEXT, $quantity INTEGER)");
  }

  /*================== CRUD ===================*/

  addToCart({required Map<String, dynamic> listData}) async {
    var dbClient = await db;
    var listItemId = listData['itemId'];
    var result = await dbClient
        .rawQuery("SELECT itemId , quantity FROM $table WHERE $itemId = $listItemId");
    if (result.isEmpty) {
      saveItem(listData: listData);
    } else {
      int id = result[0]['itemId'] as int;
      int quantity = result[0]['quantity'] as int;
      int listDataQuantity = int.parse(listData['quantity']);
      listDataQuantity += quantity;
      listData['quantity']  = listDataQuantity;
      updateQuantity(listData: listData, listItemId: listItemId);
    }
  }

  // INSERTIONG
  Future<int> saveItem({required Map<String, dynamic> listData}) async {
    isLoading(true);
    var dbClient = await db;
    try {
      int item = await dbClient.insert(table, listData);
      getCount();
      getCartTotal();
      getItems();
      isLoading(false);
      return item;
    } catch (e) {
      print("problem Insert item === $e");
      isLoading(false);
      throw (e);
    }
  }

  // Selecting
  Future getItems() async {
    isLoading(true);
    var dbclient = await db;
    try {
      List<Map<String, dynamic>> maps = await dbclient.query(table, columns: [
        id,
        itemId,
        categoryId,
        name,
        image,
        uploadedImage,
        price,
        quantity,
        deliveryTime,
        deliveryNote
      ]);
      List<Cart> items = [];
      if (maps.isNotEmpty) {
        for (int i = 0; i < maps.length; i++) {
          items.add(Cart.fromMap(maps[i]));
        }
      }
      isLoading(false);
      itemsList.value = items;
    } catch (e) {
      isLoading(false);
      print("problem selecting all items == $e");
      throw (e);
    }
  }

  Future getCartTotal() async {
    isLoading(true);
    var dbclient = await db;
    var total = 0.0;
    var listData = [];
    try {
      listData = await dbclient.rawQuery("SELECT * FROM $table");
      for (var i = 0; i < listData.length; i++) {
        Cart list = Cart.fromMap(listData[i]);
        total += double.parse(list.price) * list.quantity;
      }
    } catch (e) {
      print("problem selecting all items == $e");
      throw (e);
    }
    cartTotal.value = total;
    isLoading(false);
  }

  // GETTING COUNT
  Future getCount() async {
    isLoading(true);
    var dbClient = await db;
    var numOfItems = 0;
    try {
      numOfItems = Sqflite.firstIntValue(
          await dbClient.rawQuery("SELECT COUNT(*) FROM $table"))!;
    } catch (e) {
      print("problem getting count == $e");
      throw (e);
    }
    cartCounter.value = numOfItems;
    isLoading(false);
  }

  // DELETEING ITEM
  Future<int> deleteItem(int itemId) async {
    var dbClient = await db;
    try {
      int deleteItem =
          await dbClient.delete(table, where: "$id = ?", whereArgs: [itemId]);
      getCount();
      getCartTotal();
      getItems();
      return deleteItem;
    } catch (e) {
      print("problem deleteing Item == $e");
      throw (e);
    }
  } 

  // UPDATING
  Future<int> updateQuantity(
      {required Map<String, dynamic> listData, required int listItemId}) async {
    var dbClient = await db;
    try {
      int updateItem = await dbClient
          .update(table, listData, where: '$itemId = ?', whereArgs: [listItemId]);
      getCount();
      getCartTotal();
      getItems();
      return updateItem;
    } catch (e) {
      print("problem updating Item quantity == $e");
      throw (e);
    }
  }

  // DELETEING DATABASE
  deleteDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'maindb.db');
    try {
      await deleteDatabase(path);
    } catch (e) {
      print("problem deleting database == $e");
      throw (e);
    }
  }

  // CLOSING CONNECTION
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  CartDbController.internal();
}
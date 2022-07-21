import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:ab3ad/models/Cart.dart';

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
  RxList itemsList = [].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    getCount();
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
    var id = listData['itemId'];
    var result = await dbClient
        .rawQuery("SELECT itemId , quantity FROM $table WHERE $itemId = $id");
    if (result.isEmpty) {
      saveItem(listData: listData);
    } else {
      int id = result[0]['itemId'] as int;
      int quantity = result[0]['quantity'] as int;
      listData['quantity'] += quantity;
      updateQuantity(listData: listData, id: id);
    }
  }

  // INSERTIONG
  Future<int> saveItem({required Map<String, dynamic> listData}) async {
    var dbClient = await db;
    try {
      int item = await dbClient.insert(table, listData);
      getCount();
      getItems();
      return item;
    } catch (e) {
      print("problem Insert item === $e");
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

  Future<double> getCartTotal() async {
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
    return total;
  }

  // GETTING COUNT
  Future getCount() async {
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
  }

  // DELETEING ITEM
  Future<int> deleteItem(int itemId) async {
    var dbClient = await db;
    try {
      int deleteItem =
          await dbClient.delete(table, where: "$id = ?", whereArgs: [itemId]);
      getCount();
      getItems();
      return deleteItem;
    } catch (e) {
      print("problem deleteing Item == $e");
      throw (e);
    }
  }

  // UPDATING
  Future<int> updateQuantity(
      {required Map<String, dynamic> listData, required int id}) async {
    var dbClient = await db;
    try {
      int updateItem = await dbClient
          .update(table, listData, where: '$id = ?', whereArgs: [id]);
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
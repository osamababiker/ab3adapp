import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ab3ad/models/Item.dart';
import 'package:ab3ad/services/items_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController{
  var isLoading = true.obs;
  var itemsList = <Item>[].obs;
  final ItemsService _itemsService = ItemsService();
  final formKey = GlobalKey<FormState>();
  Item? selectedItem;
  RxString selectedTime = "خلال اليوم".obs;
  final List<String> timeList = [ 
    'خلال اليوم',
    'صباحا',
    'بعد الظهر',
    ' بعد العصر',
    ' مساءا'
  ];
  final List<String> errors = [];
  final quantityController = TextEditingController();
  final notesController = TextEditingController();

  void addError({required String error}) {
    if (!errors.contains(error)) errors.add(error);
  }

  void removeError({required String error}) {
    if (errors.contains(error)) errors.remove(error);
  }

  @override
  void onClose() {
    super.onClose();
    quantityController.dispose();
    notesController.dispose();
  }

  Future fetchItems({required String itemsEndPoint}) async{
    await _itemsService.fetchItems(itemsEndPoint: itemsEndPoint).then((response) {
      itemsList.value = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }
}
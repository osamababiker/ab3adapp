import 'package:ab3ad/models/item.dart';
import 'package:ab3ad/services/items_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController{
  var isLoading = true.obs;
  var itemsList = <Item>[].obs;
  final ItemsService _itemsService = ItemsService();
  final formKey = GlobalKey<FormState>();
  Item? selectedItem;
  RxString selectedTime = "order_form_during_day".tr.obs;
  final List<String> timeList = [ 
    'order_form_during_day'.tr,
    'order_form_morning'.tr,
    'order_form_afternoon'.tr,
    'order_form_evening'.tr
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
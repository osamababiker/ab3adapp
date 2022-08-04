import 'package:ab3ad/models/item.dart';
import 'package:get/get.dart';

class ItemsService extends GetConnect{

  ItemsService() {
    timeout = const Duration(seconds: 30);
  }

  List<Item> parseItems(List responseBody) {
    return responseBody.map<Item>((json) => Item.fromJson(json)).toList();
  }

  Future<List<Item>> fetchItems({required String itemsEndPoint}) async {
    final response = await get(itemsEndPoint); 
    if (response.status.hasError) {
      if(response.status.connectionError){
        Get.toNamed('/noInternet');
      }
      return Future.error(response.statusText.toString());
    } else {
      return parseItems(response.body['data']);
    }  
  }
}
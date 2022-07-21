import 'package:ab3ad/models/item.dart';
import 'package:ab3ad/models/user.dart';

class Order {
  final int id,
      categoryId,
      quantity,
      status,
      customerCompleteSign,
      driverCompleteSign;
  final String delivaryTime, notes, customerLat, customerLng;
  final String? file;
  final Item item;
  final User user;

  Order(
      {required this.id,
      required this.user,
      required this.categoryId,
      required this.quantity,
      required this.status,
      required this.item,
      required this.delivaryTime,
      required this.notes,
      required this.customerLat,
      required this.customerLng,
      this.file,
      required this.customerCompleteSign,
      required this.driverCompleteSign});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json["id"],
        user: User.fromJson(json["user"]),
        categoryId: json["categoryId"],
        quantity: json["quantity"],
        status: json["status"],
        item: Item.fromJson(json['item']),
        delivaryTime: json["delivary_time"],
        notes: json["notes"],
        customerLat: json["lat"].toString(),
        customerLng: json["lng"].toString(),
        file: json["file"],
        customerCompleteSign: json["customer_complete_sign"],
        driverCompleteSign: json["driver_complete_sign"]);
  }
}

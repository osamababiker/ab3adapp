import 'package:ab3ad/models/user.dart';
 
class DeliveryRequest {
  final int id, orderId, isAccepted;
  final User customer, driver;


  DeliveryRequest(
      {required this.id, 
      required this.isAccepted,
      required this.orderId,
      required this.customer,
      required this.driver});

  factory DeliveryRequest.fromJson(Map<String, dynamic> json) {
    return DeliveryRequest(
        id: json["id"],
        isAccepted: json["isAccepted"],
        orderId: json["orderId"],
        customer: User.fromJson(json["customer"]),
        driver: User.fromJson(json['driver']));
  }
}


class Coupon {
  final int id;
  final String code , discount;

  Coupon({
    required this.id,
    required this.code,
    required this.discount,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      id: json['id'],
      code: json['code'],
      discount: json['discount'],
    );
  }
}

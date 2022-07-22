class User {
  final int id;
  final String name, phone, address, lng, lat;
  int isVerify, isDriver;
  final double rating;

  User(
      {required this.id,
      required this.name,
      required this.phone,
      required this.address, 
      required this.lng,
      required this.lat,
      required this.rating,
      required this.isVerify,
      required this.isDriver});

  // It creates an User from JSON
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        phone = json['phone'],
        address = json['address'],
        lat = json['lat'],
        lng = json['lng'],
        rating = json['rating'].toDouble(),
        isVerify = json['isVerify'].toInt(),
        isDriver = json['isDriver'].toInt();
}

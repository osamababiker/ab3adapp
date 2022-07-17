
class Item {
  final int id, categoryId;
  final String name, image, price;

  Item({
    required this.id, 
    required this.categoryId,
    required this.name, 
    required this.image, 
    required this.price
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      categoryId: json["categoryId"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
    );
  }
}


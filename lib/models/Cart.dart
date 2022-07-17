class Cart {
  final String name, image, price, deliveryTime, deliveryNote;
  final String? uploadedImage;
  final int id, itemId, quantity, categoryId;

  Cart(
      {required this.id,
      required this.itemId,
      required this.name,
      required this.image,
      required this.uploadedImage, 
      required this.price,
      required this.quantity,
      required this.categoryId,
      required this.deliveryTime,
      required this.deliveryNote});

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
        id: map["id"],
        itemId: map["itemId"],
        name: map["name"],
        image: map["image"],
        uploadedImage: map["uploadedImage"],
        price: map["price"],
        quantity: map["quantity"],
        categoryId: map["categoryId"],
        deliveryTime: map["deliveryTime"],
        deliveryNote: map["deliveryNote"]);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['itemId'] = itemId;
    map['name'] = name;
    map['price'] = price;
    map['image'] = image;
    map['uploadedImage'] = uploadedImage;
    map['quantity'] = quantity;
    map["categoryId"] = categoryId;
    map["deliveryTime"] = deliveryTime;
    map["deliveryNote"] = deliveryNote;
    return map;
  }
}

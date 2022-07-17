
class Category {
  final int id;
  final String name, image;

  Category({
    required this.id, 
    required this.name, 
    required this.image, 
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }
}


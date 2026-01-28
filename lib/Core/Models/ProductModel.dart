class ProductModel{
  String imgPath;
  String name;
  String description;
  double price;

  ProductModel({
    required this.imgPath,
    required this.name,
    required this.description,
    required this.price
  });

  factory ProductModel.fromJson(Map<String, dynamic>json){
    return ProductModel(imgPath: json["images"][0],
     name: json["title"], description: json["description"],
      price: (json["price"] as num).toDouble());
  }
}
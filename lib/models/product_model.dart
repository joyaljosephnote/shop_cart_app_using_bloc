class ProductModel {
  int id;
  String title;
  String price;
  String description;
  String category;
  String image;
  String rating;
  String ratingCount;
  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating,
      required this.ratingCount});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'].toString(),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: json['rating']['rate'].toString(),
        ratingCount: json['rating']['count'].toString());
  }
}

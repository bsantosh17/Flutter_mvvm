class ProductDetailModel {
  //final int id;
  final String title;
  final String? image;
  /*final double price;
  final String description;
  final String brand;
  final String model;
  final String color;
  final String category;
  final int discount;
*/
  ProductDetailModel({
   // required this.id,
    required this.title,
    this.image,
   /* required this.price,
    required this.description,
    required this.brand,
    required this.model,
    required this.color,
    required this.category,
    required this.discount,*/
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      //id: json['id'],
      title: json['title'],
      image: json['image'],
      /*price: json['price'].toDouble(),
      description: json['description'],
      brand: json['brand'],
      model: json['model'],
      color: json['color'],
      category: json['category'],
      discount: json['discount'],*/
    );
  }

  @override
  String toString() {
    return 'ProductDetailModel{title: $title, image: $image}';
  }
}
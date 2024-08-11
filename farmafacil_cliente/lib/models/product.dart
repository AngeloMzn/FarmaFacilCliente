class Product {
  final String code, description, category, image;
  final int quantity, id;
  final double initialPrice, promotionalPrice;
  final bool needsPrescription;

  Product({
    required this.id,
    required this.code,
    required this.description,
    required this.category,
    required this.image,
    required this.quantity,
    required this.initialPrice,
    required this.promotionalPrice,
    required this.needsPrescription,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      code: json['code'],
      quantity: json['quantity'] as int,
      description: json['description'],
      category: json['category'],
      initialPrice: json['initial_price'] is double ? json['initial_price'] : double.parse(json['initial_price'].toString()),
      promotionalPrice: json['promotional_price'] is double ? json['promotional_price'] : double.parse(json['promotional_price'].toString()),
      needsPrescription: json['needs_prescription'] as bool,
      image: json['image'],
    );
  }

  @override
  String toString() {
    return "id: $id, code: $code, quantity: $code, description: $description, category: $category, initial price: $initialPrice, promotional price: $promotionalPrice, needs prescription: $needsPrescription, image: $image";
  }
}

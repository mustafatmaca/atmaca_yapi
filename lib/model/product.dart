import 'dart:convert';

class Product {
  String? name;
  String? categoryName;
  int? price;
  int? stock;

  Product({
    this.name,
    this.categoryName,
    this.price,
    this.stock,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'categoryName': categoryName,
      'price': price,
      'stock': stock,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] != null ? map['name'] as String : null,
      categoryName:
          map['categoryName'] != null ? map['categoryName'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      stock: map['stock'] != null ? map['stock'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? productId;
  String? categoryName;
  String? productName;
  String? productPrice;
  int? productStock;

  ProductModel({
    this.productId,
    this.categoryName,
    this.productName,
    this.productPrice,
    this.productStock,
  });

  toJson() {
    return {
      "productName": productName,
      "productPrice": productPrice,
      "productStock": productStock
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel(
        productId: document.id,
        productName: data["productName"],
        productPrice: data["productPrice"],
        productStock: data["productStock"]);
  }
}

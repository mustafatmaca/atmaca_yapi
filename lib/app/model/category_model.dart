import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? categoryId;
  String? categoryName;

  CategoryModel({
    this.categoryId,
    this.categoryName,
  });

  toJson() {
    return {
      "categoryName": categoryName,
    };
  }

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return CategoryModel(
      categoryId: document.id,
      categoryName: data["categoryName"],
    );
  }
}

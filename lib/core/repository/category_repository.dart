import 'package:atmacayapi/app/model/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRepository {
  final db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await db.collection("categories").get();
    final categoryData =
        snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
    return categoryData;
  }

  addCategory(String categoryName) async {
    await db
        .collection("categories")
        .add(CategoryModel(categoryName: categoryName).toJson())
        .then(
          (doc) => print("Document added"),
          onError: (e) => print("Error updating document $e"),
        );
  }
}

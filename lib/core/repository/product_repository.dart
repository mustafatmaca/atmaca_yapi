import 'package:atmacayapi/app/model/category_model.dart';
import 'package:atmacayapi/app/model/product_model.dart';
import 'package:atmacayapi/app/theme/app_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductRepository {
  final db = FirebaseFirestore.instance;

  createProduct(ProductModel product) async {
    await db
        .collection(product.categoryName!)
        .add(product.toJson())
        .whenComplete(
          () => Get.snackbar("Başarılı", "Ürün başarıyla kaydedildi.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColor.mainRed,
              colorText: AppColor.mainWhite),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Başarısız", "Ürün kaydedilemedi!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.mainRed,
          colorText: AppColor.mainWhite);
      print(error.toString());
    });
  }

  Future<List<ProductModel>> getProducts(
      String categoryId, String categoryName) async {
    final snapshot = await db
        .collection("categories")
        .doc(categoryId)
        .collection(categoryName)
        .get();
    final productData =
        snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    return productData;
  }

  Future<ProductModel> getProduct(
      String categoryId, String categoryName, String productId) async {
    final snapshot = await db
        .collection("categories")
        .doc(categoryId)
        .collection(categoryName)
        .doc(productId)
        .get();
    final productData = ProductModel.fromSnapshot(snapshot);
    return productData;
  }

  deleteProduct(
      String categoryId, String categoryName, String productId) async {
    await db
        .collection("categories")
        .doc(categoryId)
        .collection(categoryName)
        .doc(productId)
        .delete()
        .then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  updateProduct(
    String categoryId,
    String categoryName,
    String productId,
    String? productName,
    String? productPrice,
    int? productStock,
  ) async {
    await db
        .collection("categories")
        .doc(categoryId)
        .collection(categoryName)
        .doc(productId)
        .update(ProductModel(
                productId: productId,
                categoryName: categoryName,
                productName: productName,
                productPrice: productPrice,
                productStock: productStock)
            .toJson())
        .then(
          (doc) => print("Document updated"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  addProduct(
    String categoryId,
    String categoryName,
    String productId,
    String? productName,
    String? productPrice,
    int? productStock,
  ) async {
    await db
        .collection("categories")
        .doc(categoryId)
        .collection(categoryName)
        .doc(productId)
        .set(ProductModel(
                productId: productId,
                categoryName: categoryName,
                productName: productName,
                productPrice: productPrice,
                productStock: productStock)
            .toJson())
        .then(
          (doc) => print("Document added"),
          onError: (e) => print("Error updating document $e"),
        );
  }
}

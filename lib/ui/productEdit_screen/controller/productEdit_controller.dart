// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:atmacayapi/model/category.dart';
import 'package:atmacayapi/model/product.dart';
import 'package:atmacayapi/repository/firestore_repo.dart';
import 'package:atmacayapi/ui/productDetail_screen/controller/productDetail_controller.dart';
import 'package:atmacayapi/ui/productSearch_screen/controller/productSearch_controller.dart';
import 'package:atmacayapi/ui/product_screen/controller/product_controller.dart';

class ProductEditController extends GetxController {
  String name;
  String price;
  String stock;
  String category;

  final firestoreRepo = FirestoreRepo();
  final ProductDetailController productDetailController = Get.find();
  final ProductController productController = Get.find();
  final ProductSearchController productSearchController = Get.find();
  RxList<Category> categories = <Category>[].obs;
  Rx<Category> selectedCategory = Category(name: "Diğer").obs;

  ProductEditController({
    required this.name,
    required this.price,
    required this.stock,
    required this.category,
  });

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController.text = name;
    priceController.text = price;
    stockController.text = stock;
    getCategories();
  }

  void getCategories() async {
    categories.value = await firestoreRepo.getCategories();
    selectedCategory.value =
        categories.firstWhere((element) => element.name == category);
  }

  void setSelected(Category value) {
    selectedCategory.value = value;
  }

  void updateProduct(Product product) async {
    await firestoreRepo.updateProduct(product.id!, product.name!,
        product.categoryName!, product.price!, product.stock!);

    productController.getProductsByCategory(product.categoryName!);
    productSearchController.getProducts();

    productDetailController.update();
    productController.update();
    productSearchController.update();
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:atmacayapi/model/product.dart';
import 'package:atmacayapi/repository/firestore_repo.dart';

class ProductController extends GetxController {
  final String category;
  ProductController({
    required this.category,
  });

  final firestoreRepo = FirestoreRepo();
  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductsByCategory(category);
  }

  void getProductsByCategory(String category) async {
    products.value = await firestoreRepo.getProductsByCategory(category);
  }
}

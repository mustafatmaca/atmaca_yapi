import 'package:atmacayapi/app/model/product_model.dart';
import 'package:atmacayapi/core/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final productRepo = ProductRepository();

  Future<List<ProductModel>> getProducts(
      String categoryId, String categoryName) {
    return productRepo.getProducts(categoryId, categoryName);
  }
}

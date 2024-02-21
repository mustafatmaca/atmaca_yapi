import 'package:atmacayapi/core/repository/product_repository.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final productRepo = ProductRepository();

  deleteProducts(String categoryId, String categoryName, String productId) {
    return productRepo.deleteProduct(categoryId, categoryName, productId);
  }
}

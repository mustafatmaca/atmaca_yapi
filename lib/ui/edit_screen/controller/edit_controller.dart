import 'package:atmacayapi/core/repository/product_repository.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  var index = 0.obs;
  var item_count = 1.obs;

  final productRepo = ProductRepository();

  updateProducts(String categoryId, String categoryName, String productId,
      String productName, String productPrice, int productStock) {
    return productRepo.updateProduct(categoryId, categoryName, productId,
        productName, productPrice, productStock);
  }
}

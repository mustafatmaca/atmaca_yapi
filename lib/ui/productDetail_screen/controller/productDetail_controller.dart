import 'package:atmacayapi/repository/firestore_repo.dart';
import 'package:atmacayapi/ui/product_screen/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  FirestoreRepo firestoreRepo = FirestoreRepo();
  final ProductController productController = Get.find();

  void deleteProduct(String productId) async {
    await firestoreRepo.deleteProduct(productId);

    productController.products
        .removeWhere((product) => product.id == productId);

    productController.update();
  }
}

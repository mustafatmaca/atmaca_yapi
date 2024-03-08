import 'package:atmacayapi/model/product.dart';
import 'package:atmacayapi/repository/firestore_repo.dart';
import 'package:get/get.dart';

class ProductSearchController extends GetxController {
  final firestoreRepo = FirestoreRepo();
  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    products.value = await firestoreRepo.getProducts();
  }
}

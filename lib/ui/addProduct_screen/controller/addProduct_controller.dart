import 'package:atmacayapi/model/category.dart';
import 'package:atmacayapi/repository/firestore_repo.dart';
import 'package:atmacayapi/ui/productSearch_screen/controller/prdouctSearch_controller.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  final firestoreRepo = FirestoreRepo();
  final ProductSearchController productSearchController = Get.find();
  RxList<Category> categories = <Category>[].obs;
  Rx<Category> selectedCategory = Category(name: "Diğer").obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    categories.value = await firestoreRepo.getCategories();
    selectedCategory.value = categories.first;
  }

  void setSelected(Category value) {
    selectedCategory.value = value;
  }

  void addProduct(
      String name, String categoryName, int price, int stock) async {
    await firestoreRepo.addProduct(name, categoryName, price, stock);

    productSearchController.getProducts();

    productSearchController.update();
  }
}

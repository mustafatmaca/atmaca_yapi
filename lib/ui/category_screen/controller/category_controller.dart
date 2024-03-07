import 'package:atmacayapi/model/category.dart';
import 'package:atmacayapi/repository/firestore_repo.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final firestoreRepo = FirestoreRepo();
  RxList<Category> categories = <Category>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    categories.value = await firestoreRepo.getCategories();
  }
}

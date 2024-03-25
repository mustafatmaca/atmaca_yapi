import 'package:atmacayapi/repository/firestore_repo.dart';
import 'package:atmacayapi/ui/category_screen/controller/category_controller.dart';
import 'package:get/get.dart';

class AddCategoryController extends GetxController {
  final firestoreRepo = FirestoreRepo();
  final CategoryController categoryController = Get.find();
  RxString message = "".obs;

  void addCategory(String name) async {
    message.value = await firestoreRepo.addCategory(name);

    categoryController.getCategories();

    categoryController.update();
  }
}

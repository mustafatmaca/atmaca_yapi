import 'package:atmacayapi/core/repository/category_repository.dart';
import 'package:get/get.dart';

class AddCategoryController extends GetxController {
  final categoryRepo = CategoryRepository();

  addCategory(String categoryName) {
    categoryRepo.addCategory(categoryName);
  }
}

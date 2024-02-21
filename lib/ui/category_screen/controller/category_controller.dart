import 'package:atmacayapi/app/model/category_model.dart';
import 'package:atmacayapi/core/repository/category_repository.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final categoryRepo = CategoryRepository();

  Future<List<CategoryModel>> getCategories() {
    return categoryRepo.getCategories();
  }
}

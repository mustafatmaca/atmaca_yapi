import 'package:atmacayapi/repository/firestore_repo.dart';
import 'package:get/get.dart';

class AddCategoryController extends GetxController {
  final firestoreRepo = FirestoreRepo();

  void addCategory(String name) async {
    await firestoreRepo.addCategory(name);
  }
}

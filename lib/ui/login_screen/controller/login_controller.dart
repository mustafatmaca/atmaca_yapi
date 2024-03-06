import 'package:atmacayapi/repository/firebaseAuth_repo.dart';
import 'package:get/get.dart';

class LoginController {
  final firebaseAuthRepo = FirebaseAuthRepo();
  RxString statusMessage = "".obs;

  void signIn(String email, String password) async {
    statusMessage.value = await firebaseAuthRepo.signIn(email, password);
  }
}

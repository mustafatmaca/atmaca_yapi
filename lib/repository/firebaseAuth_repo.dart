import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo {
  final firebaseAuthInstance = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    try {
      final userCredential = await firebaseAuthInstance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
      return "Giriş Yapıldı!";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  void logout() async {
    try {
      await firebaseAuthInstance.signOut();
    } catch (e) {
      print(e);
    }
  }
}

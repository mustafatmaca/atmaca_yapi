import 'package:atmacayapi/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepo {
  final firestoreInstance = FirebaseFirestore.instance;

  Future<String> addCategory(String name) async {
    try {
      final docRef = await firestoreInstance
          .collection("categories")
          .add(Category(name: name).toMap());
      print("Kategori Eklendi : ${docRef.id}");
      return "Kategori Oluşturuldu!";
    } catch (e) {
      return "Kategori Oluşturulamadı! Bir hata ile karşılaşıldı!";
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      final snapshot = await firestoreInstance.collection("categories").get();
      final categoryList =
          snapshot.docs.map((e) => Category.fromMap(e.data())).toList();
      print("Kategoriler Getirildi!");
      return categoryList;
    } catch (e) {
      print("Bir hata oluştu!");
      return [];
    }
  }
}

import 'package:atmacayapi/model/category.dart';
import 'package:atmacayapi/model/product.dart';
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
      final snapshot = await firestoreInstance
          .collection("categories")
          .orderBy('name')
          .get();
      final categoryList =
          snapshot.docs.map((e) => Category.fromMap(e.data())).toList();
      print("Kategoriler Getirildi!");
      return categoryList;
    } catch (e) {
      print("Bir hata oluştu!");
      return [];
    }
  }

  Future<String> addProduct(
      String name, String categoryName, double price, int stock) async {
    try {
      final docRef = await firestoreInstance.collection("products").add(Product(
              name: name,
              categoryName: categoryName,
              price: price,
              stock: stock)
          .toMap());
      print("Ürün Eklendi : ${docRef.id}");
      return "Ürün Oluşturuldu!";
    } catch (e) {
      return "Ürün Oluşturulamadı! Bir hata ile karşılaşıldı!";
    }
  }

  Future<String> deleteProduct(String id) async {
    try {
      await firestoreInstance.collection("products").doc(id).delete();
      return "Ürün Başaryla Silindi";
    } catch (e) {
      return "Ürün Silinemedi! Bir hata ile karşılaşıldı!";
    }
  }

  Future<String> updateProduct(String id, String name, String categoryName,
      double price, int stock) async {
    try {
      await firestoreInstance.collection("products").doc(id).update(Product(
              name: name,
              categoryName: categoryName,
              price: price,
              stock: stock)
          .toMap());
      return "Ürün Güncellendi!";
    } catch (e) {
      return "Ürün Güncellenemedi! Bir hata ile karşılaşıldı!";
    }
  }

  Future<List<Product>> getProducts() async {
    try {
      final snapshot =
          await firestoreInstance.collection("products").orderBy('name').get();
      final productList =
          snapshot.docs.map((e) => Product.fromMap(e.data(), e.id)).toList();
      print("Ürünler Getirildi!");
      return productList;
    } catch (e) {
      print("Bir hata oluştu!");
      return [];
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final snapshot = await firestoreInstance
          .collection("products")
          .orderBy('name')
          .where("categoryName", isEqualTo: category)
          .get();
      final productList =
          snapshot.docs.map((e) => Product.fromMap(e.data(), e.id)).toList();
      print("$category ürünleri getirildi!");
      return productList;
    } catch (e) {
      print("Bir hata oluştu");
      return [];
    }
  }

  Future<List<Product>> getProductsByName(String searchText) async {
    try {
      final snapshot =
          await firestoreInstance.collection("products").orderBy('name').get();
      final productList =
          snapshot.docs.map((e) => Product.fromMap(e.data(), e.id)).toList();

      String normalizeTurkishChars(String input) {
        return input
            .replaceAll('ı', 'i')
            .replaceAll('ş', 's')
            .replaceAll('ç', 'c')
            .replaceAll('ü', 'u')
            .replaceAll('ö', 'o')
            .replaceAll('ğ', 'g');
      }

      return productList
          .where((element) => normalizeTurkishChars(element.name!.toLowerCase())
              .contains(normalizeTurkishChars(searchText.toLowerCase())))
          .toList();
    } catch (e) {
      return [];
    }
  }
}

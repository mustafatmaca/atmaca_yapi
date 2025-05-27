import 'package:atmacayapi/model/category.dart';
import 'package:atmacayapi/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String normalizeTurkishChars(String input) {
  return input
      .replaceAll('ı', 'i')
      .replaceAll('ş', 's')
      .replaceAll('ç', 'c')
      .replaceAll('ü', 'u')
      .replaceAll('ö', 'o')
      .replaceAll('ğ', 'g');
}

class FirestoreRepo {
  final firestoreInstance = FirebaseFirestore.instance;
  List<Product>? _allProductsCache;

  Future<String> addCategory(String name) async {
    try {
      bool isExist = false;
      final snapshot = await firestoreInstance
          .collection("categories")
          .orderBy('name')
          .get();
      final categoryList =
          snapshot.docs.map((e) => Category.fromMap(e.data())).toList();

      for (var category in categoryList) {
        if (normalizeTurkishChars(category.name!.toLowerCase()).toLowerCase() ==
            normalizeTurkishChars(name.toLowerCase()).toLowerCase()) {
          isExist = true;
          break;
        }
      }

      if (isExist) {
        return "Aynı isimde bir kategori var!";
      } else {
        final docRef = await firestoreInstance
            .collection("categories")
            .add(Category(name: name).toMap());
        print("Kategori Eklendi : ${docRef.id}");
        return "Kategori Oluşturuldu!";
      }
    } catch (e) {
      return "Kategori Oluşturulamadı! Bir hata ile karşılaşıldı!";
    }
  }

  Future<String> deleteCategory(String categoryName) async {
    try {
      final snapshot = await firestoreInstance
          .collection("products")
          .orderBy('name')
          .where("categoryName", isEqualTo: categoryName)
          .get();

      final productList =
          snapshot.docs.map((e) => Product.fromMap(e.data(), e.id)).toList();

      for (var p in productList) {
        await firestoreInstance.collection("products").doc(p.id).update(Product(
                name: p.name,
                categoryName: 'Diğer',
                price: p.price,
                stock: p.stock)
            .toMap());
      }

      var categoryQuerySnapshot = await firestoreInstance
          .collection("categories")
          .where('name', isEqualTo: categoryName)
          .get();

      var categoryId = categoryQuerySnapshot.docs.first.id;

      await firestoreInstance.collection("categories").doc(categoryId).delete();
      return "Kategori Başaryla Silindi";
    } catch (e) {
      return "Kategori Silinemedi! Bir hata ile karşılaşıldı!";
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
      if (_allProductsCache == null) {
        final snapshot = await firestoreInstance
            .collection("products")
            .orderBy('name')
            .get();
        _allProductsCache =
            snapshot.docs.map((e) => Product.fromMap(e.data(), e.id)).toList();
        print("Ürünler Getirildi!");
      }
      return _allProductsCache!;
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
      if (_allProductsCache == null) {
        final snapshot = await firestoreInstance
            .collection("products")
            .orderBy('name')
            .get();
        _allProductsCache =
            snapshot.docs.map((e) => Product.fromMap(e.data(), e.id)).toList();
      }

      return _allProductsCache!
          .where((element) => normalizeTurkishChars(element.name!.toLowerCase())
              .contains(normalizeTurkishChars(searchText.toLowerCase())))
          .toList();
    } catch (e) {
      return [];
    }
  }
}

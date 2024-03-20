import 'package:atmacayapi/model/product.dart';
import 'package:atmacayapi/ui/productDetail_screen/controller/productDetail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;
  final ProductDetailController _productDetailController =
      Get.put(ProductDetailController());
  ProductDetailView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
            tooltip: "Düzenle",
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Uyarı"),
                    content: Text("Ürünü silmek istediğinize emin misiniz?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Hayır")),
                      TextButton(
                          onPressed: () {
                            _productDetailController.deleteProduct(product.id!);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Ürün Silindi!")));
                            Get.back();
                            Get.back();
                          },
                          child: Text("Evet")),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.delete),
            tooltip: "Sil",
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ürün Adı:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  product.name!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Divider(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ürün Fiyatı:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "${product.price!} ₺",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Divider(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ürün Adedi:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  product.stock!.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Divider(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ürün Kategorisi:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  product.categoryName!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

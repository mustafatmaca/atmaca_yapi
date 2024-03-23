// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:atmacayapi/ui/productDetail_screen/view/productDetail_view.dart';
import 'package:atmacayapi/ui/product_screen/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  final String category;
  ProductView({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController _productController =
        Get.put(ProductController(category: category));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => ListView.builder(
            itemCount: _productController.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Get.to(() => ProductDetailView(
                      product: _productController.products[index]));
                },
                title: Text(
                  _productController.products[index].name!,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "${_productController.products[index].price!.toStringAsFixed(_productController.products[index].price!.truncateToDouble() == _productController.products[index].price! ? 0 : 2)} ₺",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

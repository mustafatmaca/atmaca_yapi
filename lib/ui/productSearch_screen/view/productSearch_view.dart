import 'package:atmacayapi/ui/productSearch_screen/controller/productSearch_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductSearchView extends StatelessWidget {
  final ProductSearchController _productSearchController =
      Get.put(ProductSearchController());
  ProductSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Ürün ara...",
              hintStyle: Theme.of(context).textTheme.bodyLarge,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
            ),
            onChanged: (value) {
              _productSearchController.getProductsByName(value);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: _productSearchController.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _productSearchController.products[index].name!,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "${_productSearchController.products[index].price!.toStringAsFixed(_productSearchController.products[index].price!.truncateToDouble() == _productSearchController.products[index].price! ? 0 : 2)} ₺",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}

import 'package:atmacayapi/ui/addProduct_screen/controller/addProduct_controller.dart';
import 'package:atmacayapi/ui/category_screen/controller/category_controller.dart';
import 'package:flutter/material.dart';

AddProductController addProductController = AddProductController();
CategoryController categoryController = CategoryController();

class AddProductView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(),
    );
  }
}

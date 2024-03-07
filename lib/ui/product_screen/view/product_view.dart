import 'package:flutter/material.dart';

import '../controller/product_controller.dart';

final productController = ProductController();

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}

import 'package:atmacayapi/ui/category_screen/view/category_view.dart';
import 'package:atmacayapi/ui/productSearch_screen/view/productSearch_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Widget> pages = [CategoryView(), ProductSearchView()];
  RxInt index = 0.obs;

  void changePage(int number) {
    index.value = number;
  }
}

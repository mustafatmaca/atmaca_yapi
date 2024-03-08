import 'package:atmacayapi/ui/addCategory_screen/view/addCategory_view.dart';
import 'package:atmacayapi/ui/category_screen/view/category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Atmaca Yapı Malzemeleri",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
                tooltip: "Kategori Ekle",
                onPressed: () {
                  Get.to(() => AddCategoryView());
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: CategoryView());
  }
}

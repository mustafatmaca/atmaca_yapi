import 'package:atmacayapi/ui/category_screen/controller/category_controller.dart';
import 'package:atmacayapi/ui/custom_widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RefreshIndicator(
          onRefresh: () async {
            categoryController.getCategories();
          },
          child: Obx(() => categoryController.categories.isEmpty
              ? const CircularProgressIndicator()
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent:
                          MediaQuery.of(context).size.height * 0.18),
                  itemCount: categoryController.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                        title: categoryController.categories[index].name!);
                  },
                ))),
    );
  }
}

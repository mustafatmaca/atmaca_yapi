import 'package:atmacayapi/app/components/custom_widgets/category_widget.dart';
import 'package:atmacayapi/app/model/category_model.dart';
import 'package:atmacayapi/ui/base_screen/controller/base_controller.dart';
import 'package:atmacayapi/ui/category_screen/controller/category_controller.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  final BaseController baseController;
  final CategoryController categoryController;

  const CategoryView(
      {required this.baseController, required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            FutureBuilder<List<CategoryModel>>(
              future: categoryController.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 1.5),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return CategoryWidget(
                              categoryModel: snapshot.data![index],
                              baseController: baseController)
                          .showWidget(context);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Center(child: const CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}

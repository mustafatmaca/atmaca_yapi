import 'package:atmacayapi/app/model/category_model.dart';
import 'package:atmacayapi/app/theme/app_color.dart';
import 'package:atmacayapi/ui/base_screen/controller/base_controller.dart';
import 'package:flutter/material.dart';

class CategoryWidget {
  CategoryModel? categoryModel;
  BaseController baseController;

  CategoryWidget({this.categoryModel, required this.baseController});

  Widget showWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        baseController.index.value = 1;
        baseController.categoryId.value = categoryModel!.categoryId!;
        baseController.categoryName.value = categoryModel!.categoryName!;
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Card(
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  AppColor.mainRed,
                  Colors.red,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                categoryModel!.categoryName!,
                style: TextStyle(color: AppColor.mainWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:atmacayapi/app/theme/app_color.dart';
import 'package:atmacayapi/app/theme/app_theme.dart';
import 'package:atmacayapi/ui/addCategory_screen/controller/addCategory_controller.dart';
import 'package:atmacayapi/ui/base_screen/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AddCategoryController addCategoryController = AddCategoryController();

class AddCategoryView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.mainWhite,
          elevation: 1,
          title: Text(
            "Yeni Kategori Ekle",
            style: AppTheme.lightTheme.textTheme.headline1,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.mainRed,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.check,
                color: AppColor.mainRed,
              ),
              onPressed: () {
                addCategoryController.addCategory(nameController.text);
                Get.offAll(BaseView());
              },
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kategori İsmi',
                        style: AppTheme.lightTheme.textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Kategori ismini girin.",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.mainRed),
                                borderRadius: BorderRadius.circular(12.0))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

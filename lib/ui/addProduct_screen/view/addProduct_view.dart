import 'package:atmacayapi/app/model/category_model.dart';
import 'package:atmacayapi/app/theme/app_color.dart';
import 'package:atmacayapi/app/theme/app_theme.dart';
import 'package:atmacayapi/ui/addProduct_screen/controller/addProduct_controller.dart';
import 'package:atmacayapi/ui/base_screen/view/base_view.dart';
import 'package:atmacayapi/ui/category_screen/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AddProductController addProductController = AddProductController();
CategoryController categoryController = CategoryController();

class AddProductView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final CategoryModel dropdownValue = CategoryModel(categoryName: "Diğer");

  AddProductView({super.key});

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
            "Yeni Ürün Ekle",
            style: AppTheme.lightTheme.textTheme.headline1,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.mainRed,
            ),
            onPressed: () {
              addProductController.item_count.value = 1;
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
                addProductController.addProducts(
                    addProductController.selectedItem.value.categoryId!,
                    addProductController.selectedItem.value.categoryName!,
                    nameController.text,
                    nameController.text,
                    priceController.text,
                    addProductController.item_count.value);
                addProductController.item_count.value = 1;
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
                        'Ürün İsmi',
                        style: AppTheme.lightTheme.textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Ürün ismini girin.",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.mainRed),
                                borderRadius: BorderRadius.circular(12.0))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ürün Fiyatı',
                        style: AppTheme.lightTheme.textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: priceController,
                        decoration: InputDecoration(
                            hintText: "Ürün fiyatını girin.",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.mainRed),
                                borderRadius: BorderRadius.circular(12.0))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kategori',
                        style: AppTheme.lightTheme.textTheme.subtitle1,
                      ),

                      FutureBuilder<List<CategoryModel>>(
                        future: categoryController.getCategories(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            addProductController.selectedItem.value =
                                snapshot.data!.first;
                            return Obx(
                              () => DropdownButton<CategoryModel>(
                                value: addProductController.selectedItem.value,
                                icon: Icon(Icons.arrow_drop_down),
                                borderRadius: BorderRadius.circular(8),
                                isExpanded: true,
                                menuMaxHeight:
                                    MediaQuery.of(context).size.height * 0.3,
                                onChanged: (value) {
                                  addProductController.setSelected(value!);
                                },
                                items: snapshot.data!
                                    .map<DropdownMenuItem<CategoryModel>>(
                                        (CategoryModel value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.categoryName!),
                                  );
                                }).toList(),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return const CircularProgressIndicator();
                        },
                      )
                      // FutureBuilder<List<CategoryModel>>(
                      //   future: categoryController.getCategories(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       return Wrap(
                      //           spacing: 5.0,
                      //           children: List<Widget>.generate(
                      //             snapshot.data!.length,
                      //             (int index) {
                      //               return Obx(() => ChoiceChip(
                      //                     label: Text(
                      //                       snapshot.data![index].categoryName!,
                      //                       style: AppTheme
                      //                           .lightTheme.textTheme.bodyText1,
                      //                     ),
                      //                     selected: addProductController
                      //                             .index.value ==
                      //                         index,
                      //                     onSelected: (bool selected) {
                      //                       addProductController.index.value =
                      //                           (selected ? index : null)!;
                      //                       addProductController
                      //                               .indexName.value =
                      //                           snapshot
                      //                               .data![index].categoryName!;
                      //                     },
                      //                   ));
                      //             },
                      //           ).toList());
                      //     } else if (snapshot.hasError) {
                      //       return Text("${snapshot.error}");
                      //     }

                      //     return const CircularProgressIndicator();
                      //   },
                      // )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Stok Adedi",
                        style: AppTheme.lightTheme.textTheme.subtitle1,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () =>
                                addProductController.item_count.value > 0
                                    ? addProductController.item_count.value--
                                    : null,
                          ),
                          Obx(() => Text(addProductController.item_count.value
                              .toString())),
                          IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () =>
                                  addProductController.item_count.value++)
                        ],
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

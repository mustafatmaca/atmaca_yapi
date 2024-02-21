import 'package:atmacayapi/app/model/category_model.dart';
import 'package:atmacayapi/app/model/product_model.dart';
import 'package:atmacayapi/app/theme/app_color.dart';
import 'package:atmacayapi/app/theme/app_theme.dart';
import 'package:atmacayapi/ui/base_screen/controller/base_controller.dart';
import 'package:atmacayapi/ui/base_screen/view/base_view.dart';
import 'package:atmacayapi/ui/category_screen/controller/category_controller.dart';
import 'package:atmacayapi/ui/edit_screen/controller/edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

EditController editController = EditController();
CategoryController categoryController = CategoryController();

class EditView extends StatelessWidget {
  final TextEditingController nameUpdateController = TextEditingController();
  final TextEditingController priceUpdateController = TextEditingController();

  final ProductModel? productModel;
  final BaseController baseController;

  EditView(
      {super.key, required this.productModel, required this.baseController});

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
            "Ürünü Düzenle",
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
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Güncelle'),
                    content: const Text(
                        'Ürünü güncellemek istediğinize emin misiniz?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Vazgeç'),
                      ),
                      TextButton(
                        onPressed: () {
                          editController.updateProducts(
                              baseController.categoryId.value,
                              baseController.categoryName.value,
                              productModel!.productId!,
                              nameUpdateController.text,
                              priceUpdateController.text,
                              editController.item_count.value);
                          editController.item_count.value = 1;
                          Get.offAll(BaseView());
                        },
                        child: const Text('GÜNCELLE'),
                      ),
                    ],
                  ),
                );
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
                        //initialValue: productModel!.productName!,
                        controller: nameUpdateController,
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
                        //initialValue: productModel!.productPrice!,
                        controller: priceUpdateController,
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
                            return Wrap(
                                spacing: 5.0,
                                children: List<Widget>.generate(
                                  snapshot.data!.length,
                                  (int index) {
                                    return Obx(() => ChoiceChip(
                                          label: Text(
                                            snapshot.data![index].categoryName!,
                                            style: AppTheme
                                                .lightTheme.textTheme.bodyText1,
                                          ),
                                          selected:
                                              editController.index.value ==
                                                  index,
                                          onSelected: (bool selected) {
                                            editController.index.value =
                                                (selected ? index : null)!;
                                          },
                                        ));
                                  },
                                ).toList());
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return const CircularProgressIndicator();
                        },
                      )
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
                            onPressed: () => editController.item_count.value > 0
                                ? editController.item_count.value--
                                : null,
                          ),

                          // How set productStock to editController item_count
                          Obx(() =>
                              Text(editController.item_count.value.toString())),
                          IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () =>
                                  editController.item_count.value++)
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

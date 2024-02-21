import 'package:atmacayapi/app/model/product_model.dart';
import 'package:atmacayapi/app/theme/app_color.dart';
import 'package:atmacayapi/app/theme/app_theme.dart';
import 'package:atmacayapi/ui/base_screen/controller/base_controller.dart';
import 'package:atmacayapi/ui/base_screen/view/base_view.dart';
import 'package:atmacayapi/ui/detail_screen/controller/detail_controller.dart';
import 'package:atmacayapi/ui/edit_screen/view/edit_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

DetailController detailController = DetailController();

class DetailView extends StatelessWidget {
  final ProductModel? productModel;
  final BaseController baseController;

  const DetailView(
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
            productModel!.productName!,
            style: AppTheme.lightTheme.textTheme.displayLarge,
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
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("İsim",
                          style: AppTheme.lightTheme.textTheme.subtitle1),
                      Text(productModel!.productName!)
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Divider(
                    height: 1,
                    color: AppColor.mainRed,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fiyat",
                          style: AppTheme.lightTheme.textTheme.subtitle1),
                      Text(productModel!.productPrice! + " ₺")
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Divider(
                    height: 1,
                    color: AppColor.mainRed,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Stok Adedi",
                          style: AppTheme.lightTheme.textTheme.subtitle1),
                      Text(productModel!.productStock!.toString())
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.to(EditView(
                            productModel: productModel,
                            baseController: baseController));
                      },
                      child: Text("Düzenle")),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Sil'),
                            content: const Text(
                                'Ürünü silmek istediğinize emin misiniz?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Vazgeç'),
                              ),
                              TextButton(
                                onPressed: () {
                                  detailController.deleteProducts(
                                      baseController.categoryId.value,
                                      baseController.categoryName.value,
                                      productModel!.productId!);
                                  Get.offAll(BaseView());
                                },
                                child: const Text('SİL'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text("Sil")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

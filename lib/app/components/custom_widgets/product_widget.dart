import 'package:atmacayapi/app/model/product_model.dart';
import 'package:atmacayapi/app/theme/app_color.dart';
import 'package:atmacayapi/app/theme/app_theme.dart';
import 'package:atmacayapi/ui/base_screen/controller/base_controller.dart';
import 'package:atmacayapi/ui/detail_screen/view/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget {
  ProductModel? productModel;
  BaseController baseController;

  ProductWidget({this.productModel, required this.baseController});

  Widget showWidget(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              child: Text(
                productModel!.productName!,
                style: AppTheme.lightTheme.textTheme.labelMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text(
            productModel!.productPrice!.toString() + " ₺",
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
        ],
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      trailing: Icon(Icons.arrow_right),
      tileColor: AppColor.mainWhite,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      onTap: () {
        Get.to(DetailView(
          productModel: productModel,
          baseController: baseController,
        ));
      },
    );
  }
}

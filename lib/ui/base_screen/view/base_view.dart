import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:atmacayapi/app/theme/app_color.dart';
import 'package:atmacayapi/ui/addCategory_screen/view/addCategory_view.dart';
import 'package:atmacayapi/ui/addProduct_screen/view/addProduct_view.dart';
import 'package:atmacayapi/ui/base_screen/controller/base_controller.dart';
import 'package:atmacayapi/ui/category_screen/controller/category_controller.dart';
import 'package:atmacayapi/ui/category_screen/view/category_view.dart';
import 'package:atmacayapi/ui/product_screen/controller/product_controller.dart';
import 'package:atmacayapi/ui/product_screen/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

BaseController baseController = BaseController();
CategoryController categoryController = CategoryController();
ProductController productController = ProductController();

class BaseView extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final HawkFabMenuController hawkFabMenuController = HawkFabMenuController();

  final List<Widget> _widgetOptions = <Widget>[
    CategoryView(
      baseController: baseController,
      categoryController: categoryController,
    ),
    ProductView(
      baseController: baseController,
      //productController: productController,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: WillPopScope(
        onWillPop: () async {
          baseController.index.value = 0;
          return false;
        },
        child: Scaffold(
            appBar: buildAppBar(context),
            body: HawkFabMenu(
              icon: AnimatedIcons.menu_close,
              fabColor: AppColor.mainRed,
              iconColor: AppColor.mainWhite,
              hawkFabMenuController: hawkFabMenuController,
              items: [
                HawkFabMenuItem(
                  label: 'Kategori',
                  ontap: () {
                    Get.to(AddCategoryView());
                  },
                  icon: const Icon(Icons.category),
                  color: AppColor.mainRed,
                  labelColor: AppColor.mainRed,
                  labelBackgroundColor: AppColor.mainWhite,
                ),
                HawkFabMenuItem(
                  label: 'Ürün',
                  ontap: () {
                    Get.to(AddProductView());
                  },
                  icon: const Icon(Icons.shopping_cart),
                  color: AppColor.mainRed,
                  labelColor: AppColor.mainRed,
                  labelBackgroundColor: AppColor.mainWhite,
                ),
              ],
              body: Obx(
                () => Container(
                  child: _widgetOptions.elementAt(baseController
                      .index.value), //ProductView(baseController.index.value)
                ),
              ),
            )),
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.mainWhite,
      elevation: 1,
      title: Image.asset(
        "assets/images/atmacayapiyazi.png",
        width: 100,
        height: 75,
      ),
      actions: [
        AnimSearchBar(
          width: MediaQuery.of(context).size.width,
          color: AppColor.mainRed,
          textFieldColor: AppColor.mainRed,
          textController: textController,
          style: TextStyle(color: AppColor.mainWhite),
          onSuffixTap: () {},
          onSubmitted: (value) {},
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.close),
          closeSearchOnSuffixTap: true,
        ),
      ],
    );
  }
}

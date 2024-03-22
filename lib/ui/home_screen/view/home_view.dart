import 'package:atmacayapi/theme/app_color.dart';
import 'package:atmacayapi/ui/addCategory_screen/view/addCategory_view.dart';
import 'package:atmacayapi/ui/addProduct_screen/view/addProduct_view.dart';
import 'package:atmacayapi/ui/home_screen/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Atmaca Yapı Malzemeleri",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        floatingActionButton: SpeedDial(
          overlayOpacity: 0.2,
          overlayColor:
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? AppColor.backgroundLight
                  : AppColor.backgroundDark,
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: AppColor.textDark,
          activeBackgroundColor: Theme.of(context).primaryColor,
          activeForegroundColor: AppColor.textDark,
          icon: Icons.add,
          activeIcon: Icons.close,
          children: [
            SpeedDialChild(
              label: 'Kategori Ekle',
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColor.textDark),
              labelBackgroundColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: AppColor.textDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.library_add),
              onTap: () {
                Get.to(() => AddCategoryView());
              },
            ),
            SpeedDialChild(
              label: 'Ürün Ekle',
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColor.textDark),
              labelBackgroundColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: AppColor.textDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(Icons.add_box),
              onTap: () {
                Get.to(() => AddProductView());
              },
            )
          ],
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Anasayfa"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Ürün Ara")
              ],
              currentIndex: _homeController.index.value,
              onTap: (value) {
                _homeController.changePage(value);
              },
            )),
        body: Obx(() => _homeController.pages[_homeController.index.value]));
  }
}

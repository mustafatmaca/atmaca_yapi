import 'package:atmacayapi/ui/addCategory_screen/view/addCategory_view.dart';
import 'package:atmacayapi/ui/home_screen/controller/home_controller.dart';
import 'package:flutter/material.dart';
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
          actions: [
            IconButton(
                tooltip: "Kategori Ekle",
                onPressed: () {
                  Get.to(() => AddCategoryView());
                },
                icon: const Icon(Icons.add))
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

import 'package:atmacayapi/app/theme/app_color.dart';
import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        appBar: buildAppBar(context),
        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Atmaca",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: AppColor.mainWhite),
                    ),
                    Text(
                      "Yapı Malzemeleri",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColor.mainWhite),
                    )
                  ],
                ),
              ),
              ListTile(
                title: const Text("Kategori"),
                leading: const Icon(Icons.category),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: const Text("Ayarlar"),
                leading: const Icon(Icons.settings),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: const Text("Çıkış Yap"),
                leading: const Icon(Icons.logout),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.mainWhite,
      scrolledUnderElevation: 0,
      shape: Border(bottom: BorderSide(color: AppColor.mainRed, width: 1)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Atmaca",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Yapı Malzemeleri",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}

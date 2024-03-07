import 'package:atmacayapi/theme/app_color.dart';
import 'package:atmacayapi/ui/category_screen/view/category_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      ),
                    ],
                  ),
                  Icon(Icons.logout),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryView(),
                          ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                          color: AppColor.mainRed,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Center(
                        child: Text(
                          "Kategoriler",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColor.mainWhite),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.46,
                    height: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        color: AppColor.mainRed,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Center(
                      child: Text(
                        "Tüm Ürünler",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColor.mainWhite),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.46,
                    height: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        color: AppColor.mainRed,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Center(
                      child: Text(
                        "Kategori Ekle",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColor.mainWhite),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.46,
                    height: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        color: AppColor.mainRed,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Center(
                      child: Text(
                        "Ürün Ekle",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColor.mainWhite),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "Favori Ürünler",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColor.mainRed),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

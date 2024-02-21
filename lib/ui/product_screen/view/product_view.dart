import 'package:atmacayapi/app/components/custom_widgets/product_widget.dart';
import 'package:atmacayapi/app/model/product_model.dart';
import 'package:atmacayapi/app/theme/app_color.dart';
import 'package:atmacayapi/ui/base_screen/controller/base_controller.dart';
import 'package:flutter/material.dart';

import '../controller/product_controller.dart';

final productController = ProductController();

class ProductView extends StatelessWidget {
  final BaseController baseController;

  const ProductView({super.key, required this.baseController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: FutureBuilder<List<ProductModel>>(
                future: productController.getProducts(
                    baseController.categoryId.value,
                    baseController.categoryName.value),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length, //products.length
                      itemBuilder: (context, index) {
                        return ProductWidget(
                                productModel: snapshot.data![index],
                                baseController:
                                    baseController) //products.elementAt(index))
                            .showWidget(context);
                      },
                      separatorBuilder: (context, index) => Divider(
                        height: 1,
                        color: AppColor.mainRed,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return Center(child: const CircularProgressIndicator());
                },
              )),
        ],
      ),
    );
  }
}

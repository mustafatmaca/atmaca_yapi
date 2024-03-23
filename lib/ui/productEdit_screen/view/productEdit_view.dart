import 'package:atmacayapi/model/category.dart';
import 'package:atmacayapi/model/product.dart';
import 'package:atmacayapi/theme/app_color.dart';
import 'package:atmacayapi/ui/productEdit_screen/controller/productEdit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductEditView extends StatelessWidget {
  final Product product;
  ProductEditView({Key? key, required this.product}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ProductEditController _productEditController = Get.put(
        ProductEditController(
            name: product.name!,
            price: product.price!
                .toStringAsFixed(
                    product.price!.truncateToDouble() == product.price! ? 0 : 2)
                .toString(),
            stock: product.stock.toString(),
            category: product.categoryName!));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Düzenle",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _productEditController.updateProduct(Product(
                    id: product.id,
                    name: _productEditController.nameController.text,
                    categoryName:
                        _productEditController.selectedCategory.value.name,
                    price: double.tryParse(
                        _productEditController.priceController.text)!,
                    stock: int.tryParse(
                        _productEditController.stockController.text)!));
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Başarıyla Güncellendi")));
                Get.back();
              }
            },
            icon: const Icon(Icons.check),
            tooltip: "Kaydet",
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ürün İsmi",
                      ),
                    ),
                    TextFormField(
                      controller: _productEditController.nameController,
                      decoration: InputDecoration(
                          hintText: "Ürün ismini girin.",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Boş bırakılamaz.";
                        }
                        return null;
                      },
                      onSaved: (newValue) => _productEditController
                          .nameController.text = newValue!,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ürün Fiyatı",
                      ),
                    ),
                    TextFormField(
                      controller: _productEditController.priceController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'))
                      ],
                      decoration: InputDecoration(
                          hintText: "Ürünün fiyatını girin.",
                          suffixText: "₺",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Boş bırakılamaz.";
                        }
                        return null;
                      },
                      onSaved: (newValue) => _productEditController
                          .priceController.text = newValue!,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ürün Adedi",
                      ),
                    ),
                    TextFormField(
                      controller: _productEditController.stockController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          hintText: "Ürünün adedini girin.",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Boş bırakılamaz.";
                        }
                        return null;
                      },
                      onSaved: (newValue) => _productEditController
                          .stockController.text = newValue!,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kategori",
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? AppColor.textLight
                                : AppColor.textDark.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() => DropdownButton<Category>(
                              value:
                                  _productEditController.selectedCategory.value,
                              icon: Icon(Icons.arrow_drop_down),
                              dropdownColor:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? AppColor.backgroundLight
                                      : AppColor.backgroundDark,
                              underline: Container(),
                              borderRadius: BorderRadius.circular(8),
                              isExpanded: true,
                              items: _productEditController.categories
                                  .map<DropdownMenuItem<Category>>(
                                      (Category element) => DropdownMenuItem(
                                            child: Text(element.name!),
                                            value: element,
                                          ))
                                  .toList(),
                              onChanged: (value) {
                                _productEditController.setSelected(value!);
                              },
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:atmacayapi/model/category.dart';
import 'package:atmacayapi/theme/app_color.dart';
import 'package:atmacayapi/ui/addProduct_screen/controller/addProduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddProductView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final AddProductController _addProductController =
      Get.put(AddProductController());
  AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ürün Ekle",
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
            icon: const Icon(
              Icons.check,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _addProductController.addProduct(
                    _nameController.text,
                    _addProductController.selectedCategory.value.name!,
                    int.tryParse(_priceController.text)!,
                    int.tryParse(_stockController.text)!);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Başarıyla Kaydedildi")));
                Get.back();
              }
            },
          ),
        ],
      ),
      body: GestureDetector(
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
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Ürün ismini girin.",
                        hintStyle: Theme.of(context).textTheme.bodyLarge,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Boş bırakılamaz.";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _nameController.text = newValue!,
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
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: "Ürünün fiyatını girin.",
                        hintStyle: Theme.of(context).textTheme.bodyLarge,
                        suffixText: "₺",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Boş bırakılamaz.";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _priceController.text = newValue!,
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
                    controller: _stockController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: "Ürünün adedini girin.",
                        hintStyle: Theme.of(context).textTheme.bodyLarge,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Boş bırakılamaz.";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _stockController.text = newValue!,
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
                            value: _addProductController.selectedCategory.value,
                            icon: Icon(Icons.arrow_drop_down),
                            dropdownColor:
                                MediaQuery.of(context).platformBrightness ==
                                        Brightness.light
                                    ? AppColor.backgroundLight
                                    : AppColor.backgroundDark,
                            underline: Container(),
                            borderRadius: BorderRadius.circular(8),
                            isExpanded: true,
                            items: _addProductController.categories
                                .map<DropdownMenuItem<Category>>(
                                    (Category element) => DropdownMenuItem(
                                          child: Text(element.name!),
                                          value: element,
                                        ))
                                .toList(),
                            onChanged: (value) {
                              _addProductController.setSelected(value!);
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
    );
  }
}

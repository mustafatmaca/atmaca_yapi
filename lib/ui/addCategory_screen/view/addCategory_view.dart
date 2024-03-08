import 'package:atmacayapi/ui/addCategory_screen/controller/addCategory_controller.dart';
import 'package:atmacayapi/ui/category_screen/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final AddCategoryController _addCategoryController =
      Get.put(AddCategoryController());
  final CategoryController _categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kategori Ekle",
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
                _addCategoryController.addCategory(_nameController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Başarıyla Kaydedildi")));
                _categoryController.getCategories();
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
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        label: Text(
                          "Kategori",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        hintText: "Kategori ismini girin.",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

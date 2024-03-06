import 'package:atmacayapi/ui/login_screen/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _loginController = LoginController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/atmacayapi.png",
                  width: 100,
                  height: 75,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      label: Text("Email")),
                  validator: (value) {
                    if (value!.isEmpty || value == "") {
                      return "Boş olamaz!";
                    }
                    return null;
                  },
                  onSaved: (newValue) => _emailController.text = newValue!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      label: Text("Şifre")),
                  validator: (value) {
                    if (value!.isEmpty || value == "") {
                      return "Boş olamaz!";
                    }
                    return null;
                  },
                  onSaved: (newValue) => _passwordController.text = newValue!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _loginController.signIn(
                            _emailController.text, _passwordController.text);
                        if (_loginController.statusMessage.value.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Obx(() =>
                                Text(_loginController.statusMessage.value)),
                          ));
                        }
                      }
                    },
                    child: const Text("Giriş Yap"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:atmacayapi/theme/app_theme.dart';
import 'package:atmacayapi/firebase_options.dart';
import 'package:atmacayapi/ui/home_screen/view/home_view.dart';
import 'package:atmacayapi/ui/login_screen/view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Atmaca Yapi",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeView();
          } else {
            return LoginView();
          }
        },
      ),
    ),
  );
}

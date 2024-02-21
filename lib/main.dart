import 'package:atmacayapi/app/theme/app_theme.dart';
import 'package:atmacayapi/firebase_options.dart';
import 'package:atmacayapi/ui/splash_screen/view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Atmaca Yapi",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: SplashView(),
    );
  }
}

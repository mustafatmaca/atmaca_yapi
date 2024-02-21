import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:atmacayapi/ui/base_screen/view/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      right: true,
      bottom: true,
      left: true,
      child: AnimatedSplashScreen(
          splash: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Image.asset("assets/images/atmacayapi.png"),
            ),
          ),
          nextScreen: BaseView(),
          splashIconSize: 250,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.bottomToTop),
    );
  }
}

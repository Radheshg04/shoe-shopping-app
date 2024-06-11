import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: LottieBuilder.asset(
        "assets/lottie/sneakers_walking.json",
        frameRate: FrameRate.max,
        // backgroundLoading: true,
      ),
      nextScreen: const HomePage(),
      splashIconSize: 100,
      backgroundColor: Colors.white,

      pageTransitionType: PageTransitionType.fade,

      // pageTransitionType: const CupertinoPageTransitionsBuilder(),
    );
  }
}

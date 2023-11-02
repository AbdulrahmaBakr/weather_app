import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:weather_app/utilis/app_colors.dart';
import 'package:weather_app/view/search/search_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: AnimatedSplashScreen(
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: AppColors.mainColor,
        duration: 1000,
        splashIconSize: 200,
        splash: Image.asset('assets/splash.png'),
        nextScreen:   SearchScreen(),
        splashTransition: SplashTransition.sizeTransition,
        
      ),
    );
  }
}

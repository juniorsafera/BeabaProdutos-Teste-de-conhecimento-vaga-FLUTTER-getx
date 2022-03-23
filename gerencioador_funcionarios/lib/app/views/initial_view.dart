import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home_view.dart';

class InitialView extends StatelessWidget {
  const InitialView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreenView(
      navigateRoute: const HomeView(),
      duration: 3,
      imageSize: 180,
      imageSrc: "assets/logo.png",
      backgroundColor: Colors.white,
    ));
  }
}
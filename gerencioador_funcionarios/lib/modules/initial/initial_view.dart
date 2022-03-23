import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/modules/home/home_view.dart';
import 'package:gerencioador_funcionarios/utils/rotas.dart';
 
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'initial_controller.dart';

class InitinalView extends GetView<InitialController> {
  const InitinalView({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
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

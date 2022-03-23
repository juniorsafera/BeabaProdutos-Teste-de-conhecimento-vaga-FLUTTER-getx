import 'package:flutter/material.dart';
 
  
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

 

void main() {
  runApp(GetMaterialApp(
    initialRoute: Rotas.initial,
    getPages: AppPages.routes,
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(home: ViewPrincipal());
//   }
// }

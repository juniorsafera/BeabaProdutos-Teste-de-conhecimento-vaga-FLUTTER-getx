import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/views/view_principal.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp( const GetMaterialApp(
    home: ViewPrincipal(),
  ) );
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(home: ViewPrincipal());
//   }
// }

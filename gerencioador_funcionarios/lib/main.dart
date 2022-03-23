import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/components/form_cadastro.dart';
import 'package:gerencioador_funcionarios/components/form_funcionario.dart';
import 'package:gerencioador_funcionarios/modules/home/home_binding.dart';
import 'package:gerencioador_funcionarios/modules/home/home_view.dart';
import 'package:gerencioador_funcionarios/modules/initial/initial_view.dart';
  
import 'package:get/get.dart';

import 'utils/rotas.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: Rotas.initial,
    getPages: [
      GetPage(
        name: Rotas.initial,
        page: () => const InitinalView(),
        binding: HomeBinding(),
      ),
      GetPage(name: Rotas.home, page: () => const HomeView()),
      GetPage(name: Rotas.cadastro, page: () => const FormCadastro()),
      GetPage(name: Rotas.formulario, page: () => const FormFuncionario()),
    ],
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

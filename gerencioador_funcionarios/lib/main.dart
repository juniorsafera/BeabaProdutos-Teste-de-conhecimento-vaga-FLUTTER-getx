import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/components/form_cadastro.dart';
import 'package:gerencioador_funcionarios/components/form_funcionario.dart';
// import 'package:gerencioador_funcionarios/views/view_login.dart';
import 'package:gerencioador_funcionarios/views/view_principal.dart';
import 'package:get/get.dart';
 
import 'utils/rotas.dart';

void main() {
  runApp(  GetMaterialApp(
     initialRoute: Rotas.home,
      getPages: [
        GetPage(name: Rotas.home, page: ()=> const ViewPrincipal()),
        GetPage(name: Rotas.cadastro, page: ()=> const FormCadastro()),
        GetPage(name: Rotas.formulario, page: ()=> const  FormFuncionario()),
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

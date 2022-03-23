 
import 'package:gerencioador_funcionarios/app/bindings/binding.dart';
import 'package:gerencioador_funcionarios/app/components/form_cadastro.dart';
import 'package:gerencioador_funcionarios/app/components/form_funcionario.dart';
import 'package:gerencioador_funcionarios/app/views/home_view.dart';
import 'package:gerencioador_funcionarios/app/views/initial_view.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
   
  static final routes = [
    GetPage(
      name: Rotas.initial,
      page: () => const InitialView(),
    ),
    GetPage(
      name: Rotas.home,
      page: () => const HomeView(),
      binding: Binding(),
    ),
    GetPage(
      name: Rotas.cadastro,
      page: () => const FormCadastro(),
      binding: Binding(),
    ),
    GetPage(
      name: Rotas.formulario,
      page: () => const FormFuncionario(),
      binding: Binding(),
    ),
  ];
}

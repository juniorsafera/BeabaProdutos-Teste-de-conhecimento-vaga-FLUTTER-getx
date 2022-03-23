import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/app/Controller/controller.dart';
import 'package:gerencioador_funcionarios/app/routes/app_routes.dart';
import 'package:get/get.dart';
import '../components/lista_funcionarios.dart';
 
class HomeView extends GetView<Controller> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionários'),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          // BOTAO PARA CHAMAR A TELA DE CADASTRO
          IconButton(
              onPressed: () {
                Get.toNamed(Rotas.cadastro);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const SafeArea(
        child: ListaFuncionariosWidget(),
      ),
    );
  }
}

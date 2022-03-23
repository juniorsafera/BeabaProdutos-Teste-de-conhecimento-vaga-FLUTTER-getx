 
import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/utils/rotas.dart';
import 'package:get/get.dart';
 
import '../../components/lista_funcionarios.dart';
import '../../data/dados.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
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
      body: SafeArea(
        child:
            // ABAIXO SE A LISTA DE FUNCIONARIOS ESTIVER VAZIA NOTIFICAR,
            // CASO CONTRARIO EXIBIR A LISTA DE FUNCIONARIOS
            listaFuncionarios.isEmpty
                ? const Center(
                    child: Text('Nenhum funcionário cadastrado!'),
                  )
                : const ListaFuncionarios(),
      ),
    );
  }
}

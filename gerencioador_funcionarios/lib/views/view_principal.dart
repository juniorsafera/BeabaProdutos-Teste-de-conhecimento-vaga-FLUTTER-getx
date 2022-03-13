import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/Controller/controller.dart';
import 'package:gerencioador_funcionarios/components/form_cadastro.dart';
import 'package:gerencioador_funcionarios/components/lista_funcionarios.dart';
import 'package:gerencioador_funcionarios/model/model_funcionario.dart';
import 'package:get/get.dart';

class ViewPrincipal extends StatefulWidget {
  const ViewPrincipal({Key? key}) : super(key: key);

  @override
  State<ViewPrincipal> createState() => _ViewPrincipalState();
}

class _ViewPrincipalState extends State<ViewPrincipal> {
  @override
  Widget build(BuildContext context) {
    // final providerFuncionarios = Provider.of<FuncionariosProvider>(context);
    final c = Controller();
    final List<ModelFuncionario> listaFuncionarios = c.funcionariosCadastrados;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionários'),
        centerTitle: true,
        actions: [
          // BOTAO PARA CHAMAR A TELA DE CADASTRO
          IconButton(
              onPressed: () {
                Get.to(const FormCadastro());
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
                :const ListaFuncionarios(),
      ),
    );
  }
}

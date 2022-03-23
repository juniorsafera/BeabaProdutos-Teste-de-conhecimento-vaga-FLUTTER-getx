import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/app/Controller/controller.dart';
import 'package:gerencioador_funcionarios/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListaFuncionariosWidget extends GetView<Controller>{
  const ListaFuncionariosWidget({Key? key}) : super(key: key);

  

   @override
  Widget build (BuildContext context){
     return GetBuilder<Controller>(
        init: Controller(),
        builder: (crtl) {
          if(crtl.funcionariosCadastrados.isEmpty){
                return const Center(child: Text('Nenhum funcionário cadastrado!'),);
          } else {
          return ListView.builder(
            itemCount: crtl.funcionariosCadastrados.length,
            itemBuilder: (context, index) {
              final _funcionario = crtl.funcionariosCadastrados[index];
              return Card(
                elevation: 6,
                child: ListTile(
                    title: Text(
                      _funcionario.nome,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contratado: ${DateFormat('dd/MM/y').format(_funcionario.dataContratacao)}',
                          style: const TextStyle(color: Colors.green),
                        ),
                        Text(
                          'Cargo: ${_funcionario.cargo}',
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Setor: ${_funcionario.setor}',
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Nascimento: ${DateFormat('dd/MM/y').format(_funcionario.dataNascimento)}',
                          style: const TextStyle(color: Colors.black),
                        ),
                        _funcionario.demitido == false
                            ? const Text('')
                            : Text(
                                'Demitido: ${DateFormat('dd/MM/y').format(_funcionario.dataDemissao!)}',
                                style: const TextStyle(color: Colors.red),
                              ),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 80,
                      height: 30,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.toNamed(Rotas.formulario,
                                  arguments:
                                      crtl.funcionariosCadastrados[index]);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                    'Deseja remover ${_funcionario.nome}?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // providerFuncionarios.remover(_funcionario);
                                      crtl.remover(_funcionario);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            },
          );
          }
        });
   }
 }
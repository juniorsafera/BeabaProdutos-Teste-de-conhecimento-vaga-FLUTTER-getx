 
import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/model/model_funcionario.dart';
import 'package:intl/intl.dart';

import 'form_funcionario.dart';
 

class ListaFuncionarios extends StatelessWidget {
  final List<ModelFuncionario> funcionarios;
  const ListaFuncionarios({Key? key, required this.funcionarios})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // RECUPERAR DADOS POR PROVIDER
    // final providerFuncionarios = Provider.of<FuncionariosProvider>(context);

    return  ListView.builder(
      itemCount: funcionarios.length,
      itemBuilder: (context, index) {
        final _funcionario = funcionarios[index];
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormFuncionario(
                                    funcionario: funcionarios[index],
                                  )),
                        );
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
                          title: Text('Deseja remover ${_funcionario.nome}?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // providerFuncionarios.remover(_funcionario);
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
}
 
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/app/Controller/controller.dart';
import 'package:gerencioador_funcionarios/app/model/model_funcionario.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CadastroView extends GetView<Controller>{
  const CadastroView({Key? key}) : super(key: key);

  



  @override
  Widget build (BuildContext context ){

    DateTime? _dataSelecionada;
final TextEditingController cNome = TextEditingController();
final TextEditingController cCargo = TextEditingController();
final TextEditingController cSetor = TextEditingController();
final Controller control = Get.put(Controller());



    // limpar campos ao cadastrar funcionário
void limpar() {
  cNome.clear();
  cCargo.clear();
  cSetor.clear();
  _dataSelecionada = null;
}


          // chamar calendário para selecionar data nascimetno
    _abrirCalendario() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime.now(),
      ).then((value) {
        if (value == null) {
          return;
        }
        
          _dataSelecionada = value;
         
      });
    }





    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionário'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // ignore: prefer_const_literals_to_create_immutables
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: cNome,
                // initialValue: _dadosForm['nome'],
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Nome Completo'),
              ),
              TextFormField(
                controller: cCargo,
                // initialValue: _dadosForm['cargo'],
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Cargo'),
              ),
              TextFormField(
                controller: cSetor,
                // initialValue: _dadosForm['setor'],
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Setor'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        _abrirCalendario();
                      },
                      child:const Text('Selecionar data Nascimento'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    _dataSelecionada == null
                        ? const Text('')
                        : Text(
                            DateFormat('dd/MM/y').format(_dataSelecionada!),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:const Text('Cancelar'),
                    ),
                   const  SizedBox(
                      width: 10,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        // VALIDAR CAMPOS PARA NAO RECEBER DADOS NULOS
                        if (cNome.text.isEmpty ||
                            cCargo.text.isEmpty ||
                            cSetor.text.isEmpty ||
                            _dataSelecionada == null) {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Atenção'),
                              content: const Text(
                                  'Preencha todos os dados corretamente!'),
                              actions: <Widget>[
                                // ignore: deprecated_member_use
                                FlatButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        } else {
                           
                          control.cadastrar(ModelFuncionario(
                            id: Random.secure().toString(),
                            nome: cNome.text,
                            cargo: cCargo.text,
                            setor: cSetor.text,
                            dataNascimento: _dataSelecionada!,
                            dataContratacao: DateTime.now(),
                          ));

                          limpar();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
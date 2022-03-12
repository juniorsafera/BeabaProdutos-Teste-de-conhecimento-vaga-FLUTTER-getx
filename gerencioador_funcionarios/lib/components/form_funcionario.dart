 
import 'package:flutter/material.dart';
import 'package:gerencioador_funcionarios/model/model_funcionario.dart';
import 'package:intl/intl.dart';
 

class FormFuncionario extends StatefulWidget {
  final ModelFuncionario funcionario;
  const FormFuncionario({Key? key, required this.funcionario})
      : super(key: key);

  @override
  State<FormFuncionario> createState() => _FormFuncionarioState();
}

// VARIAVEL PARA MANIPULAR VALOR DE CALENDARIO
DateTime? _dataSelecionada;
// CONTROLLERS PARA MANIPULAR VALORES DE TEXTFIELDS
final TextEditingController cNome = TextEditingController();
final TextEditingController cCargo = TextEditingController();
final TextEditingController cSetor = TextEditingController();

bool? _demitido;
DateTime? dataHoje;
String? id;
String? nome;

class _FormFuncionarioState extends State<FormFuncionario> {
  @override
  void initState() {
    super.initState();
    // INICIALIZANDO CAMPOS PARA MANIPULAÇÃO DE DADOS
    _dataSelecionada = widget.funcionario.dataNascimento;
    id = widget.funcionario.id;
    nome = widget.funcionario.nome;
    cNome.text = widget.funcionario.nome;
    cCargo.text = widget.funcionario.cargo;
    cSetor.text = widget.funcionario.setor;
    _demitido = widget.funcionario.demitido;
  }

  // limpar campos
  void limpar() {
    cNome.clear();
    cCargo.clear();
    cSetor.clear();
    _dataSelecionada = null;
  }

  @override
  Widget build(BuildContext context) {
    // RECUPERAR DADOS POR PROVIDER
    // final providerFuncionarios = Provider.of<FuncionariosProvider>(context);

    //  CHAMAR CALENDÁRIO PARA SELECIONAR DATA NASCIMENTO
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
        setState(() {
          _dataSelecionada = value;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados o funcionário'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // ignore: prefer_const_literals_to_create_immutables
          padding: const EdgeInsets.all(15),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: cNome,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: 'Nome Completo'),
                ),
                TextFormField(
                  controller: cCargo,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: 'Cargo'),
                ),
                TextFormField(
                  controller: cSetor,
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
                        child: const Text('Selecionar data Nascimento'),
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
                Row(
                  children: [
                    const Text('Demitido'),
                    Switch(
                        value: _demitido!,
                        onChanged: (bool v) {
                          setState(() {
                            _demitido = v;
                            if (v == true) {
                              dataHoje = DateTime.now();
                            }
                          });
                        }),
                  ],
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
                        child: const Text('Cancelar'),
                      ),
                      const SizedBox(
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
                            // SALVAR DADOS ALTERADOS DE FUNCIONÁRIO
                            // providerFuncionarios.alterar(
                            //   ModelFuncionario(
                            //     id: id!,
                            //     nome: cNome.text,
                            //     cargo: cCargo.text,
                            //     setor: cSetor.text,
                            //     dataNascimento: _dataSelecionada!,
                            //     dataContratacao:
                            //         widget.funcionario.dataContratacao,
                            //     demitido: _demitido!,
                            //     dataDemissao: dataHoje,
                            //   ),
                            // );

                            // LIMPAR E FECHAR TELA AO SALVAR
                            limpar();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Salvar'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
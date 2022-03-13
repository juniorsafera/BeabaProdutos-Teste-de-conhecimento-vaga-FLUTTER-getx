import 'dart:math';

import 'package:gerencioador_funcionarios/data/dados.dart';
import 'package:gerencioador_funcionarios/model/model_funcionario.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller get to => Get.find();

  final Map<String, ModelFuncionario> _funcionarios = {...listaFuncionarios};

  List<ModelFuncionario> get funcionariosCadastrados =>
      [..._funcionarios.values];

  int get count {
    return _funcionarios.length;
  }

  void cadastrar(ModelFuncionario funcionario) {
    // ADICIONAR UM NOVO FUNCIONARIO NO BANCO
    final id = Random().nextDouble().toString();
    _funcionarios.putIfAbsent(
      id,
      () => ModelFuncionario(
        id: id,
        nome: funcionario.nome,
        cargo: funcionario.cargo,
        setor: funcionario.setor,
        dataNascimento: funcionario.dataNascimento,
        dataContratacao: DateTime.now(),
        demitido: false,
      ),
    );

    update();
  }

  void remover(ModelFuncionario funcionario) {
    // REMOVER FUNCIONARIO DO BANCO
    if (funcionario != null && funcionario.id != null) {
      _funcionarios.remove(funcionario.id);
      update();
    }
  }

  void alterar(ModelFuncionario funcionario) {
    // ATERAR DADOS DE FUNCIONARIO
    _funcionarios.update(
      funcionario.id,
      (_) => ModelFuncionario(
        id: funcionario.id,
        nome: funcionario.nome,
        cargo: funcionario.cargo,
        setor: funcionario.setor,
        dataNascimento: funcionario.dataNascimento,
        dataContratacao: funcionario.dataContratacao,
        demitido: funcionario.demitido,
        dataDemissao: funcionario.dataDemissao,
      ),
    );
    update();
  }
}

import 'dart:convert';

class ModelTeste {
  final String id;
  final String nome;
  final String sobrenome;
  ModelTeste({
    required this.id,
    required this.nome,
    required this.sobrenome,
  });

  ModelTeste copyWith({
    String? id,
    String? nome,
    String? sobrenome,
  }) {
    return ModelTeste(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      sobrenome: sobrenome ?? this.sobrenome,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'nome': nome});
    result.addAll({'sobrenome': sobrenome});
  
    return result;
  }

  factory ModelTeste.fromMap(Map<String, dynamic> map) {
    return ModelTeste(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      sobrenome: map['sobrenome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelTeste.fromJson(String source) => ModelTeste.fromMap(json.decode(source));

  @override
  String toString() => 'ModelTeste(id: $id, nome: $nome, sobrenome: $sobrenome)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ModelTeste &&
      other.id == id &&
      other.nome == nome &&
      other.sobrenome == sobrenome;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ sobrenome.hashCode;
}

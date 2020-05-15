import 'package:pressaoarterialapp/Helpers/banco_helper.dart';

class Atividade {
  BancoHelper bh = BancoHelper();
  int id;
  String nome;

  Atividade(
      {this.id,
        this.nome,});

  Atividade.fromMap(Map map) {
    id = map[bh.atividades_idColumn];
    nome = map[bh.atividades_nomeColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      bh.atividades_nomeColumn  : nome,
    };
    if(id != null) {
      map[bh.atividades_idColumn] = id;
    }
    return map;

  }

  Map<String,dynamic> toJson() => {
    'id': id,
    'nome': nome,
  };

  factory Atividade.fromJson(Map obj) {
    return Atividade(
      id: obj['id'],
      nome: obj['nome'],);
  }
}

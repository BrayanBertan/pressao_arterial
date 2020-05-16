import 'package:pressaoarterialapp/Helpers/banco_helper.dart';

class Usuario {
  BancoHelper bh = BancoHelper();
  int id;
  String nome;
  String senha;
  String email;
  String icone;

  Usuario({
    this.nome,
    this.senha,
    this.email,
    this.icone,
  });

  Usuario.fromMap(Map map) {
    id = map[bh.usuario_idColumn];
    nome = map[bh.usuario_nomeColumn];
    senha = map[bh.usuario_senhaColumn];
    email = map[bh.usuario_emailColumn];
    icone = map[bh.usuario_iconeColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      bh.usuario_nomeColumn : nome,
      bh.usuario_senhaColumn : senha,
      bh.usuario_emailColumn :   email,
      bh.usuario_iconeColumn :    icone,
    };
    if(id != null) {
      map[bh.usuario_idColumn] = id;
    }
    return map;

  }
  @override
  String toString() {
    // TODO: implement toString
    return "Nome: $nome";
  }
}

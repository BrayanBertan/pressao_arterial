import 'package:pressaoarterialapp/Helpers/banco_helper.dart';

class Perfil {
  BancoHelper bh = BancoHelper();
  int id;
  String nome;
  String icone;

  Perfil({
    this.nome,
    this.icone,
  });

  Perfil.fromMap(Map map) {
    id = map[bh.usuario_idColumn];
    nome = map[bh.usuario_nomeColumn];
    icone = map[bh.usuario_iconeColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      bh.usuario_nomeColumn : nome,
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
    return "id: $id Nome: $nome icone: $icone";
  }
}

import 'package:pressaoarterialapp/Helpers/banco_helper.dart';

class AtividadePressao {
  BancoHelper bh = BancoHelper();
  int id;
  int idPressao;
  int idAtividade;

  AtividadePressao({
    this.idPressao,
    this.idAtividade,
  });

  AtividadePressao.fromMap(Map map) {
    id = map[bh.atividadesPressao_idColumn];
    idPressao = map[bh.atividadesPressao_idPressaoColumn];
    idAtividade = map[bh.atividadesPressao_idAtividadeColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      bh.atividadesPressao_idPressaoColumn : idPressao,
      bh.atividadesPressao_idAtividadeColumn : idAtividade,
    };
    if(id != null) {
      map[bh.atividadesPressao_idColumn] = id;
    }
    return map;

  }
  @override
  String toString() {
    // TODO: implement toString
    return "ID: $id";
  }
}

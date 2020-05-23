import 'package:pressaoarterialapp/Helpers/banco_helper.dart';

class MedicamentoPressao {
  BancoHelper bh = BancoHelper();
  int id;
  int idPressao;
  int idMedicamento;

  MedicamentoPressao({
    this.idPressao,
    this.idMedicamento,
  });

  MedicamentoPressao.fromMap(Map map) {
    id = map[bh.medicamentosPressao_idColumn];
    idPressao = map[bh.medicamentosPressao_idPressaoColumn];
    idMedicamento = map[bh.medicamentosPressao_idMedicamentoColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      bh.medicamentosPressao_idPressaoColumn : idPressao,
      bh.medicamentosPressao_idMedicamentoColumn : idMedicamento,
    };
    if(id != null) {
      map[bh.medicamentosPressao_idColumn] = id;
    }
    return map;

  }
  @override
  String toString() {
    // TODO: implement toString
    return "ID: ${this.id} ${idMedicamento} ${idPressao}";
  }
}

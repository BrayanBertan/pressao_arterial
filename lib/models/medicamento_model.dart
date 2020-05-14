
import 'package:pressaoarterialapp/Helpers/banco_helper.dart';
import 'package:pressaoarterialapp/Helpers/medicamento_helper.dart';

class Medicamento {
  BancoHelper bh = BancoHelper();
  MedicamentoHelper mh = MedicamentoHelper();
  int id;
  String nome;
  int dose;
  int quantidade_diaria;
  int id_unidade;
  int id_tipo;
  String anotacao;

  //Medicamento();
  Medicamento({
    this.nome,
    this.dose,
    this.quantidade_diaria,
    this.id_unidade,
    this.id_tipo,
    this.anotacao,
  });

  Medicamento.fromMap(Map map) {
    id = map[bh.medicamento_idColumn];
    nome = map[bh.medicamento_nomeColumn];
    dose = map[bh.medicamento_doseColumn];
    quantidade_diaria = map[bh.medicamento_quantidade_diariaColumn];
    id_unidade = map[bh.medicamento_id_unidadeColumn];
    id_tipo = map[bh.medicamento_id_tipoColumn];
    anotacao = map[bh.medicamento_anotacaoColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      bh.medicamento_nomeColumn : nome,
      bh.medicamento_doseColumn  : dose,
      bh.medicamento_quantidade_diariaColumn : quantidade_diaria,
      bh.medicamento_id_unidadeColumn :   id_unidade,
      bh.medicamento_id_tipoColumn :    id_tipo,
      bh.medicamento_anotacaoColumn :  anotacao,
    };
    if(id != null) {
      map[bh.medicamento_idColumn] = id;
    }
    return map;

  }
  @override
  String toString() {
    // TODO: implement toString
    return "Nome: $nome";
  }

  /*factory Medicamento.fromJson(Map<String, dynamic> obj) {
    return Medicamento(
        nome: obj['nome'],
        dose: double.parse(obj['dose']),
        quantidade_diaria: int.parse(obj['quantidade_diaria']),
        id_unidade: int.parse(obj['id_unidade']),
        id_tipo: int.parse(obj['id_tipo']),
        anotacao: obj['anotacao']);
  }*/
}

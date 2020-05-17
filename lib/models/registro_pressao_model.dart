
import 'package:pressaoarterialapp/Helpers/banco_helper.dart';
class RegistroPressao {
  BancoHelper bh = BancoHelper();
  int id;
  double sistolica;
  double diastolica;
  double pulso;
  int postura;
  int braco;
  String anotacao;
  DateTime dataHora;
  int id_usuario;

  RegistroPressao({
    this.sistolica,
    this.diastolica,
    this.pulso,
    this.postura,
    this.braco,
    this.anotacao,
    this.dataHora,
    this.id_usuario
  });

  RegistroPressao.fromMap(Map map) {
    id = map[bh.registroPressao_idColumn];
    sistolica = map[bh.registroPressao_sistolicaColumn];
    diastolica = map[bh.registroPressao_diastolicaColumn];
    pulso = map[bh.registroPressao_pulsoColumn];
    postura = map[bh.registroPressao_posturaColumn];
    braco = map[bh.registroPressao_bracoColumn];
    anotacao = map[bh.registroPressao_anotacaoColumn];
    dataHora = new DateTime.fromMillisecondsSinceEpoch(map[bh.registroPressao_dateTimeColumn] * 1000);
    id_usuario = map[bh.registroPressao_idUsuarioColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      bh.registroPressao_sistolicaColumn : sistolica,
      bh.registroPressao_diastolicaColumn : diastolica,
      bh.registroPressao_pulsoColumn :   pulso,
      bh.registroPressao_posturaColumn :    postura,
      bh.registroPressao_bracoColumn :    braco,
      bh.registroPressao_anotacaoColumn :  anotacao,
      bh.registroPressao_dateTimeColumn : ((dataHora).millisecondsSinceEpoch/1000).round(),
      bh.registroPressao_idUsuarioColumn :  id_usuario,
    };
    if(id != null) {
      map[bh.registroPressao_sistolicaColumn] = id;
    }
    return map;

  }

  Map<String,dynamic> toJson() => {
    'id': id,
    'sistolica': sistolica,
  };
  @override
  String toString() {
    // TODO: implement toString
    return "Sistolica: $sistolica";
  }
}

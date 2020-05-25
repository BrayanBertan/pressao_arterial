import 'dart:async';

import 'package:pressaoarterialapp/models/atividade_model.dart';
import 'package:pressaoarterialapp/pages/configuracao_global.dart' as gc;
import 'package:sqflite/sqflite.dart';
import 'package:pressaoarterialapp/Helpers/banco_helper.dart';

class AtividadeHelper {
  BancoHelper bh = BancoHelper();
  static final AtividadeHelper _instance = AtividadeHelper.internal();
  factory AtividadeHelper() => _instance;
  AtividadeHelper.internal();

  Future<List<Atividade>> getAllAtividades() async {
    Database dbAtividade = await bh.db;
    List<Map> listMaps =
        await dbAtividade.rawQuery("SELECT * FROM AtividadesTable");

    List<Atividade> listaAtividade = List();
    for (Map m in listMaps) {
      listaAtividade.add(Atividade.fromMap(m));
    }
    return listaAtividade;
  }

  Future<List<Atividade>> getAllAtividadesRelacionadas(int pressao) async {
    Database dbAtividade = await bh.db;
    List<Map> listMaps = await dbAtividade.rawQuery(
        "SELECT b.atividades_idColumn,b.atividades_nomeColumn FROM ${bh.AtividadesPressaoTable} AS a INNER JOIN ${bh.AtividadesTable} AS b ON b.atividades_idColumn = a.atividadesPressao_idAtividadeColumn WHERE a.atividadesPressao_idPressaoColumn = ${pressao} ORDER BY  b.atividades_idColumn ASC");

    List<Atividade> listaAtividade = List();
    for (Map m in listMaps) {
      listaAtividade.add(Atividade.fromMap(m));
    }
    return listaAtividade;
  }

  Future<List<Atividade>> getAllAtividadesFiltro(int usuario) async {
    Database dbAtividade = await bh.db;
    List<Map> listMaps = await dbAtividade.rawQuery(
        "SELECT c.atividades_idColumn,c.atividades_nomeColumn "
        "FROM ${bh.RegistroPressaoTable} AS a "
        "INNER JOIN ${bh.AtividadesPressaoTable} AS b "
        "ON b.atividadesPressao_idPressaoColumn = a.registroPressao_idColumn "
        "INNER JOIN ${bh.AtividadesTable} AS c "
        "ON c.atividades_idColumn = b.atividadesPressao_idAtividadeColumn "
        "WHERE a.registroPressao_idUsuarioColumn = ${gc.perfilSelecionado.id} GROUP BY c.atividades_idColumn,c.atividades_nomeColumn ");

    List<Atividade> listaAtividade = List();
    for (Map m in listMaps) {
      listaAtividade.add(Atividade.fromMap(m));
    }
    return listaAtividade;
  }

  /*Future close() async{
    Database dbMedicamento = await bh.db;
    dbMedicamento.close();
  }*/
}

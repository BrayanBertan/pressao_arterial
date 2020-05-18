import 'dart:async';

import 'package:pressaoarterialapp/models/atividade_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pressaoarterialapp/Helpers/banco_helper.dart';



class AtividadeHelper{
  BancoHelper bh = BancoHelper();
  static final AtividadeHelper _instance = AtividadeHelper.internal();
  factory  AtividadeHelper() => _instance;
  AtividadeHelper.internal();


  Future<List<Atividade>> getAllAtividades() async{
    Database dbAtividade = await bh.db;
    List<Map> listMaps = await dbAtividade.rawQuery("SELECT * FROM AtividadesTable");


    List<Atividade> listaAtividade =  List();
    for(Map m in listMaps) {
      listaAtividade.add(Atividade.fromMap(m));
    }
    print(listaAtividade);
    return listaAtividade;
  }

  Future<List<Atividade>> getAllAtividadesRelacionadas(int pressao) async{
    Database dbAtividade = await bh.db;
    List<Map> listMaps = await dbAtividade.rawQuery("SELECT b.atividades_idColumn,b.atividades_nomeColumn FROM ${bh.AtividadesPressaoTable} AS a INNER JOIN ${bh.AtividadesTable} AS b ON b.atividades_idColumn = a.atividadesPressao_idColumn WHERE a.atividadesPressao_idPressaoColumn = ${pressao}");


    List<Atividade> listaAtividade =  List();
    for(Map m in listMaps) {
      listaAtividade.add(Atividade.fromMap(m));
    }
    print(listMaps);
    return listaAtividade;
  }

  /*Future close() async{
    Database dbMedicamento = await bh.db;
    dbMedicamento.close();
  }*/
}
import 'dart:async';

import 'package:pressaoarterialapp/models/atividade_pressao_model.dart';
import 'package:pressaoarterialapp/models/medicamento_pressao_model.dart';
import 'package:pressaoarterialapp/models/pressao_grafico_barra_model.dart';
import 'package:pressaoarterialapp/models/pressao_grafico_linha_model.dart';
import 'package:pressaoarterialapp/models/registro_pressao_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pressaoarterialapp/Helpers/banco_helper.dart';



class RegistroPressaoHelper{
  BancoHelper bh = BancoHelper();
  static final RegistroPressaoHelper _instance = RegistroPressaoHelper.internal();
  factory  RegistroPressaoHelper() => _instance;
  RegistroPressaoHelper.internal();

  Future<RegistroPressao>saveRegistro(RegistroPressao r) async{
    Database dbRegistroPressao = await bh.db;
    r.id = await dbRegistroPressao.insert(bh.RegistroPressaoTable, r.toMap());
    print("===== anotacao cadastrada${r.sistolica}");
    return r;
  }

  Future<List<RegistroPressao>> getAllRegistroPressoes() async{
    Database dbRegistroPressao = await bh.db;
    List<Map> listMaps = await dbRegistroPressao.rawQuery("SELECT * FROM RegistroPressaoTable");


    List<RegistroPressao> listaRegistroPressao =  List();
    for(Map m in listMaps) {
      listaRegistroPressao.add(RegistroPressao.fromMap(m));
    }
    print("======REGISTROS===========${listaRegistroPressao}");
    return listaRegistroPressao;
  }

  Future<List<PressaoGraficoLinha>> getAllGraficos(int tipo, int periodo) async{
    Database dbRegistroPressao = await bh.db;
    String tipo_column;
    String periodo_filtro;
    if(tipo == 1){
      tipo_column = bh.registroPressao_sistolicaColumn;
    }else{
      tipo_column = bh.registroPressao_diastolicaColumn;
    }

    switch(periodo) {
      case 1:
        {
          periodo_filtro = "WHERE datetime(${bh
              .registroPressao_dateTimeColumn}, 'unixepoch') BETWEEN DATETIME('now', '-1 month') AND DATETIME('now')";
        }
        break;

      case 2:
        {
          periodo_filtro = "WHERE datetime(${bh
              .registroPressao_dateTimeColumn}, 'unixepoch') BETWEEN DATETIME('now', '-3 month') AND DATETIME('now')";
        }
        break;

      case 3:
        {
          periodo_filtro = "WHERE datetime(${bh
              .registroPressao_dateTimeColumn}, 'unixepoch') BETWEEN DATETIME('now', '-6 month') AND DATETIME('now')";
        }
        break;
      case 6:
        {
          periodo_filtro = "WHERE datetime(${bh
              .registroPressao_dateTimeColumn}, 'unixepoch') BETWEEN DATETIME('now', '-7 day') AND DATETIME('now')";
        }
        break;
      case 5:
        {
          periodo_filtro = "WHERE datetime(${bh
              .registroPressao_dateTimeColumn}, 'unixepoch') BETWEEN DATETIME('now', '-1 day') AND DATETIME('now')";
        }
        break;

      default:
        {
          periodo_filtro = "WHERE datetime(${bh
              .registroPressao_dateTimeColumn}, 'unixepoch') BETWEEN DATETIME('now', '-12 month') AND DATETIME('now')";
        }
        break;
    }
    List<Map> listMaps = await dbRegistroPressao.rawQuery("SELECT ${tipo_column} AS pressao, ${bh.registroPressao_dateTimeColumn} FROM RegistroPressaoTable ${periodo_filtro} ORDER BY datetime(${bh
        .registroPressao_dateTimeColumn}, 'unixepoch') ASC");


    List<PressaoGraficoLinha> listaRegistroPressao =  List();
    for(Map m in listMaps) {
      listaRegistroPressao.add(PressaoGraficoLinha.fromMap(m));
    }
    print("======REGISTROS===========${listaRegistroPressao}");
    return listaRegistroPressao;
  }

  Future<List<PressaoGraficoBarra>> getAllGraficosBarraAtividade(int tipo,int usuario,String atividades) async{
    Database dbRegistroPressao = await bh.db;
    atividades = atividades.replaceAll("[","(");
    atividades = atividades.replaceAll("]",")");
    String tipo_column;
    String periodo_filtro;
    if(tipo == 1){
      tipo_column = bh.registroPressao_sistolicaColumn;
    }else{
      tipo_column = bh.registroPressao_diastolicaColumn;
    }
    List<Map> listMaps = await dbRegistroPressao.rawQuery("SELECT a.${tipo_column} AS pressao, "
        "c.${bh.atividades_nomeColumn} AS nome FROM RegistroPressaoTable AS a "
        "INNER JOIN ${bh.AtividadesPressaoTable} AS b "
        "ON b.atividadesPressao_idPressaoColumn = a.registroPressao_idColumn "
        "INNER JOIN ${bh.AtividadesTable} AS c "
        "ON c.atividades_idColumn = b.atividadesPressao_idAtividadeColumn "
        "WHERE a.registroPressao_idUsuarioColumn = ${usuario} AND c.atividades_idColumn IN ${atividades}");


    List<PressaoGraficoBarra> listaRegistroPressao =  List();
    for(Map m in listMaps) {
      listaRegistroPressao.add(PressaoGraficoBarra.fromMap(m));
    }
    print("======REGISTROS Atividades===========${listaRegistroPressao}");
    return listaRegistroPressao;
  }

  Future<AtividadePressao>saveAtividadePressao(AtividadePressao ap) async{
    Database dbRegistroPressao = await bh.db;
    ap.id = await dbRegistroPressao.insert(bh.AtividadesPressaoTable, ap.toMap());
    print("id: ${ap.id}");
    return ap;
  }

  Future<MedicamentoPressao>saveMedicamentoPressao(MedicamentoPressao am) async{
    Database dbRegistroPressao = await bh.db;
    am.id = await dbRegistroPressao.insert(bh.MedicamentosPressaoTable, am.toMap());
    return am;
  }

/*Future close() async{
    Database dbMedicamento = await bh.db;
    dbMedicamento.close();
  }*/
}
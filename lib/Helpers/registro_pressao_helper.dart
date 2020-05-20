import 'dart:async';

import 'package:pressaoarterialapp/models/atividade_pressao_model.dart';
import 'package:pressaoarterialapp/models/medicamento_pressao_model.dart';
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
              .registroPressao_dateTimeColumn}, 'unixepoch') BETWEEN DATETIME('now', '-1 month', 'start of month') AND DATETIME('now','start of month','+1 month','-1 day')";
        }
        break;

      case 2:
        {
          periodo_filtro = "WHERE datetime(${bh
              .registroPressao_dateTimeColumn}, 'unixepoch') BETWEEN DATETIME('now', '-3 month', 'start of month') AND DATETIME('now','start of month','+1 month','-1 day')";
        }
        break;

      case 3:
        {
          periodo_filtro = "WHERE datetime(${bh
              .registroPressao_dateTimeColumn}, 'unixepoch') BETWEEN DATETIME('now', '-6 month', 'start of month') AND DATETIME('now','start of month','+1 month','-1 day')";
        }
        break;

      default:
        {
          periodo_filtro = "WHERE datetime(${bh
              .registroPressao_dateTimeColumn}, 'unixepoch') BETWEEN DATETIME('now', '-12 month', 'start of month') AND DATETIME('now','start of month','+1 month','-1 day')";
        }
        break;
    }
    List<Map> listMaps = await dbRegistroPressao.rawQuery("SELECT ${tipo_column} AS pressao, ${bh.registroPressao_dateTimeColumn} FROM RegistroPressaoTable ${periodo_filtro}");


    List<PressaoGraficoLinha> listaRegistroPressao =  List();
    for(Map m in listMaps) {
      listaRegistroPressao.add(PressaoGraficoLinha.fromMap(m));
    }
    print("======REGISTROS===========${listaRegistroPressao}");
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
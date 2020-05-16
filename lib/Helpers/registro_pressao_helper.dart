import 'dart:async';

import 'package:pressaoarterialapp/models/atividade_pressao_model.dart';
import 'package:pressaoarterialapp/models/medicamento_pressao_model.dart';
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
    return r;
  }

  Future<List<RegistroPressao>> getAllRegistroPressoes() async{
    Database dbRegistroPressao = await bh.db;
    List<Map> listMaps = await dbRegistroPressao.rawQuery("SELECT * FROM RegistroPressaoTable");


    List<RegistroPressao> listaRegistroPressao =  List();
    for(Map m in listMaps) {
      listaRegistroPressao.add(RegistroPressao.fromMap(m));
    }
    print(listaRegistroPressao);
    return listaRegistroPressao;
  }

  Future<AtividadePressao>saveAtividadePressao(AtividadePressao ap) async{
    Database dbRegistroPressao = await bh.db;
    ap.id = await dbRegistroPressao.insert(bh.MedicamentosPressaoTable, ap.toMap());
    return ap;
  }

  Future<MedicamentoPressao>saveMedicamentoPressao(MedicamentoPressao am) async{
    Database dbRegistroPressao = await bh.db;
    am.id = await dbRegistroPressao.insert(bh.AtividadesPressaoTable, am.toMap());
    return am;
  }

/*Future close() async{
    Database dbMedicamento = await bh.db;
    dbMedicamento.close();
  }*/
}
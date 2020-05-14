import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pressaoarterialapp/Helpers/medicamento_helper.dart';



class BancoHelper {
  //==============Medicamentos
  final String medicamentoTable = "MedicamentoTable";
  final String idColumn = "idColumn";
  final String nomeColumn="nomeColumn";
  final String doseColumn="doseColumn";
  final String quantidade_diariaColumn="quantidade_diariaColumn";
  final String id_unidadeColumn="id_unidadeColumn";
  final String id_tipoColumn="id_tipoColumn";
  final String anotacaoColumn="anotacaoColumn";

  static final BancoHelper _instance = BancoHelper.internal();
  factory  BancoHelper() => _instance;
  BancoHelper.internal();
  Database _db;

  Future<Database>get db async{
    if(_db != null) {
      return _db;
    }else{
      _db = await initDb();
      return _db;
    }
  }

  Future<Database>initDb() async{
    final dataBasesPath = await getDatabasesPath();
    final path = join(dataBasesPath,"pressao2.db");
    return await  openDatabase(path,version: 1, onCreate: (Database db,int newerVersion) async{
      await db.execute(
          "CREATE TABLE $medicamentoTable($idColumn INTEGER PRIMARY KEY,"
              "$nomeColumn TEXT,"
              "$doseColumn INTEGER,"
              "$quantidade_diariaColumn INTEGER,"
              "$id_unidadeColumn INTEGER,"
              "$id_tipoColumn INTEGER,"
              "$anotacaoColumn TEXT) "
      );

    });
  }
}

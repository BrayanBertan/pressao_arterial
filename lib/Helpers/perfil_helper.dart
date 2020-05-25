import 'dart:async';

import 'package:pressaoarterialapp/models/atividade_model.dart';
import 'package:pressaoarterialapp/models/perfil_model.dart';
import 'package:pressaoarterialapp/models/pressao_grafico_barra_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pressaoarterialapp/Helpers/banco_helper.dart';

class PerfilHelper {
  BancoHelper bh = BancoHelper();
  static final PerfilHelper _instance = PerfilHelper.internal();
  factory PerfilHelper() => _instance;
  PerfilHelper.internal();

  Future<Perfil>savePerfil(Perfil p) async{
    Database dbPerfil = await bh.db;
    Perfil retorno;
    p.id = await dbPerfil.insert(bh.UsuarioTable, p.toMap());
    retorno = p;
    p = null;
    return retorno;
  }

  Future<int>updatePerfil(Perfil p) async {
    Database dbPerfil = await bh.db;
    return await dbPerfil.update(bh.UsuarioTable,p.toMap(),where: "${bh.usuario_idColumn} = ?",whereArgs: [p.id]);
  }

  Future<List<Perfil>> getAllPerfis() async {
    Database dbPerfil = await bh.db;
    List<Map> listMaps =
    await dbPerfil.rawQuery("SELECT * FROM UsuarioTable");

    List<Perfil> listaPerfil = List();
    for (Map m in listMaps) {
      listaPerfil.add(Perfil.fromMap(m));
    }
    print(listaPerfil);
    return listaPerfil;
  }

}

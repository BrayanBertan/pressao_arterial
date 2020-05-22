import 'dart:async';

import 'package:pressaoarterialapp/models/medicamento_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pressaoarterialapp/Helpers/banco_helper.dart';
import 'package:pressaoarterialapp/pages/configuracao_global.dart' as gc;


class MedicamentoHelper{
  BancoHelper bh = BancoHelper();
  static final MedicamentoHelper _instance = MedicamentoHelper.internal();
  factory  MedicamentoHelper() => _instance;
  MedicamentoHelper.internal();



Future<Medicamento>saveMedicamento(Medicamento m) async{
    Database dbMedicamento = await bh.db;
    m.id = await dbMedicamento.insert(bh.MedicamentoTable, m.toMap());
    print(m);
    return m;
}

Future<Medicamento> getMedicamento(int id) async{
  Database dbMedicamento = await bh.db;
  List<Map> maps = await dbMedicamento.query(bh.MedicamentoTable,
      columns: [bh.medicamento_idColumn,bh.medicamento_nomeColumn,
        bh.medicamento_doseColumn,bh.medicamento_quantidade_diariaColumn,
        bh.medicamento_id_unidadeColumn,bh.medicamento_id_tipoColumn
      ],
    where: "$bh.medicamento_idColumn = ?",
    whereArgs: [id]
  );
  if (maps.length > 0) {
    return Medicamento.fromMap(maps.first);
  }else{
    return null;
  }

}
Future<int>deleteMedicamento(int id) async {
    Database dbMedicamento = await bh.db;
    return await dbMedicamento.delete(bh.MedicamentoTable,where: "${bh.medicamento_idColumn} = ?",whereArgs: [id]);
  }

  Future<int>updateMedicamento(Medicamento m) async {
    Database dbMedicamento = await bh.db;
    print(dbMedicamento);
    print(bh.medicamento_idColumn);
    print(m.toMap());
    return await dbMedicamento.update(bh.MedicamentoTable,m.toMap(),where: "${bh.medicamento_idColumn} = ?",whereArgs: [m.id]);
  }

  Future<List<Medicamento>> getAllMedicamento() async{
    Database dbMedicamento = await bh.db;
    List<Map> listMaps = await dbMedicamento.rawQuery("SELECT * FROM MedicamentoTable WHERE medicamento_idUsuarioColumn = ${gc.perfilSelecionado.id}");


    List<Medicamento> listaMedicamento =  List();
    for(Map m in listMaps) {
      listaMedicamento.add(Medicamento.fromMap(m));
    }
    print(listaMedicamento);
    return listaMedicamento;
  }

  Future<List<Medicamento>> getAllMedicamentosFiltro(int usuario) async {
    Database dbAtividade = await bh.db;
    List<Map> listMaps = await dbAtividade.rawQuery(
        "SELECT b.medicamento_idColumn, b.medicamento_nomeColumn FROM ${bh.MedicamentosPressaoTable} AS a "
            "INNER JOIN ${bh.MedicamentoTable} AS b "
            "ON b.medicamento_idColumn = a.medicamentosPressao_idMedicamentoColumn "
            "WHERE b.medicamento_idUsuarioColumn = ${gc.perfilSelecionado.id}  "
            "GROUP BY b.medicamento_idColumn,b.medicamento_nomeColumn ");



    List<Medicamento> listaAtividade = List();
    for (Map m in listMaps) {
      listaAtividade.add(Medicamento.fromMap(m));
    }
    print(listMaps);
    return listaAtividade;
  }

  Future<List<Medicamento>> getAllMedicamentosRelacionados(int pressao) async{
    Database dbMedicamento = await bh.db;
    List<Map> listMaps = await dbMedicamento.rawQuery("SELECT b.medicamento_idColumn,b.medicamento_nomeColumn ,b.medicamento_descricaoColumn FROM ${bh.MedicamentosPressaoTable} AS a INNER JOIN ${bh.MedicamentoTable} AS b ON b.medicamento_idColumn = a.medicamentosPressao_idColumn WHERE a.medicamentosPressao_idPressaoColumn = ${pressao}");


    List<Medicamento> listaAtividade =  List();
    for(Map m in listMaps) {
      listaAtividade.add(Medicamento.fromMap(m));
    }
    print(listMaps);
    return listaAtividade;
  }

 Future close() async{
    Database dbMedicamento = await bh.db;
    dbMedicamento.close();
  }
}
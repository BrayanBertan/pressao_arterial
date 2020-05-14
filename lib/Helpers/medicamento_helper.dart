import 'dart:async';

import 'package:pressaoarterialapp/models/medicamento_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pressaoarterialapp/Helpers/banco_helper.dart';



class MedicamentoHelper{
  BancoHelper bh = BancoHelper();
  static final MedicamentoHelper _instance = MedicamentoHelper.internal();
  factory  MedicamentoHelper() => _instance;
  MedicamentoHelper.internal();



Future<Medicamento>saveMedicamento(Medicamento m) async{
    Database dbMedicamento = await bh.db;
    print(dbMedicamento);
    print(m.toMap());
    m.id = await dbMedicamento.insert(bh.medicamentoTable, m.toMap());
    print(m.id);
    return m;
}

Future<Medicamento> getMedicamento(int id) async{
  Database dbMedicamento = await bh.db;
  List<Map> maps = await dbMedicamento.query(bh.medicamentoTable,
      columns: [bh.idColumn,bh.nomeColumn,
        bh.doseColumn,bh.quantidade_diariaColumn,
        bh.id_unidadeColumn,bh.id_tipoColumn
      ],
    where: "$bh.idColumn = ?",
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
    return await dbMedicamento.delete(bh.medicamentoTable,where: "${bh.idColumn} = ?",whereArgs: [id]);
  }

  Future<int>updateMedicamento(Medicamento m) async {
    Database dbMedicamento = await bh.db;
    print(dbMedicamento);
    print(bh.idColumn);
    print(m.toMap());
    return await dbMedicamento.update(bh.medicamentoTable,m.toMap(),where: "${bh.idColumn} = ?",whereArgs: [m.id]);
  }

  Future<List<Medicamento>> getAllMedicamento() async{
    Database dbMedicamento = await bh.db;
    List<Map> listMaps = await dbMedicamento.rawQuery("SELECT * FROM MedicamentoTable");


    List<Medicamento> listaMedicamento =  List();
    for(Map m in listMaps) {
      listaMedicamento.add(Medicamento.fromMap(m));
    }
    print(listaMedicamento);
    return listaMedicamento;
  }

 Future close() async{
    Database dbMedicamento = await bh.db;
    dbMedicamento.close();
  }
}
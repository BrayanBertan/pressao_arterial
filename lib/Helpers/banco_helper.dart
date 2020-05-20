import 'dart:async';

import 'package:pressaoarterialapp/models/atividade_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pressaoarterialapp/Helpers/medicamento_helper.dart';

class BancoHelper {
  //==============Medicamentos
  final String MedicamentoTable = "MedicamentoTable";
  final String medicamento_idColumn = "medicamento_idColumn";
  final String medicamento_nomeColumn = "medicamento_nomeColumn";
  final String medicamento_doseColumn = "medicamento_doseColumn";
  final String medicamento_quantidade_diariaColumn =
      "medicamento_quantidade_diariaColumn";
  final String medicamento_id_unidadeColumn = "medicamento_id_unidadeColumn";
  final String medicamento_id_tipoColumn = "medicamento_id_tipoColumn";
  final String medicamento_anotacaoColumn = "medicamento_anotacaoColumn";
  final String medicamento_descricaoColumn = "medicamento_descricaoColumn";
  final String medicamento_idUsuarioColumn = "medicamento_idUsuarioColumn";

  //==============Usuarios
  final String UsuarioTable = "UsuarioTable";
  final String usuario_idColumn = "usuario_idColumn";
  final String usuario_nomeColumn = "usuario_nomeColumn";
  final String usuario_senhaColumn = "usuario_senhaColumn";
  final String usuario_emailColumn = "usuario_emailColumn";
  final String usuario_iconeColumn = "usuario_iconeColumn";

  //==============RegistroPressao
  final String RegistroPressaoTable = "RegistroPressaoTable";
  final String registroPressao_idColumn = "registroPressao_idColumn";
  final String registroPressao_sistolicaColumn =
      "registroPressao_sistolicaColumn";
  final String registroPressao_diastolicaColumn =
      "registroPressao_diastolicaColumn";
  final String registroPressao_pulsoColumn = "registroPressao_pulsoColumn";
  final String registroPressao_posturaColumn = "registroPressao_posturaColumn";
  final String registroPressao_bracoColumn = "registroPressao_bracoColumn";
  final String registroPressao_anotacaoColumn =
      "registroPressao_anotacaoColumn";
  final String registroPressao_dateTimeColumn =
      "registroPressao_dateTimeColumn";
  final String registroPressao_idUsuarioColumn = "registroPressao_idUsuarioColumn";

  //==============MedicamentosPressao
  final String MedicamentosPressaoTable = "MedicamentosPressaoTable";
  final String medicamentosPressao_idColumn = "medicamentosPressao_idColumn";
  final String medicamentosPressao_idPressaoColumn =
      "medicamentosPressao_idPressaoColumn";
  final String medicamentosPressao_idMedicamentoColumn =
      "medicamentosPressao_idMedicamentoColumn";

  //==============Atividades
  final String AtividadesTable = "AtividadesTable";
  final String atividades_idColumn = "atividades_idColumn";
  final String atividades_nomeColumn =
      "atividades_nomeColumn";

  //==============AtividadesPressao
  final String AtividadesPressaoTable = "AtividadesPressaoTable";
  final String atividadesPressao_idColumn = "atividadesPressao_idColumn";
  final String atividadesPressao_idPressaoColumn =
      "atividadesPressao_idPressaoColumn";
  final String atividadesPressao_idAtividadeColumn =
      "atividadesPressao_idAtividadeColumn";

  static final BancoHelper _instance = BancoHelper.internal();
  factory BancoHelper() => _instance;
  BancoHelper.internal();
  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      print("já existe============================================");
      print(_db);
      return _db;
    } else {
      _db = await initDb();
      print("não existia============================================");
      print(_db);
      return _db;
    }
  }

  Future<Database> initDb() async {
    final dataBasesPath = await getDatabasesPath();
    final path = join(dataBasesPath, "pressao19.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE $MedicamentoTable("
          "$medicamento_idColumn INTEGER PRIMARY KEY,"
          "$medicamento_nomeColumn TEXT,"
          "$medicamento_doseColumn INTEGER,"
          "$medicamento_quantidade_diariaColumn INTEGER,"
          "$medicamento_id_unidadeColumn INTEGER,"
          "$medicamento_id_tipoColumn INTEGER,"
          "$medicamento_anotacaoColumn TEXT,"
          "$medicamento_descricaoColumn TEXT,"
          "$medicamento_idUsuarioColumn INTEGER) ");
      await db.execute("CREATE TABLE $UsuarioTable("
          "$usuario_idColumn INTEGER PRIMARY KEY,"
          "$usuario_nomeColumn TEXT,"
          "$usuario_senhaColumn TEXT,"
          "$usuario_emailColumn TEXT,"
          "$usuario_iconeColumn TEXT) ");
      await db.execute("CREATE TABLE $RegistroPressaoTable("
          "$registroPressao_idColumn INTEGER PRIMARY KEY,"
          "$registroPressao_sistolicaColumn REAL,"
          "$registroPressao_diastolicaColumn REAL,"
          "$registroPressao_pulsoColumn REAL,"
          "$registroPressao_posturaColumn INTEGER,"
          "$registroPressao_bracoColumn INTEGER,"
          "$registroPressao_anotacaoColumn TEXT,"
          "$registroPressao_dateTimeColumn INTEGER,"
          "$registroPressao_idUsuarioColumn INTEGER) ");
      await db.execute("CREATE TABLE $MedicamentosPressaoTable("
          "$medicamentosPressao_idColumn INTEGER PRIMARY KEY,"
          "$medicamentosPressao_idPressaoColumn INTEGER,"
          "$medicamentosPressao_idMedicamentoColumn INTEGER) ");
      await db.execute("CREATE TABLE $AtividadesPressaoTable("
          "$atividadesPressao_idColumn INTEGER PRIMARY KEY,"
          "$atividadesPressao_idPressaoColumn INTEGER,"
          "$atividadesPressao_idAtividadeColumn INTEGER) ");
      await db.execute("CREATE TABLE $AtividadesTable("
          "$atividades_idColumn INTEGER PRIMARY KEY,"
          "$atividades_nomeColumn nome) ");
      await db.insert(AtividadesTable, Atividade(id: 1,nome: "Caminhada").toMap());
      await db.insert(AtividadesTable, Atividade(id: 2,nome: "Corrida").toMap());
      await db.insert(AtividadesTable, Atividade(id: 3,nome: "Cozinhar").toMap());
      await db.insert(AtividadesTable, Atividade(id: 4,nome: "Estudo").toMap());
      await db.insert(AtividadesTable, Atividade(id: 5,nome: "Trabalho").toMap());
      await db.insert(AtividadesTable, Atividade(id: 6,nome: "Outro").toMap());

        });
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pressaoarterialapp/Helpers/medicamento_helper.dart';
import 'app_widget.dart';
import 'package:pressaoarterialapp/pages/login.dart';
import 'package:pressaoarterialapp/pages/lista_medicoes.dart';
import 'package:pressaoarterialapp/pages/medicamentos.dart';
import 'package:pressaoarterialapp/pages/relatorio_grafico.dart';
import 'package:pressaoarterialapp/repositories/medicamentosapi_repository.dart';
import 'package:pressaoarterialapp/pages/controllers/medicamentos_controller.dart';


class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
    Bind((i) => MedicamentoApiRepository()),
    Bind((i) => MedicamentoController()),
    Bind((i) => MedicamentoHelper()),
  ];

  @override
  List<Router> get routers => [
    Router("/login", child: (_, args) => LoginPage()),
    Router("/registros", child: (_, args) => ListaMedicoesPage()),
    Router("/medicamentos", child: (_, args) => MedicamentosPage()),
    Router("/relatorios", child: (_, args) => RelatorioGraficoPage()),

  ];

// add your main widget here
  @override
  Widget get bootstrap => AppWidget();
}
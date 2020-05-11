import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_widget.dart';
import 'package:pressaoarterialapp/pages/login.dart';
import 'package:pressaoarterialapp/pages/listaMedicoes.dart';
import 'package:pressaoarterialapp/pages/medicamentos.dart';
import 'package:pressaoarterialapp/pages/relatorioGrafico.dart';


class AppModule extends MainModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  // here will be the routes of your module
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
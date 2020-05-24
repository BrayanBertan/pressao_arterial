import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pressaoarterialapp/Helpers/atividade_helper.dart';
import 'package:pressaoarterialapp/pages/controllers/registros_pressao_controller.dart';
import 'package:pressaoarterialapp/pages/dicas.dart';
import 'package:pressaoarterialapp/pages/perfis.dart';

import 'app_widget.dart';
import 'package:pressaoarterialapp/pages/splash.dart';
import 'package:pressaoarterialapp/pages/login.dart';
import 'package:pressaoarterialapp/pages/lista_medicoes.dart';
import 'package:pressaoarterialapp/pages/medicamentos.dart';
import 'package:pressaoarterialapp/pages/relatorio_grafico.dart';
import 'package:pressaoarterialapp/pages/registro_pressao.dart';
import 'package:pressaoarterialapp/pages/controllers/medicamentos_controller.dart';
import 'package:pressaoarterialapp/Helpers/medicamento_helper.dart';


class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
    Bind((i) => MedicamentoController()),
    Bind((i) => RegistroPressaoController()),
    Bind((i) => MedicamentoHelper()),
    Bind((i) => AtividadeHelper()),
  ];

  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => SplashPage()),
    Router("/login", child: (_, args) => PerfilPage()),
    Router("/registros", child: (_, args) => ListaMedicoesPage()),
    Router("/medicamentos", child: (_, args) => MedicamentosPage()),
    Router("/relatorios", child: (_, args) => RelatorioGraficoPage()),
    Router("/registroPressao", child: (_, args) => RegistroPressaoPage()),
    Router("/dicas", child: (_, args) => DicaPage()),

  ];

// add your main widget here
  @override
  Widget get bootstrap => AppWidget();
}
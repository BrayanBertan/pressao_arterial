import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pressaoarterialapp/Helpers/atividade_helper.dart';
import 'package:pressaoarterialapp/Helpers/banco_helper.dart';
import 'package:pressaoarterialapp/Helpers/perfil_helper.dart';
import 'package:pressaoarterialapp/Helpers/registro_pressao_helper.dart';
import 'package:pressaoarterialapp/pages/controllers/dicas_controller.dart';
import 'package:pressaoarterialapp/pages/controllers/perfis_controller.dart';
import 'package:pressaoarterialapp/pages/controllers/registros_pressao_controller.dart';
import 'package:pressaoarterialapp/pages/dicas.dart';
import 'package:pressaoarterialapp/pages/perfis.dart';

import 'app_widget.dart';
import 'package:pressaoarterialapp/pages/splash.dart';
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
    Bind((i) => PerfilController()),
    Bind((i) => DicaController()),
    Bind((i) => BancoHelper()),
    Bind((i) => MedicamentoHelper()),
    Bind((i) => RegistroPressaoHelper()),
    Bind((i) => AtividadeHelper()),
    Bind((i) => PerfilHelper()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (_, args) => SplashPage()),
    ModularRouter("/login", child: (_, args) => PerfilPage()),
    ModularRouter("/registros", child: (_, args) => ListaMedicoesPage()),
    ModularRouter("/medicamentos", child: (_, args) => MedicamentosPage()),
    ModularRouter("/relatorios", child: (_, args) => RelatorioGraficoPage()),
    ModularRouter("/registroPressao", child: (_, args) => RegistroPressaoPage()),
    ModularRouter("/dicas", child: (_, args) => DicaPage()),

  ];

// add your main widget here
  @override
  Widget get bootstrap => AppWidget();
}
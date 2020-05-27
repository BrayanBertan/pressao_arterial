import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pressaoarterialapp/Helpers/registro_pressao_helper.dart';
import 'package:pressaoarterialapp/models/atividade_pressao_model.dart';
import 'package:pressaoarterialapp/models/medicamento_model.dart';
import 'package:pressaoarterialapp/models/medicamento_pressao_model.dart';
import 'package:intl/intl.dart';
import 'package:pressaoarterialapp/models/pressao_grafico_barra_model.dart';
import 'package:pressaoarterialapp/models/pressao_grafico_linha_model.dart';
import 'package:pressaoarterialapp/pages/configuracao_global.dart' as gc;
import 'package:pressaoarterialapp/models/registro_pressao_model.dart';
import 'package:pressaoarterialapp/models/atividade_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pressaoarterialapp/Helpers/medicamento_helper.dart';
import 'package:pressaoarterialapp/Helpers/atividade_helper.dart';
import 'dart:async';
part 'registros_pressao_controller.g.dart';

class RegistroPressaoController = _RegistroPressaoController
    with _$RegistroPressaoController;

abstract class _RegistroPressaoController with Store {
  final helper =  Modular.get<MedicamentoHelper>();
  final registro_helper = Modular.get<RegistroPressaoHelper>();
  final atividade_helper = Modular.get<AtividadeHelper>();


  _RegistroPressaoController() {
    pressao = RangeValues(70, 100);
    atividades_selecionadas_filtro = [0].asObservable();
    atividades_selecionadas_filtro.clear();
    medicamentos_selecionados_filtro = [0].asObservable();
    medicamentos_selecionados_filtro.clear();
    atividades_selecionadas = [0].asObservable();
    atividades_selecionadas.clear();
    atividades = [
      {'id': 1, 'nome': 'a'}
    ].asObservable();
    atividades.clear();
    medicamentos_selecionados = [0].asObservable();
    medicamentos_selecionados.clear();
    medicamentos = [
      {'id': 1, 'nome': 'a'}
    ].asObservable();
    medicamentos.clear();
    registroObj = RegistroPressao(
        sistolica: 0,
        diastolica: 0,
        pulso: 0,
        postura: 0,
        braco: 0,
        anotacao: '',
        dataHora: DateTime.now(),
        id_usuario: 1);
    periodosGrafico = [
      {'id': 1, 'nome': 'Ultimo mês'},
      {'id': 1, 'nome': 'Ultimos 3 mêses'},
      {'id': 1, 'nome': 'Ultimo 6 mêses'},
      {'id': 1, 'nome': 'Ultimo 1 ano'},
    ].asObservable();
    var format = DateFormat.yMd('pt');
    diaSelecionado = format.format(DateTime.now());
    var formatCadastro = DateFormat('dd/MM/yyy H:m');
    diaSelecionadoCadastro = formatCadastro.format(DateTime.now());
  }
  @observable
  RegistroPressao registroObj;

  ObservableMap<String, dynamic> currentCustomData = ObservableMap.of({});

  @observable
  var pressao;

  @observable
  ObservableList atividades;

  @observable
  ObservableList<dynamic> atividades_selecionadas;

  @observable
  ObservableList<dynamic> atividades_selecionadas_filtro;

  @observable
  ObservableList<dynamic> medicamentos_selecionados_filtro;

  @observable
  ObservableList medicamentos;

  @observable
  ObservableList<dynamic> medicamentos_selecionados;

  @observable
  int braco = 1;

  @observable
  double pulso = 60;

  @observable
  int postura = 2;

  @observable
  ObservableList<RegistroPressao> registros = [
    RegistroPressao(
        sistolica: 0,
        diastolica: 0,
        pulso: 0,
        postura: 0,
        braco: 0,
        anotacao: '',
        dataHora: DateTime.now(),
        id_usuario: 1),
  ].asObservable();

  @observable
  ObservableMap<DateTime, List> listaEventos =
      ObservableMap.of({DateTime.now(): []});

  @observable
  List eventosSelecionados = [
    {'id': 0, 'anotacao': '', 'descricao': ''}
  ].asObservable();

  @observable
  bool showCalendario = false;

  @observable
  int telaDescricaoMedicao = 1;

  @observable
  List atividadesRelacionadas = new List().asObservable();

  @observable
  List medicamentosRelacionadasFiltro = new List().asObservable();

  @observable
  List atividadesRelacionadasFiltro = new List().asObservable();

  @observable
  List medicamentosRelacionadas = new List().asObservable();

  @observable
  List<PressaoGraficoLinha> sistolicaGrafico = [];

  @observable
  List<PressaoGraficoLinha> diastolicaGrafico = [];
  @observable
  List<PressaoGraficoLinha> pulsoGrafico = [];

  @observable
  List<PressaoGraficoBarra> sistolicaGraficoAtividade = [];

  @observable
  List<PressaoGraficoBarra> diastolicaGraficoAtividade = [];

  @observable
  List<PressaoGraficoBarra> pulsoGraficoAtividade = [];

  @observable
  List<PressaoGraficoBarra> sistolicaGraficoMedicamento = [];

  @observable
  List<PressaoGraficoBarra> diastolicaGraficoMedicamento = [];

  @observable
  List<PressaoGraficoBarra> pulsoGraficoMedicamento = [];

  @observable
  ObservableList periodosGrafico = new List().asObservable();

  @observable
  int filtroGraficoTempo = 1;

  @observable
  String formatoDataX = 'dd/MM';

  @observable
  String diaSelecionado;

  @observable
  bool showRegistro = true;

  @observable
  String diaSelecionadoCadastro;

  @action
  setDiaSelecionadoCadastro(DateTime valor) {
    var format = DateFormat('dd/MM/yyy H:m');
    diaSelecionadoCadastro = format.format(valor);
  }

  @action
  setShowRegistro(bool valor) {
    showRegistro = valor;
  }

  @action
  setDiaSelecionado(DateTime valor) {
    var format = DateFormat.yMd('pt');
    diaSelecionado = format.format(valor);
  }

  @action
  setFiltroGraficoTempo(int valor) {
    filtroGraficoTempo = valor;
  }

  @action
  setShowCalendario(bool valor) {
    showCalendario = valor;
  }

  @action
  setTelaDescricaoMedicao(int valor) {
    telaDescricaoMedicao = valor;
  }

  @action
  setPressao(RangeValues novo) {
    pressao = novo;
  }

  @action
  setAtividadesSelecionadas(List lista) {
    atividades_selecionadas.clear();
    lista.forEach((element) => atividades_selecionadas.add(element));
  }

  @action
  setMedicamentosSelecionados(List lista) {
    medicamentos_selecionados.clear();
    lista.forEach((element) => medicamentos_selecionados.add(element));
  }

  @action
  setAtividadesSelecionadasFiltro(List lista) {
    atividades_selecionadas_filtro.clear();
    lista.forEach((element) => atividades_selecionadas_filtro.add(element));
  }

  @action
  setMedicamentosSelecionadosFiltro(List lista) {
    medicamentos_selecionados_filtro.clear();
    lista.forEach((element) => medicamentos_selecionados_filtro.add(element));
  }

  @action
  getAllAtividades() async {
    List<Atividade> atividades_banco =
        await atividade_helper.getAllAtividades();
    atividades.clear();
    atividades_banco.forEach((element) => atividades.add(element.toJson()));
  }

  @action
  getAllAtividadesFiltro() async {
    List<Atividade> atividades_banco =
        await atividade_helper.getAllAtividadesFiltro(1);
    atividadesRelacionadasFiltro.clear();
    atividades_banco.forEach(
        (element) => atividadesRelacionadasFiltro.add(element.toJson()));
  }

  @action
  getAllMedicamentosFiltro() async {
    List<Medicamento> medicamentos_banco =
        await helper.getAllMedicamentosFiltro(1);
    medicamentosRelacionadasFiltro.clear();
    medicamentos_banco.forEach(
        (element) => medicamentosRelacionadasFiltro.add(element.toJson()));
  }

  @action
  getAllMedicamentos() async {
    List<Medicamento> medicamentos_banco = await helper.getAllMedicamento();
    medicamentos.clear();
    medicamentos_banco.forEach((element) => medicamentos.add(element.toJson()));
  }

  @action
  getAtividadesRelacionadas(int pressao) async {
    List<Atividade> atividades_banco =
        await atividade_helper.getAllAtividadesRelacionadas(pressao);
    atividadesRelacionadas.clear();
    atividades_banco
        .forEach((element) => atividadesRelacionadas.add(element.toJson()));
  }

  @action
  getMedicamentosRelacionadas(int pressao) async {
    List<Medicamento> medicamentos_banco =
        await helper.getAllMedicamentosRelacionados(pressao);
    medicamentosRelacionadas.clear();
    medicamentos_banco
        .forEach((element) => medicamentosRelacionadas.add(element.toJson()));
  }

  @action
  setPostura(int valor) {
    postura = valor;
  }

  @action
  setBraco(int valor) {
    braco = valor;
  }

  @action
  setPulso(double valor) {
    pulso = valor;
  }

  @action
  setAnotacao(String anotacao) async {
    registroObj.sistolica = pressao.end;
    registroObj.diastolica = pressao.start;
    registroObj.pulso = pulso;
    registroObj.postura = postura;
    registroObj.braco = braco;
    registroObj.anotacao = anotacao;
    registroObj.id_usuario = gc.perfilSelecionado.id;
    registroObj.id = null;
    var registrado = await registro_helper.saveRegistro(registroObj);
    if (atividades_selecionadas.length > 0) {
      for (var atividade in atividades_selecionadas) {
        await registro_helper.saveAtividadePressao(
            AtividadePressao(idAtividade: atividade, idPressao: registrado.id));
      }
    }
    if (medicamentos_selecionados.length > 0) {
      for (var medicamento in medicamentos_selecionados) {
        await registro_helper.saveMedicamentoPressao(MedicamentoPressao(
            idMedicamento: medicamento, idPressao: registrado.id));
      }
    }
    clearRegistro();
  }

  @action
  clearRegistro() {
    registroObj.sistolica = 0;
    registroObj.diastolica = 0;
    registroObj.pulso = 0;
    registroObj.postura = 0;
    registroObj.braco = 0;
    registroObj.anotacao = '';
    registroObj.dataHora = DateTime.now();
    pressao = RangeValues(70, 100);
    pulso = 60;
    postura = 2;
    braco = 1;
    atividades_selecionadas.clear();
    medicamentos_selecionados.clear();
  }

  @action
  getAllRegistros() async {
    listaEventos.clear();
    eventosSelecionados.clear();
    List<RegistroPressao> event;
    registro_helper.getAllRegistroPressoes().then((lista) {
      event = lista;
      for (int i = 0; i < event.length; i++) {
        var createTime = DateTime(event[i].dataHora.year,
            event[i].dataHora.month, event[i].dataHora.day);
        var original = listaEventos[createTime];
        var format = DateFormat.jm('pt');
        String hora = format.format(DateTime(
            event[i].dataHora.year,
            event[i].dataHora.month,
            event[i].dataHora.day,
            event[i].dataHora.hour,
            event[i].dataHora.minute));
        if (original == null) {
          listaEventos[createTime] = [
            {
              'id': event[i].id,
              'postura': event[i].postura,
              'braco': event[i].braco,
              'anotacao': '${event[i].anotacao}',
              'sistolica': '${event[i].sistolica.round()}',
              'diastolica': '${event[i].diastolica.round()}',
              'pulso': '${event[i].pulso.round()}',
              'hora': '${hora}'
            }
          ];
        } else {
          listaEventos[createTime] = List.from(original)
            ..addAll([
              {
                'id': event[i].id,
                'postura': event[i].postura,
                'braco': event[i].braco,
                'anotacao': '${event[i].anotacao}',
                'sistolica': '${event[i].sistolica.round()}',
                'diastolica': '${event[i].diastolica.round()}',
                'pulso': '${event[i].pulso.round()}',
                'hora': '${hora}'
              }
            ]);
        }
      }
      DateTime isso = DateTime.now();
      DateTime hj = DateTime(isso.year, isso.month, isso.day);
      eventosSelecionados = listaEventos[hj];
      if (eventosSelecionados == null) {
        eventosSelecionados = [];
      }
    });
  }

  @action
  getAllTimeGraficos() async {
    sistolicaGrafico.clear();
    diastolicaGrafico.clear();
    pulsoGrafico.clear();
    List<PressaoGraficoLinha> sistolica_banco =
        await registro_helper.getAllGraficos(1, filtroGraficoTempo);
    sistolica_banco.forEach((element) => sistolicaGrafico.add(element));
    List<PressaoGraficoLinha> diastolica_banco =
        await registro_helper.getAllGraficos(2, filtroGraficoTempo);
    diastolica_banco.forEach((element) => diastolicaGrafico.add(element));
    List<PressaoGraficoLinha> pulso_banco =
        await registro_helper.getAllGraficosPulso(filtroGraficoTempo);
    pulso_banco.forEach((element) => pulsoGrafico.add(element));
  }

  @action
  getAllBarraGraficos() async {
    sistolicaGraficoAtividade.clear();
    diastolicaGraficoAtividade.clear();
    pulsoGraficoAtividade.clear();
    List<PressaoGraficoBarra> sistolica_banco =
        await registro_helper.getAllGraficosBarraAtividade(
            1, atividades_selecionadas_filtro.toString());
    sistolica_banco
        .forEach((element) => sistolicaGraficoAtividade.add(element));
    List<PressaoGraficoBarra> diastolica_banco =
        await registro_helper.getAllGraficosBarraAtividade(
            2, atividades_selecionadas_filtro.toString());
    diastolica_banco
        .forEach((element) => diastolicaGraficoAtividade.add(element));
    List<PressaoGraficoBarra> pulso_banco =
        await registro_helper.getAllGraficosBarraPulsoAtividade(
            atividades_selecionadas_filtro.toString());
    pulso_banco.forEach((element) => pulsoGraficoAtividade.add(element));
  }

  @action
  getAllBarraGraficosMedicamentos() async {
    sistolicaGraficoMedicamento.clear();
    diastolicaGraficoMedicamento.clear();
    pulsoGraficoMedicamento.clear();
    List<PressaoGraficoBarra> sistolica_banco =
        await registro_helper.getAllGraficosBarraMedicamento(
            1, medicamentos_selecionados_filtro.toString());
    sistolica_banco
        .forEach((element) => sistolicaGraficoMedicamento.add(element));
    List<PressaoGraficoBarra> diastolica_banco =
        await registro_helper.getAllGraficosBarraMedicamento(
            2, medicamentos_selecionados_filtro.toString());
    diastolica_banco
        .forEach((element) => diastolicaGraficoMedicamento.add(element));
    List<PressaoGraficoBarra> pulso_banco =
        await registro_helper.getAllGraficosBarraPulsoMedicamento(
            medicamentos_selecionados_filtro.toString());
    pulso_banco.forEach((element) => pulsoGraficoMedicamento.add(element));
    medicamentos_selecionados_filtro.clear();
  }

  @action
  removeRegistro(int id) async {
    await registro_helper.deleteRegistro(id);
    getAllRegistros();
  }
}

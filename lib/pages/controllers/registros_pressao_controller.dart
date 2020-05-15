import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pressaoarterialapp/models/medicamento_model.dart';
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
  final apiLite = Modular.get<AtividadeHelper>();
  MedicamentoHelper helper = MedicamentoHelper();
  AtividadeHelper atividade_helper = AtividadeHelper();
  _RegistroPressaoController() {
    pressao = RangeValues(70, 100);
    pulso = 70;
   atividades_selecionadas = [0
    ].asObservable();
   atividades_selecionadas.clear();
   atividades=[{'id':1,'nome':'a'}].asObservable();
   atividades.clear();
    medicamentos_selecionados = [0
    ].asObservable();
    medicamentos_selecionados.clear();
    medicamentos=[{'id':1,'nome':'a'}].asObservable();
    medicamentos.clear();
  }
  @observable
  RegistroPressao anotacao = RegistroPressao(
      sistolica: 110,
      diastolica: 70,
      pulso: 60,
      postura: 0,
      braco: 0,
      anotacao: "",
      dataHora: DateTime.now());

  @observable
  int postura = 0;

  @observable
  int braco = 0;

  @observable
  var pressao;

  @observable
  double pulso;

  @observable
  ObservableList atividades;

  @observable
  ObservableList<dynamic> atividades_selecionadas;

  @observable
  ObservableList medicamentos;

  @observable
  ObservableList<dynamic> medicamentos_selecionados;

  @action
  setPressao(RangeValues novo) {
    pressao = novo;
  }

  @action
  setAtividadesSelecionadas(List<dynamic> lista) {
    print(lista);
  }

  @action
  setMedicamentosSelecionados(List<dynamic> lista) {
    print(lista);
  }

  @action
  getAllAtividades() async{
    List<Atividade> atividades_banco = await atividade_helper.getAllAtividades();
    atividades_banco.forEach((element) => atividades.add(element.toJson()));
  }

  @action
  getAllMedicamentos() async{
    List<Medicamento> medicamentos_banco = await helper.getAllMedicamento();
    medicamentos_banco.forEach((element) => medicamentos.add(element.toJson()));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pressaoarterialapp/Helpers/registro_pressao_helper.dart';
import 'package:pressaoarterialapp/models/atividade_pressao_model.dart';
import 'package:pressaoarterialapp/models/medicamento_model.dart';
import 'package:pressaoarterialapp/models/medicamento_pressao_model.dart';
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
  RegistroPressaoHelper registro_helper = RegistroPressaoHelper();
  AtividadeHelper atividade_helper = AtividadeHelper();
  _RegistroPressaoController() {
    pressao = RangeValues(70, 100);
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
    registroObj = RegistroPressao(sistolica: 0,diastolica: 0,pulso: 0,postura: 0,braco: 0,anotacao: '',dataHora: DateTime.now(),id_usuario: 1);
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
  ObservableList medicamentos;


  @observable
  ObservableList<dynamic> medicamentos_selecionados;

  @observable
  int braco=0;

  @observable
  double pulso=60;

  @observable
  int postura=0;

  @observable
  ObservableList<RegistroPressao> registros = [
    RegistroPressao(sistolica: 0,diastolica: 0,pulso: 0,postura: 0,braco: 0,anotacao: '',dataHora: DateTime.now(),id_usuario: 1),
  ].asObservable();


  @observable
  ObservableMap<DateTime, List> listaEventos = ObservableMap.of({DateTime.now():[]});

  @observable
  List eventosSelecionados = [
    {'id':0,'anotacao':'','descricao':''}
  ].asObservable();

  @observable
  bool showCalendario = false;

  @observable
  List  atividadesRelacionadas = new List().asObservable();

  @observable
  List  medicamentosRelacionadas = new List().asObservable();

  @action
  setShowCalendario(bool valor) {
    showCalendario = valor;
  }

  @action
  setPressao(RangeValues novo) {
    pressao = novo;
  }

  @action
  setAtividadesSelecionadas(List lista) {
    lista.forEach((element) => atividades_selecionadas.add(element));
    print(atividades_selecionadas);
  }

  @action
  setMedicamentosSelecionados(List lista) {
    lista.forEach((element) => medicamentos_selecionados.add(element));
    print(medicamentos_selecionados);
  }

  @action
  getAllAtividades() async{
    List<Atividade> atividades_banco = await atividade_helper.getAllAtividades();
    atividades.clear();
    atividades_banco.forEach((element) => atividades.add(element.toJson()));
  }

  @action
  getAllMedicamentos() async{
    List<Medicamento> medicamentos_banco = await helper.getAllMedicamento();
    medicamentos.clear();
    medicamentos_banco.forEach((element) => medicamentos.add(element.toJson()));
  }

  @action
  getAtividadesRelacionadas(int pressao) async{
    List<Atividade> atividades_banco = await atividade_helper.getAllAtividadesRelacionadas(pressao);
    print(atividades_banco);
    atividadesRelacionadas.clear();
   atividades_banco.forEach((element) => atividadesRelacionadas.add(element.toJson()));
  }

  @action
 getMedicamentosRelacionadas(int pressao) async{
    List<Medicamento> medicamentos_banco = await helper.getAllMedicamentosRelacionados(pressao);
    print(medicamentos_banco);
    medicamentosRelacionadas.clear();
    medicamentos_banco.forEach((element) => medicamentosRelacionadas.add(element.toJson()));
  }

  @action
  setPostura(int valor){
    postura = valor;
  }

  @action
  setBraco(int valor){
    braco = valor;
  }

  @action
  setPulso(double  valor){
    pulso = valor;
  }

  @action
  setAnotacao(String anotacao) async{
    print(anotacao);
  registroObj.sistolica = pressao.end;
  registroObj.diastolica = pressao.start;
  registroObj.pulso = pulso;
  registroObj.postura = postura;
  registroObj.braco = braco;
  registroObj.anotacao = anotacao;
  registroObj.dataHora = DateTime.now();
  registroObj.id_usuario = 1;
  var registrado = await registro_helper.saveRegistro(registroObj);
  if(atividades_selecionadas.length>0) {
    for(var atividade in atividades_selecionadas) {
      await registro_helper.saveAtividadePressao(AtividadePressao(idAtividade: atividade,idPressao: registrado.id));
    }

    for(var medicamento in medicamentos_selecionados) {
      await registro_helper.saveMedicamentoPressao(MedicamentoPressao(idMedicamento: medicamento,idPressao: registrado.id));
    }
  }
  registroObj.sistolica = 0;
  registroObj.diastolica = 0;
  registroObj.pulso = 0;
  registroObj.postura = 0;
  registroObj.braco = 0;
  registroObj.anotacao = '';
  registroObj.dataHora = DateTime.now();
  print(registrado);
  }


  @action
  getAllRegistros() async{
    //listaEventos.clear();
    //eventosSelecionados.clear();
   print("length: ${eventosSelecionados.length}");
    List<RegistroPressao> event;
    registro_helper.getAllRegistroPressoes().then((lista) {
      event = lista;
      for (int i = 0; i < event.length; i++) {
        var createTime = DateTime(event[i].dataHora.year,event[i].dataHora.month,event[i].dataHora.day);
        var original = listaEventos[createTime];
        if (original == null) {
          listaEventos[createTime] = [{'id':event[i].id,'anotacao':'${event[i].anotacao}','descricao':'Sistolica:${event[i].sistolica.round()}  Diastolica: ${event[i].diastolica.round()}\n Pulso: ${event[i].pulso.round()}  Hora: ${event[i].dataHora.hour}:${event[i].dataHora.minute}'}];
        } else {
          listaEventos[createTime] = List.from(original)
      ..addAll([{'id':event[i].id,'anotacao':'${event[i].anotacao}','descricao':'Sistolica:${event[i].sistolica.round()}  Diastolica: ${event[i].diastolica.round()}\n Pulso: ${event[i].pulso.round()}  Hora: ${event[i].dataHora.hour}:${event[i].dataHora.minute}'}]);
        }
      }
      DateTime isso = DateTime.now();
      DateTime hj = DateTime(isso.year,isso.month,isso.day);
      eventosSelecionados = listaEventos[hj];
      print("${eventosSelecionados}=====================");
    });


  }
}

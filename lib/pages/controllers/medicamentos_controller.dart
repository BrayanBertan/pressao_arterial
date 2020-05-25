import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pressaoarterialapp/models/medicamento_model.dart';
import 'package:pressaoarterialapp/models/unidade_model.dart';
import 'package:pressaoarterialapp/models/tipo_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pressaoarterialapp/pages/configuracao_global.dart' as gc;
import 'package:pressaoarterialapp/Helpers/medicamento_helper.dart';
import 'dart:async';
part 'medicamentos_controller.g.dart';

class MedicamentoController = _MedicamentoController
    with _$MedicamentoController;

abstract class _MedicamentoController with Store {
  final helper = Modular.get<MedicamentoHelper>();

  _MedicamentoController() {
      medicamento_nome.text = '';
      medicamento_dose.text = '';
      medicamento_quantidade_diaria.text = '';
      medicamento_anotacao.text = '';
  }
  @observable
   TextEditingController medicamento_nome = TextEditingController();
  @observable
   TextEditingController medicamento_dose = TextEditingController();
  @observable
   TextEditingController medicamento_quantidade_diaria =
  TextEditingController();
  @observable
   TextEditingController medicamento_anotacao = TextEditingController();

  @observable
  Medicamento remedio = Medicamento(
      nome: "",
      dose: 0,
      quantidade_diaria: 0,
      id_unidade: 1,
      id_tipo: 1,
      anotacao: "",
      descricao: "",
      id_usuario: 1
  );
  @observable
  ObservableList<Unidade> unidades = [
    Unidade(id: 1, nome: 'Comprimido'),
    Unidade(id: 2, nome: 'Mg'),
    Unidade(id: 3, nome: 'G'),
    Unidade(id: 4, nome: 'Ml'),
    Unidade(id: 5, nome: 'Gotas'),
  ].asObservable();

  @observable
  ObservableList<Tipo> tipos = [
    Tipo(id: 1, nome: 'Relaxante Muscular'),
    Tipo(id: 2, nome: 'Anticoagulante'),
    Tipo(id: 3, nome: 'anti-hipertensivo'),
    Tipo(id: 4, nome: 'Analgésico'),
    Tipo(id: 5, nome: 'Antidiabético'),
    Tipo(id: 6, nome: 'Suplemento de vitamina'),
    Tipo(id: 7, nome: 'Anti-inflamatório'),
    Tipo(id: 8, nome: 'Ansiolitíco'),
    Tipo(id: 9, nome: 'Anticonvulsionante')
  ].asObservable();

  @observable
  ObservableList<Medicamento> remedios = [
    Medicamento(
        nome: "Carregando medicamentos",
        dose: 1,
        quantidade_diaria: 1,
        id_unidade: 1,
        id_tipo: 1,
        anotacao: "bbbb")
  ].asObservable();

  @observable
  bool show = false;

  @action
  setShow(bool valor) {
    show = valor;
  }

  @action
  setUnidadeSelecionada(int valor) {
    remedio.id_unidade = valor;
    unidades.add(Unidade(id: 100, nome: 'T'));
    unidades.removeLast();
  }

  @action
  setTipoSelecionado(int valor) {
    remedio.id_tipo = valor;
    tipos.add(Tipo(id: 100, nome: 'T'));
    tipos.removeLast();
  }

  @action
  setMedicamentos() async {
    remedio.id_usuario = gc.perfilSelecionado.id;
    remedio.nome = medicamento_nome.text;
    remedio.dose = int.tryParse(medicamento_dose.text);
    remedio.quantidade_diaria = int.tryParse(medicamento_quantidade_diaria.text);
    remedio.anotacao = medicamento_anotacao.text;
    remedio.descricao = '(${tipos[remedio.id_tipo-1].toString()}) ${remedio.dose}${unidades[remedio.id_unidade-1].toString()} ${remedio.quantidade_diaria} vez(es) ao dia';
    if(remedio.id != null) {
      await helper.updateMedicamento(remedio);
    }else{
      await helper.saveMedicamento(remedio);
    }
    clearRemedio();
    getAllMedicamentos();
  }

  @action
  clearRemedio(){
    remedio.id = null;
    remedio = Medicamento(
        nome: "",
        dose: 0,
        quantidade_diaria: 0,
        id_unidade: 1,
        id_tipo: 1,
        anotacao: "",
        descricao:""
    );
    medicamento_nome.text = '';
    medicamento_dose.text = '';
    medicamento_quantidade_diaria.text = '';
    medicamento_anotacao.text = '';
  }

  @action
  getAllMedicamentos() async {
    remedios.clear();
    List lista = new List();
    lista.clear();
    lista = await helper.getAllMedicamento();
    lista.forEach((element) => remedios.add(element));
  }

  @action
  setEditMedicamento(Medicamento m){
    remedio = m;
    medicamento_nome.text = m.nome;
    medicamento_dose.text = "${m.dose}";
    medicamento_quantidade_diaria.text = "${m.quantidade_diaria}";
    medicamento_anotacao.text = m.anotacao;
  }

  @action
  removeMedicamento(int id) async {
    await helper.deleteMedicamento(id);
    clearRemedio();
    getAllMedicamentos();
  }

}

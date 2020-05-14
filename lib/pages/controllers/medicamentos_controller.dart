import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pressaoarterialapp/models/medicamento_model.dart';
import 'package:pressaoarterialapp/models/unidade_model.dart';
import 'package:pressaoarterialapp/models/tipo_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pressaoarterialapp/repositories/medicamentosapi_repository.dart';
import 'package:pressaoarterialapp/Helpers/medicamento_helper.dart';
import 'dart:async';
part 'medicamentos_controller.g.dart';

class MedicamentoController = _MedicamentoController
    with _$MedicamentoController;

abstract class _MedicamentoController with Store {
  final api = Modular.get<MedicamentoApiRepository>();
  final apiLite = Modular.get<MedicamentoHelper>();
  MedicamentoHelper helper = MedicamentoHelper();

  @observable
  Medicamento remedio = Medicamento(
      nome: "",
      dose: 0,
      quantidade_diaria: 0,
      id_unidade: 1,
      id_tipo: 1,
      anotacao: ""
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
  bool carregandoLista = false;

  @action
  setCarregandoLista(bool valor) {
    print(valor);
    carregandoLista = valor;
  }

  @action
  setMedicamentoTeste() async {
    Medicamento m = Medicamento();
    m.nome = "";
    m.dose = 0;
    m.quantidade_diaria = 0;
    m.id_unidade = 1;
    m.id_tipo = 1;
    m.anotacao = "";
    await helper.saveMedicamentoL(m);
    helper.getAllMedicamento().then((list){
      print(list);
    });
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
  setMedicamentos(
      String nomeTxt, String doseTxt, quantidade_diariaTxt, anotacaoTxt) async {
    setCarregandoLista(true);
    if(remedio.id != null) {
      remedio.nome = nomeTxt;
      remedio.dose = int.tryParse(doseTxt);
      remedio.quantidade_diaria = int.tryParse(quantidade_diariaTxt);
      remedio.anotacao = anotacaoTxt;
      await helper.updateMedicamentoL(remedio);
      remedio.id = null;
      remedio = Medicamento(
          nome: "",
          dose: 0,
          quantidade_diaria: 0,
          id_unidade: 1,
          id_tipo: 1,
          anotacao: ""
      );
    }else{
      remedio.nome = nomeTxt;
      remedio.dose = int.tryParse(doseTxt);
      remedio.quantidade_diaria = int.tryParse(quantidade_diariaTxt);
      remedio.anotacao = anotacaoTxt;
      //await api.setMedicamento(remedio);
      await helper.saveMedicamentoL(remedio);
      remedio.id = null;
      remedio = Medicamento(
          nome: "",
          dose: 0,
          quantidade_diaria: 0,
          id_unidade: 1,
          id_tipo: 1,
          anotacao: ""
      );
    }

    getAllMedicamentos();
    //await getAllMedicamentos();
  }

  @action
  getAllMedicamentos() async {
    print("xd");
    setCarregandoLista(true);
    remedios.clear();
    List l = new List();
    l.clear();
    l = await helper.getAllMedicamento();
    //remedios.removeAt(0);
    l.forEach((element) => remedios.add(element));
    setCarregandoLista(false);
  }

  @action
  setEditMedicamento(Medicamento m){
    remedio = m;
  }

}

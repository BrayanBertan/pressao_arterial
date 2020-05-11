import 'package:mobx/mobx.dart';
import 'package:pressaoarterialapp/models/medicamento_model.dart';
import 'package:pressaoarterialapp/models/unidade_model.dart';
import 'package:pressaoarterialapp/models/tipo_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pressaoarterialapp/repositories/medicamentosapi_repository.dart';
part 'medicamentos_controller.g.dart';


class MedicamentoController = _MedicamentoController with _$MedicamentoController;

abstract class _MedicamentoController with Store {
  final api = Modular.get<MedicamentoApiRepository>();

  @observable
  Medicamento remedio = Medicamento(nome:"teste",dose:0,quantidade_diaria:0,id_unidade:1,id_tipo:1,anotacao:"aaa");
  @observable
  ObservableList<Unidade> unidades = [
    Unidade(id:1,nome:'Ml'),
    Unidade(id:2,nome:'Mg'),
    Unidade(id:3,nome: 'G'),
    Unidade(id:4,nome:'Comprimido'),
    Unidade(id:5,nome: 'Gotas'),
    ].asObservable();

  @observable
  ObservableList<Tipo> tipos = [
    Tipo(id:1,nome:'Relaxante Muscular'),
    Tipo(id:2,nome:'Anticoagulante'),
    Tipo(id:3,nome: 'anti-hipertensivo'),
    Tipo(id:4,nome:'Analgésico'),
    Tipo(id:5,nome:'Antidiabético'),
    Tipo(id:6,nome: 'Suplemento de vitamina'),
    Tipo(id:7,nome:'Anti-inflamatório'),
    Tipo(id:8,nome:'Ansiolitíco'),
    Tipo(id:9,nome: 'Anticonvulsionante')
  ].asObservable();

  @observable
  ObservableList<Medicamento> medicamentos = [].asObservable();

  //@action
  //getMedicamento(Medicamento valor) => remedio = valor;
  @action
  setUnidadeSelecionada(int valor) {
    remedio.id_unidade = valor;
    unidades.add( Unidade(id:100,nome: 'T'));
    unidades.removeLast();
  }
  @action
  setTipoSelecionado(int valor) {
    remedio.id_tipo = valor;
    tipos.add( Tipo(id:100,nome: 'T'));
    tipos.removeLast();
  }

  @action
  setMedicamentos() async {
    api.setMedicamento();
  }

}
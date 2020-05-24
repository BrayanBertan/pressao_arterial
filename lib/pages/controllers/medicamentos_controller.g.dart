// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicamentos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedicamentoController on _MedicamentoController, Store {
  final _$medicamento_nomeAtom =
      Atom(name: '_MedicamentoController.medicamento_nome');

  @override
  TextEditingController get medicamento_nome {
    _$medicamento_nomeAtom.context.enforceReadPolicy(_$medicamento_nomeAtom);
    _$medicamento_nomeAtom.reportObserved();
    return super.medicamento_nome;
  }

  @override
  set medicamento_nome(TextEditingController value) {
    _$medicamento_nomeAtom.context.conditionallyRunInAction(() {
      super.medicamento_nome = value;
      _$medicamento_nomeAtom.reportChanged();
    }, _$medicamento_nomeAtom, name: '${_$medicamento_nomeAtom.name}_set');
  }

  final _$medicamento_doseAtom =
      Atom(name: '_MedicamentoController.medicamento_dose');

  @override
  TextEditingController get medicamento_dose {
    _$medicamento_doseAtom.context.enforceReadPolicy(_$medicamento_doseAtom);
    _$medicamento_doseAtom.reportObserved();
    return super.medicamento_dose;
  }

  @override
  set medicamento_dose(TextEditingController value) {
    _$medicamento_doseAtom.context.conditionallyRunInAction(() {
      super.medicamento_dose = value;
      _$medicamento_doseAtom.reportChanged();
    }, _$medicamento_doseAtom, name: '${_$medicamento_doseAtom.name}_set');
  }

  final _$medicamento_quantidade_diariaAtom =
      Atom(name: '_MedicamentoController.medicamento_quantidade_diaria');

  @override
  TextEditingController get medicamento_quantidade_diaria {
    _$medicamento_quantidade_diariaAtom.context
        .enforceReadPolicy(_$medicamento_quantidade_diariaAtom);
    _$medicamento_quantidade_diariaAtom.reportObserved();
    return super.medicamento_quantidade_diaria;
  }

  @override
  set medicamento_quantidade_diaria(TextEditingController value) {
    _$medicamento_quantidade_diariaAtom.context.conditionallyRunInAction(() {
      super.medicamento_quantidade_diaria = value;
      _$medicamento_quantidade_diariaAtom.reportChanged();
    }, _$medicamento_quantidade_diariaAtom,
        name: '${_$medicamento_quantidade_diariaAtom.name}_set');
  }

  final _$medicamento_anotacaoAtom =
      Atom(name: '_MedicamentoController.medicamento_anotacao');

  @override
  TextEditingController get medicamento_anotacao {
    _$medicamento_anotacaoAtom.context
        .enforceReadPolicy(_$medicamento_anotacaoAtom);
    _$medicamento_anotacaoAtom.reportObserved();
    return super.medicamento_anotacao;
  }

  @override
  set medicamento_anotacao(TextEditingController value) {
    _$medicamento_anotacaoAtom.context.conditionallyRunInAction(() {
      super.medicamento_anotacao = value;
      _$medicamento_anotacaoAtom.reportChanged();
    }, _$medicamento_anotacaoAtom,
        name: '${_$medicamento_anotacaoAtom.name}_set');
  }

  final _$remedioAtom = Atom(name: '_MedicamentoController.remedio');

  @override
  Medicamento get remedio {
    _$remedioAtom.context.enforceReadPolicy(_$remedioAtom);
    _$remedioAtom.reportObserved();
    return super.remedio;
  }

  @override
  set remedio(Medicamento value) {
    _$remedioAtom.context.conditionallyRunInAction(() {
      super.remedio = value;
      _$remedioAtom.reportChanged();
    }, _$remedioAtom, name: '${_$remedioAtom.name}_set');
  }

  final _$unidadesAtom = Atom(name: '_MedicamentoController.unidades');

  @override
  ObservableList<Unidade> get unidades {
    _$unidadesAtom.context.enforceReadPolicy(_$unidadesAtom);
    _$unidadesAtom.reportObserved();
    return super.unidades;
  }

  @override
  set unidades(ObservableList<Unidade> value) {
    _$unidadesAtom.context.conditionallyRunInAction(() {
      super.unidades = value;
      _$unidadesAtom.reportChanged();
    }, _$unidadesAtom, name: '${_$unidadesAtom.name}_set');
  }

  final _$tiposAtom = Atom(name: '_MedicamentoController.tipos');

  @override
  ObservableList<Tipo> get tipos {
    _$tiposAtom.context.enforceReadPolicy(_$tiposAtom);
    _$tiposAtom.reportObserved();
    return super.tipos;
  }

  @override
  set tipos(ObservableList<Tipo> value) {
    _$tiposAtom.context.conditionallyRunInAction(() {
      super.tipos = value;
      _$tiposAtom.reportChanged();
    }, _$tiposAtom, name: '${_$tiposAtom.name}_set');
  }

  final _$remediosAtom = Atom(name: '_MedicamentoController.remedios');

  @override
  ObservableList<Medicamento> get remedios {
    _$remediosAtom.context.enforceReadPolicy(_$remediosAtom);
    _$remediosAtom.reportObserved();
    return super.remedios;
  }

  @override
  set remedios(ObservableList<Medicamento> value) {
    _$remediosAtom.context.conditionallyRunInAction(() {
      super.remedios = value;
      _$remediosAtom.reportChanged();
    }, _$remediosAtom, name: '${_$remediosAtom.name}_set');
  }

  final _$showAtom = Atom(name: '_MedicamentoController.show');

  @override
  bool get show {
    _$showAtom.context.enforceReadPolicy(_$showAtom);
    _$showAtom.reportObserved();
    return super.show;
  }

  @override
  set show(bool value) {
    _$showAtom.context.conditionallyRunInAction(() {
      super.show = value;
      _$showAtom.reportChanged();
    }, _$showAtom, name: '${_$showAtom.name}_set');
  }

  final _$setMedicamentosAsyncAction = AsyncAction('setMedicamentos');

  @override
  Future setMedicamentos() {
    return _$setMedicamentosAsyncAction.run(() => super.setMedicamentos());
  }

  final _$getAllMedicamentosAsyncAction = AsyncAction('getAllMedicamentos');

  @override
  Future getAllMedicamentos() {
    return _$getAllMedicamentosAsyncAction
        .run(() => super.getAllMedicamentos());
  }

  final _$removeMedicamentoAsyncAction = AsyncAction('removeMedicamento');

  @override
  Future removeMedicamento(int id) {
    return _$removeMedicamentoAsyncAction
        .run(() => super.removeMedicamento(id));
  }

  final _$_MedicamentoControllerActionController =
      ActionController(name: '_MedicamentoController');

  @override
  dynamic setShow(bool valor) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction();
    try {
      return super.setShow(valor);
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUnidadeSelecionada(int valor) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction();
    try {
      return super.setUnidadeSelecionada(valor);
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTipoSelecionado(int valor) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction();
    try {
      return super.setTipoSelecionado(valor);
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearRemedio() {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction();
    try {
      return super.clearRemedio();
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEditMedicamento(Medicamento m) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction();
    try {
      return super.setEditMedicamento(m);
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'medicamento_nome: ${medicamento_nome.toString()},medicamento_dose: ${medicamento_dose.toString()},medicamento_quantidade_diaria: ${medicamento_quantidade_diaria.toString()},medicamento_anotacao: ${medicamento_anotacao.toString()},remedio: ${remedio.toString()},unidades: ${unidades.toString()},tipos: ${tipos.toString()},remedios: ${remedios.toString()},show: ${show.toString()}';
    return '{$string}';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicamentos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedicamentoController on _MedicamentoController, Store {
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

  final _$carregandoListaAtom =
      Atom(name: '_MedicamentoController.carregandoLista');

  @override
  bool get carregandoLista {
    _$carregandoListaAtom.context.enforceReadPolicy(_$carregandoListaAtom);
    _$carregandoListaAtom.reportObserved();
    return super.carregandoLista;
  }

  @override
  set carregandoLista(bool value) {
    _$carregandoListaAtom.context.conditionallyRunInAction(() {
      super.carregandoLista = value;
      _$carregandoListaAtom.reportChanged();
    }, _$carregandoListaAtom, name: '${_$carregandoListaAtom.name}_set');
  }

  final _$setMedicamentoTesteAsyncAction = AsyncAction('setMedicamentoTeste');

  @override
  Future setMedicamentoTeste() {
    return _$setMedicamentoTesteAsyncAction
        .run(() => super.setMedicamentoTeste());
  }

  final _$setMedicamentosAsyncAction = AsyncAction('setMedicamentos');

  @override
  Future setMedicamentos(String nomeTxt, String doseTxt,
      dynamic quantidade_diariaTxt, dynamic anotacaoTxt) {
    return _$setMedicamentosAsyncAction.run(() => super
        .setMedicamentos(nomeTxt, doseTxt, quantidade_diariaTxt, anotacaoTxt));
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
  dynamic setCarregandoLista(bool valor) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction();
    try {
      return super.setCarregandoLista(valor);
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
        'remedio: ${remedio.toString()},unidades: ${unidades.toString()},tipos: ${tipos.toString()},remedios: ${remedios.toString()},carregandoLista: ${carregandoLista.toString()}';
    return '{$string}';
  }
}

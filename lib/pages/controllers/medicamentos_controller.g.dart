// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicamentos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedicamentoController on _MedicamentoController, Store {
  final _$medicamento_nomeAtom =
      Atom(name: '_MedicamentoController.medicamento_nome');

  @override
  TextEditingController get medicamento_nome {
    _$medicamento_nomeAtom.reportRead();
    return super.medicamento_nome;
  }

  @override
  set medicamento_nome(TextEditingController value) {
    _$medicamento_nomeAtom.reportWrite(value, super.medicamento_nome, () {
      super.medicamento_nome = value;
    });
  }

  final _$medicamento_doseAtom =
      Atom(name: '_MedicamentoController.medicamento_dose');

  @override
  TextEditingController get medicamento_dose {
    _$medicamento_doseAtom.reportRead();
    return super.medicamento_dose;
  }

  @override
  set medicamento_dose(TextEditingController value) {
    _$medicamento_doseAtom.reportWrite(value, super.medicamento_dose, () {
      super.medicamento_dose = value;
    });
  }

  final _$medicamento_quantidade_diariaAtom =
      Atom(name: '_MedicamentoController.medicamento_quantidade_diaria');

  @override
  TextEditingController get medicamento_quantidade_diaria {
    _$medicamento_quantidade_diariaAtom.reportRead();
    return super.medicamento_quantidade_diaria;
  }

  @override
  set medicamento_quantidade_diaria(TextEditingController value) {
    _$medicamento_quantidade_diariaAtom
        .reportWrite(value, super.medicamento_quantidade_diaria, () {
      super.medicamento_quantidade_diaria = value;
    });
  }

  final _$medicamento_anotacaoAtom =
      Atom(name: '_MedicamentoController.medicamento_anotacao');

  @override
  TextEditingController get medicamento_anotacao {
    _$medicamento_anotacaoAtom.reportRead();
    return super.medicamento_anotacao;
  }

  @override
  set medicamento_anotacao(TextEditingController value) {
    _$medicamento_anotacaoAtom.reportWrite(value, super.medicamento_anotacao,
        () {
      super.medicamento_anotacao = value;
    });
  }

  final _$remedioAtom = Atom(name: '_MedicamentoController.remedio');

  @override
  Medicamento get remedio {
    _$remedioAtom.reportRead();
    return super.remedio;
  }

  @override
  set remedio(Medicamento value) {
    _$remedioAtom.reportWrite(value, super.remedio, () {
      super.remedio = value;
    });
  }

  final _$unidadesAtom = Atom(name: '_MedicamentoController.unidades');

  @override
  ObservableList<Unidade> get unidades {
    _$unidadesAtom.reportRead();
    return super.unidades;
  }

  @override
  set unidades(ObservableList<Unidade> value) {
    _$unidadesAtom.reportWrite(value, super.unidades, () {
      super.unidades = value;
    });
  }

  final _$tiposAtom = Atom(name: '_MedicamentoController.tipos');

  @override
  ObservableList<Tipo> get tipos {
    _$tiposAtom.reportRead();
    return super.tipos;
  }

  @override
  set tipos(ObservableList<Tipo> value) {
    _$tiposAtom.reportWrite(value, super.tipos, () {
      super.tipos = value;
    });
  }

  final _$remediosAtom = Atom(name: '_MedicamentoController.remedios');

  @override
  ObservableList<Medicamento> get remedios {
    _$remediosAtom.reportRead();
    return super.remedios;
  }

  @override
  set remedios(ObservableList<Medicamento> value) {
    _$remediosAtom.reportWrite(value, super.remedios, () {
      super.remedios = value;
    });
  }

  final _$showAtom = Atom(name: '_MedicamentoController.show');

  @override
  bool get show {
    _$showAtom.reportRead();
    return super.show;
  }

  @override
  set show(bool value) {
    _$showAtom.reportWrite(value, super.show, () {
      super.show = value;
    });
  }

  final _$setMedicamentosAsyncAction =
      AsyncAction('_MedicamentoController.setMedicamentos');

  @override
  Future setMedicamentos() {
    return _$setMedicamentosAsyncAction.run(() => super.setMedicamentos());
  }

  final _$getAllMedicamentosAsyncAction =
      AsyncAction('_MedicamentoController.getAllMedicamentos');

  @override
  Future getAllMedicamentos() {
    return _$getAllMedicamentosAsyncAction
        .run(() => super.getAllMedicamentos());
  }

  final _$removeMedicamentoAsyncAction =
      AsyncAction('_MedicamentoController.removeMedicamento');

  @override
  Future removeMedicamento(int id) {
    return _$removeMedicamentoAsyncAction
        .run(() => super.removeMedicamento(id));
  }

  final _$_MedicamentoControllerActionController =
      ActionController(name: '_MedicamentoController');

  @override
  dynamic setShow(bool valor) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction(
        name: '_MedicamentoController.setShow');
    try {
      return super.setShow(valor);
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUnidadeSelecionada(int valor) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction(
        name: '_MedicamentoController.setUnidadeSelecionada');
    try {
      return super.setUnidadeSelecionada(valor);
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTipoSelecionado(int valor) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction(
        name: '_MedicamentoController.setTipoSelecionado');
    try {
      return super.setTipoSelecionado(valor);
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearRemedio() {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction(
        name: '_MedicamentoController.clearRemedio');
    try {
      return super.clearRemedio();
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEditMedicamento(Medicamento m) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction(
        name: '_MedicamentoController.setEditMedicamento');
    try {
      return super.setEditMedicamento(m);
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medicamento_nome: ${medicamento_nome},
medicamento_dose: ${medicamento_dose},
medicamento_quantidade_diaria: ${medicamento_quantidade_diaria},
medicamento_anotacao: ${medicamento_anotacao},
remedio: ${remedio},
unidades: ${unidades},
tipos: ${tipos},
remedios: ${remedios},
show: ${show}
    ''';
  }
}

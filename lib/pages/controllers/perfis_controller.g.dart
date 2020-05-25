// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfis_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilController, Store {
  final _$avatarSelecionadoAtom =
      Atom(name: '_PerfilController.avatarSelecionado');

  @override
  int get avatarSelecionado {
    _$avatarSelecionadoAtom.context.enforceReadPolicy(_$avatarSelecionadoAtom);
    _$avatarSelecionadoAtom.reportObserved();
    return super.avatarSelecionado;
  }

  @override
  set avatarSelecionado(int value) {
    _$avatarSelecionadoAtom.context.conditionallyRunInAction(() {
      super.avatarSelecionado = value;
      _$avatarSelecionadoAtom.reportChanged();
    }, _$avatarSelecionadoAtom, name: '${_$avatarSelecionadoAtom.name}_set');
  }

  final _$modoEdicaoAtom = Atom(name: '_PerfilController.modoEdicao');

  @override
  bool get modoEdicao {
    _$modoEdicaoAtom.context.enforceReadPolicy(_$modoEdicaoAtom);
    _$modoEdicaoAtom.reportObserved();
    return super.modoEdicao;
  }

  @override
  set modoEdicao(bool value) {
    _$modoEdicaoAtom.context.conditionallyRunInAction(() {
      super.modoEdicao = value;
      _$modoEdicaoAtom.reportChanged();
    }, _$modoEdicaoAtom, name: '${_$modoEdicaoAtom.name}_set');
  }

  final _$showListaAtom = Atom(name: '_PerfilController.showLista');

  @override
  bool get showLista {
    _$showListaAtom.context.enforceReadPolicy(_$showListaAtom);
    _$showListaAtom.reportObserved();
    return super.showLista;
  }

  @override
  set showLista(bool value) {
    _$showListaAtom.context.conditionallyRunInAction(() {
      super.showLista = value;
      _$showListaAtom.reportChanged();
    }, _$showListaAtom, name: '${_$showListaAtom.name}_set');
  }

  final _$avatarLinkSelecionadoAtom =
      Atom(name: '_PerfilController.avatarLinkSelecionado');

  @override
  String get avatarLinkSelecionado {
    _$avatarLinkSelecionadoAtom.context
        .enforceReadPolicy(_$avatarLinkSelecionadoAtom);
    _$avatarLinkSelecionadoAtom.reportObserved();
    return super.avatarLinkSelecionado;
  }

  @override
  set avatarLinkSelecionado(String value) {
    _$avatarLinkSelecionadoAtom.context.conditionallyRunInAction(() {
      super.avatarLinkSelecionado = value;
      _$avatarLinkSelecionadoAtom.reportChanged();
    }, _$avatarLinkSelecionadoAtom,
        name: '${_$avatarLinkSelecionadoAtom.name}_set');
  }

  final _$avatarNomeAtom = Atom(name: '_PerfilController.avatarNome');

  @override
  String get avatarNome {
    _$avatarNomeAtom.context.enforceReadPolicy(_$avatarNomeAtom);
    _$avatarNomeAtom.reportObserved();
    return super.avatarNome;
  }

  @override
  set avatarNome(String value) {
    _$avatarNomeAtom.context.conditionallyRunInAction(() {
      super.avatarNome = value;
      _$avatarNomeAtom.reportChanged();
    }, _$avatarNomeAtom, name: '${_$avatarNomeAtom.name}_set');
  }

  final _$listaPerfisAtom = Atom(name: '_PerfilController.listaPerfis');

  @override
  ObservableList<dynamic> get listaPerfis {
    _$listaPerfisAtom.context.enforceReadPolicy(_$listaPerfisAtom);
    _$listaPerfisAtom.reportObserved();
    return super.listaPerfis;
  }

  @override
  set listaPerfis(ObservableList<dynamic> value) {
    _$listaPerfisAtom.context.conditionallyRunInAction(() {
      super.listaPerfis = value;
      _$listaPerfisAtom.reportChanged();
    }, _$listaPerfisAtom, name: '${_$listaPerfisAtom.name}_set');
  }

  final _$objPerfilAtom = Atom(name: '_PerfilController.objPerfil');

  @override
  Perfil get objPerfil {
    _$objPerfilAtom.context.enforceReadPolicy(_$objPerfilAtom);
    _$objPerfilAtom.reportObserved();
    return super.objPerfil;
  }

  @override
  set objPerfil(Perfil value) {
    _$objPerfilAtom.context.conditionallyRunInAction(() {
      super.objPerfil = value;
      _$objPerfilAtom.reportChanged();
    }, _$objPerfilAtom, name: '${_$objPerfilAtom.name}_set');
  }

  final _$setAvatarAsyncAction = AsyncAction('setAvatar');

  @override
  Future setAvatar() {
    return _$setAvatarAsyncAction.run(() => super.setAvatar());
  }

  final _$getAllPerfisAsyncAction = AsyncAction('getAllPerfis');

  @override
  Future getAllPerfis() {
    return _$getAllPerfisAsyncAction.run(() => super.getAllPerfis());
  }

  final _$_PerfilControllerActionController =
      ActionController(name: '_PerfilController');

  @override
  dynamic setAvatarSelecionado(int index) {
    final _$actionInfo = _$_PerfilControllerActionController.startAction();
    try {
      return super.setAvatarSelecionado(index);
    } finally {
      _$_PerfilControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowLista(bool valor) {
    final _$actionInfo = _$_PerfilControllerActionController.startAction();
    try {
      return super.setShowLista(valor);
    } finally {
      _$_PerfilControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEdicao(Perfil p) {
    final _$actionInfo = _$_PerfilControllerActionController.startAction();
    try {
      return super.setEdicao(p);
    } finally {
      _$_PerfilControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearPerfil() {
    final _$actionInfo = _$_PerfilControllerActionController.startAction();
    try {
      return super.clearPerfil();
    } finally {
      _$_PerfilControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'avatarSelecionado: ${avatarSelecionado.toString()},modoEdicao: ${modoEdicao.toString()},showLista: ${showLista.toString()},avatarLinkSelecionado: ${avatarLinkSelecionado.toString()},avatarNome: ${avatarNome.toString()},listaPerfis: ${listaPerfis.toString()},objPerfil: ${objPerfil.toString()}';
    return '{$string}';
  }
}

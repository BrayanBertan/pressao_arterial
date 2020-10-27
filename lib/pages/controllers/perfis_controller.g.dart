// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfis_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilController, Store {
  final _$avatarSelecionadoAtom =
      Atom(name: '_PerfilController.avatarSelecionado');

  @override
  int get avatarSelecionado {
    _$avatarSelecionadoAtom.reportRead();
    return super.avatarSelecionado;
  }

  @override
  set avatarSelecionado(int value) {
    _$avatarSelecionadoAtom.reportWrite(value, super.avatarSelecionado, () {
      super.avatarSelecionado = value;
    });
  }

  final _$modoEdicaoAtom = Atom(name: '_PerfilController.modoEdicao');

  @override
  bool get modoEdicao {
    _$modoEdicaoAtom.reportRead();
    return super.modoEdicao;
  }

  @override
  set modoEdicao(bool value) {
    _$modoEdicaoAtom.reportWrite(value, super.modoEdicao, () {
      super.modoEdicao = value;
    });
  }

  final _$showListaAtom = Atom(name: '_PerfilController.showLista');

  @override
  bool get showLista {
    _$showListaAtom.reportRead();
    return super.showLista;
  }

  @override
  set showLista(bool value) {
    _$showListaAtom.reportWrite(value, super.showLista, () {
      super.showLista = value;
    });
  }

  final _$avatarLinkSelecionadoAtom =
      Atom(name: '_PerfilController.avatarLinkSelecionado');

  @override
  String get avatarLinkSelecionado {
    _$avatarLinkSelecionadoAtom.reportRead();
    return super.avatarLinkSelecionado;
  }

  @override
  set avatarLinkSelecionado(String value) {
    _$avatarLinkSelecionadoAtom.reportWrite(value, super.avatarLinkSelecionado,
        () {
      super.avatarLinkSelecionado = value;
    });
  }

  final _$avatarNomeAtom = Atom(name: '_PerfilController.avatarNome');

  @override
  String get avatarNome {
    _$avatarNomeAtom.reportRead();
    return super.avatarNome;
  }

  @override
  set avatarNome(String value) {
    _$avatarNomeAtom.reportWrite(value, super.avatarNome, () {
      super.avatarNome = value;
    });
  }

  final _$listaPerfisAtom = Atom(name: '_PerfilController.listaPerfis');

  @override
  ObservableList<dynamic> get listaPerfis {
    _$listaPerfisAtom.reportRead();
    return super.listaPerfis;
  }

  @override
  set listaPerfis(ObservableList<dynamic> value) {
    _$listaPerfisAtom.reportWrite(value, super.listaPerfis, () {
      super.listaPerfis = value;
    });
  }

  final _$objPerfilAtom = Atom(name: '_PerfilController.objPerfil');

  @override
  Perfil get objPerfil {
    _$objPerfilAtom.reportRead();
    return super.objPerfil;
  }

  @override
  set objPerfil(Perfil value) {
    _$objPerfilAtom.reportWrite(value, super.objPerfil, () {
      super.objPerfil = value;
    });
  }

  final _$batteryChannelAtom = Atom(name: '_PerfilController.batteryChannel');

  @override
  MethodChannel get batteryChannel {
    _$batteryChannelAtom.reportRead();
    return super.batteryChannel;
  }

  @override
  set batteryChannel(MethodChannel value) {
    _$batteryChannelAtom.reportWrite(value, super.batteryChannel, () {
      super.batteryChannel = value;
    });
  }

  final _$bateriaAtom = Atom(name: '_PerfilController.bateria');

  @override
  String get bateria {
    _$bateriaAtom.reportRead();
    return super.bateria;
  }

  @override
  set bateria(String value) {
    _$bateriaAtom.reportWrite(value, super.bateria, () {
      super.bateria = value;
    });
  }

  final _$getBateriaAsyncAction = AsyncAction('_PerfilController.getBateria');

  @override
  Future<void> getBateria() {
    return _$getBateriaAsyncAction.run(() => super.getBateria());
  }

  final _$setAvatarAsyncAction = AsyncAction('_PerfilController.setAvatar');

  @override
  Future setAvatar() {
    return _$setAvatarAsyncAction.run(() => super.setAvatar());
  }

  final _$getAllPerfisAsyncAction =
      AsyncAction('_PerfilController.getAllPerfis');

  @override
  Future getAllPerfis() {
    return _$getAllPerfisAsyncAction.run(() => super.getAllPerfis());
  }

  final _$_PerfilControllerActionController =
      ActionController(name: '_PerfilController');

  @override
  dynamic setAvatarSelecionado(int index) {
    final _$actionInfo = _$_PerfilControllerActionController.startAction(
        name: '_PerfilController.setAvatarSelecionado');
    try {
      return super.setAvatarSelecionado(index);
    } finally {
      _$_PerfilControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowLista(bool valor) {
    final _$actionInfo = _$_PerfilControllerActionController.startAction(
        name: '_PerfilController.setShowLista');
    try {
      return super.setShowLista(valor);
    } finally {
      _$_PerfilControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEdicao(Perfil p) {
    final _$actionInfo = _$_PerfilControllerActionController.startAction(
        name: '_PerfilController.setEdicao');
    try {
      return super.setEdicao(p);
    } finally {
      _$_PerfilControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearPerfil() {
    final _$actionInfo = _$_PerfilControllerActionController.startAction(
        name: '_PerfilController.clearPerfil');
    try {
      return super.clearPerfil();
    } finally {
      _$_PerfilControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
avatarSelecionado: ${avatarSelecionado},
modoEdicao: ${modoEdicao},
showLista: ${showLista},
avatarLinkSelecionado: ${avatarLinkSelecionado},
avatarNome: ${avatarNome},
listaPerfis: ${listaPerfis},
objPerfil: ${objPerfil},
batteryChannel: ${batteryChannel},
bateria: ${bateria}
    ''';
  }
}

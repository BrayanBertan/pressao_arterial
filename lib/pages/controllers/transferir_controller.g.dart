// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferir_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransferirController on _TransferirController, Store {
  final _$showDispositivosAtom =
      Atom(name: '_TransferirController.showDispositivos');

  @override
  bool get showDispositivos {
    _$showDispositivosAtom.reportRead();
    return super.showDispositivos;
  }

  @override
  set showDispositivos(bool value) {
    _$showDispositivosAtom.reportWrite(value, super.showDispositivos, () {
      super.showDispositivos = value;
    });
  }

  final _$showDispositivosPareadosAtom =
      Atom(name: '_TransferirController.showDispositivosPareados');

  @override
  bool get showDispositivosPareados {
    _$showDispositivosPareadosAtom.reportRead();
    return super.showDispositivosPareados;
  }

  @override
  set showDispositivosPareados(bool value) {
    _$showDispositivosPareadosAtom
        .reportWrite(value, super.showDispositivosPareados, () {
      super.showDispositivosPareados = value;
    });
  }

  final _$disableAtom = Atom(name: '_TransferirController.disable');

  @override
  bool get disable {
    _$disableAtom.reportRead();
    return super.disable;
  }

  @override
  set disable(bool value) {
    _$disableAtom.reportWrite(value, super.disable, () {
      super.disable = value;
    });
  }

  final _$bluetoothChannelAtom =
      Atom(name: '_TransferirController.bluetoothChannel');

  @override
  MethodChannel get bluetoothChannel {
    _$bluetoothChannelAtom.reportRead();
    return super.bluetoothChannel;
  }

  @override
  set bluetoothChannel(MethodChannel value) {
    _$bluetoothChannelAtom.reportWrite(value, super.bluetoothChannel, () {
      super.bluetoothChannel = value;
    });
  }

  final _$listaDispositivosAtom =
      Atom(name: '_TransferirController.listaDispositivos');

  @override
  ObservableList<dynamic> get listaDispositivos {
    _$listaDispositivosAtom.reportRead();
    return super.listaDispositivos;
  }

  @override
  set listaDispositivos(ObservableList<dynamic> value) {
    _$listaDispositivosAtom.reportWrite(value, super.listaDispositivos, () {
      super.listaDispositivos = value;
    });
  }

  final _$listaDispositivosPareadosAtom =
      Atom(name: '_TransferirController.listaDispositivosPareados');

  @override
  ObservableList<dynamic> get listaDispositivosPareados {
    _$listaDispositivosPareadosAtom.reportRead();
    return super.listaDispositivosPareados;
  }

  @override
  set listaDispositivosPareados(ObservableList<dynamic> value) {
    _$listaDispositivosPareadosAtom
        .reportWrite(value, super.listaDispositivosPareados, () {
      super.listaDispositivosPareados = value;
    });
  }

  final _$getListaDispositivosAsyncAction =
      AsyncAction('_TransferirController.getListaDispositivos');

  @override
  Future<void> getListaDispositivos() {
    return _$getListaDispositivosAsyncAction
        .run(() => super.getListaDispositivos());
  }

  final _$getListaDispositivosPareadosAsyncAction =
      AsyncAction('_TransferirController.getListaDispositivosPareados');

  @override
  Future<void> getListaDispositivosPareados() {
    return _$getListaDispositivosPareadosAsyncAction
        .run(() => super.getListaDispositivosPareados());
  }

  @override
  String toString() {
    return '''
showDispositivos: ${showDispositivos},
showDispositivosPareados: ${showDispositivosPareados},
disable: ${disable},
bluetoothChannel: ${bluetoothChannel},
listaDispositivos: ${listaDispositivos},
listaDispositivosPareados: ${listaDispositivosPareados}
    ''';
  }
}

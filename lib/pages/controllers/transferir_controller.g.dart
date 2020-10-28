// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferir_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransferirController on _TransferirController, Store {
  final _$batteryChannelAtom =
      Atom(name: '_TransferirController.batteryChannel');

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

  final _$listaDispositivosAtom =
      Atom(name: '_TransferirController.listaDispositivos');

  @override
  List<Map<dynamic, dynamic>> get listaDispositivos {
    _$listaDispositivosAtom.reportRead();
    return super.listaDispositivos;
  }

  @override
  set listaDispositivos(List<Map<dynamic, dynamic>> value) {
    _$listaDispositivosAtom.reportWrite(value, super.listaDispositivos, () {
      super.listaDispositivos = value;
    });
  }

  final _$getBateriaAsyncAction =
      AsyncAction('_TransferirController.getBateria');

  @override
  Future<void> getBateria() {
    return _$getBateriaAsyncAction.run(() => super.getBateria());
  }

  @override
  String toString() {
    return '''
batteryChannel: ${batteryChannel},
listaDispositivos: ${listaDispositivos}
    ''';
  }
}

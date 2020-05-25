// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dicas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DicaController on _DicaController, Store {
  final _$listaDicasAtom = Atom(name: '_DicaController.listaDicas');

  @override
  List<Map<String, String>> get listaDicas {
    _$listaDicasAtom.context.enforceReadPolicy(_$listaDicasAtom);
    _$listaDicasAtom.reportObserved();
    return super.listaDicas;
  }

  @override
  set listaDicas(List<Map<String, String>> value) {
    _$listaDicasAtom.context.conditionallyRunInAction(() {
      super.listaDicas = value;
      _$listaDicasAtom.reportChanged();
    }, _$listaDicasAtom, name: '${_$listaDicasAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'listaDicas: ${listaDicas.toString()}';
    return '{$string}';
  }
}

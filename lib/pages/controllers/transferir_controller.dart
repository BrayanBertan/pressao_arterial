import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pressaoarterialapp/pages/configuracao_global.dart' as gc;
import 'package:pressaoarterialapp/Helpers/perfil_helper.dart';
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pressaoarterialapp/models/perfil_model.dart';
import 'package:flutter/services.dart';
part 'transferir_controller.g.dart';

class TransferirController = _TransferirController with _$TransferirController;

abstract class _TransferirController with Store {
  final perfil_helper = Modular.get<PerfilHelper>();

  _PerfilController() {
  }


  @observable
  var batteryChannel =  MethodChannel('samples.flutter.dev/battery');

  @observable
   List<Map<dynamic, dynamic>> listaDispositivos = [];

  @action
  Future<void> getBateria() async {
    try {
      String retorno = await batteryChannel.invokeMethod('getBatteryLevel');
      var retornoArray = retorno.split(",");
      retornoArray.forEach((element) {
        listaDispositivos.add(
          {
            'nome':element.split("-")[0],
            'id':element.split("-")[0]
          }
        );
      });
      print(listaDispositivos);
      print('pegou');
    } on PlatformException catch (e) {
      print(e.message);
    }

  }
}

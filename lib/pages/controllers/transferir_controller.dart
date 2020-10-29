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

  _TransferirController() {
  }


  @observable
  bool showDispositivos;

  @observable
  bool showDispositivosPareados;

  @observable
  var bluetoothChannel =  MethodChannel('samples.flutter.dev/dispositivo');

  @observable
  ObservableList listaDispositivos = new List().asObservable();

  @observable
  ObservableList listaDispositivosPareados = new List().asObservable();

  @action
  Future<void> getListaDispositivos() async {
    print("show ${showDispositivos}");
    showDispositivos = false;
    listaDispositivos = [].asObservable();
    try {
      String retorno = '';
       retorno = await bluetoothChannel.invokeMethod('getListaDispositivos');
       print("retorno ${retorno}");
       if(retorno != '[]') {
         var retornoArray = retorno.split(",");
         retornoArray.forEach((element) {
           listaDispositivos.add(
               {
                 'nome':element.split("-")[0].replaceAll('[', ''),
                 'id':element.split("-")[1].replaceAll('[', ''),
               }
           );
         });
       }
       Timer(Duration(seconds: 15),() => showDispositivos = true);


    } on PlatformException catch (e) {
      print(e.message);
    }

  }

  @action
  Future<void> getListaDispositivosPareados() async {
    print("show ${showDispositivosPareados}");
    showDispositivosPareados = false;
    listaDispositivosPareados = [].asObservable();
    try {
      String retorno = '';
      retorno = await bluetoothChannel.invokeMethod('getListaDispositivosPareados');
      print("retorno ${retorno}");
      if(retorno != '[]') {
        var retornoArray = retorno.split(",");
        retornoArray.forEach((element) {
          listaDispositivosPareados.add(
              {
                'nome':element.split("-")[0].replaceAll('[', ''),
                'id':element.split("-")[1].replaceAll('[', ''),
              }
          );
        });
      }
      Timer(Duration(seconds: 15),() => showDispositivosPareados = true);


    } on PlatformException catch (e) {
      print(e.message);
    }

  }
}

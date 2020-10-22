import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pressaoarterialapp/pages/configuracao_global.dart' as gc;
import 'package:pressaoarterialapp/Helpers/perfil_helper.dart';
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pressaoarterialapp/models/perfil_model.dart';
import 'package:flutter/services.dart';
part 'perfis_controller.g.dart';

class PerfilController = _PerfilController with _$PerfilController;

abstract class _PerfilController with Store {
  final perfil_helper = Modular.get<PerfilHelper>();

  _PerfilController() {
    perfilNome.text = '';
  }

  final TextEditingController perfilNome = TextEditingController();

  @observable
  int avatarSelecionado = -1;

  @observable
  bool modoEdicao = false;

  @observable
  bool showLista = false;

  @observable
  String avatarLinkSelecionado = 'avatarPadrao.png';

  @observable
  String avatarNome = '';

  @observable
  ObservableList listaPerfis = [].asObservable();

  @observable
  Perfil objPerfil = Perfil(nome: '', icone: '');

  @observable
    var batteryChannel =  MethodChannel('samples.flutter.dev/battery');

  @observable
  String batteryPercentage = 'Battery precentage';

  @action
  Future<void> getBatteryInformation() async {
    String resultado;
    try {
      var result = await batteryChannel.invokeMethod('getBatteryLevel');
      resultado = 'Battery level at $result%';
    } on PlatformException catch (e) {
      resultado = "Failed to get battery level: '${e.message}'.";
    }


      batteryPercentage = resultado;

  }

  @action
  setAvatarSelecionado(int index) {
    avatarSelecionado = index;
    avatarLinkSelecionado = 'avatar${index}.png';
  }

  @action
  setShowLista(bool valor) {
    showLista = valor;
  }

  @action
  setEdicao(Perfil p) {
    modoEdicao = true;
    objPerfil.id = p.id;
    perfilNome.text = p.nome;
    avatarSelecionado = int.parse(p.icone.split('avatar').toString()[3]);
    avatarLinkSelecionado = p.icone;
  }

  @action
  setAvatar() async {
    objPerfil.nome = perfilNome.text;
    objPerfil.icone = '${avatarLinkSelecionado}';

    if (objPerfil.id == null) {
      var objRetorno = await perfil_helper.savePerfil(objPerfil);
      gc.changePerfil(objRetorno);
      modoEdicao = false;
    } else {
      var objRetorno = await perfil_helper.updatePerfil(objPerfil);
      getAllPerfis();
    }
    clearPerfil();
  }

  @action
  clearPerfil() {
    objPerfil.id = null;
    objPerfil.nome = '';
    objPerfil.icone = 'avatarPadrao.png';
    avatarSelecionado = -1;
    avatarLinkSelecionado = 'avatarPadrao.png';
    perfilNome.text = '';
  }

  @action
  getAllPerfis() async {
    List<Perfil> perfis_banco = await perfil_helper.getAllPerfis();
    listaPerfis.clear();
    perfis_banco.forEach((element) => listaPerfis.add(element));
  }
}

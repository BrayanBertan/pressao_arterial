import 'package:flutter/material.dart';
import 'package:pressaoarterialapp/models/perfil_model.dart';

 var corPadrao = Colors.blue;

 Perfil perfilSelecionado = Perfil(nome: '', icone: '');

 void changePerfil(Perfil ps) {
  perfilSelecionado.id = ps.id;
  perfilSelecionado.nome = ps.nome;
  perfilSelecionado.icone = ps.icone;
 }

void clearPerfil() {
 perfilSelecionado.id = null;
 perfilSelecionado.nome = '';
 perfilSelecionado.icone = '';
}
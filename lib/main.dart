import 'package:flutter/material.dart';
import 'login.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'globalConfiguracoes.dart' as gc;
void main() {
  initializeDateFormatting().then((_) => runApp(PressaoArterialApp()));

}
//teste
class PressaoArterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pressão arterial',
      theme: ThemeData(
        primarySwatch: gc.corPadrao,
      ),
      home: SafeArea(child: LoginPage())
    );
  }
}


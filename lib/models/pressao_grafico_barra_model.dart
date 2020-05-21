import 'package:pressaoarterialapp/Helpers/banco_helper.dart';

class PressaoGraficoBarra {
  BancoHelper bh = BancoHelper();
  String eixoX;
  double eixoY;

  PressaoGraficoBarra({this.eixoX, this.eixoY});

  PressaoGraficoBarra.fromMap(Map map) {
    eixoX = map['nome'];
    eixoY = map['pressao'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "eixoX: $eixoX eixoY: $eixoY";
  }
}
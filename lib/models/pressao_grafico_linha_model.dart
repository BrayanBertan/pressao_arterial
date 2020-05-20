import 'package:pressaoarterialapp/Helpers/banco_helper.dart';

class PressaoGraficoLinha {
  BancoHelper bh = BancoHelper();
   DateTime eixoX;
   double eixoY;

  PressaoGraficoLinha({this.eixoX, this.eixoY});

   PressaoGraficoLinha.fromMap(Map map) {
     eixoX = new DateTime.fromMillisecondsSinceEpoch(map[bh.registroPressao_dateTimeColumn] * 1000);
     eixoY = map['pressao'];
   }

  @override
  String toString() {
    // TODO: implement toString
    return "eixoX: $eixoX eixoY: $eixoY";
  }
}
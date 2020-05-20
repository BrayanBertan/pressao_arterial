import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pressaoarterialapp/models/pressao_grafico_linha_model.dart';
import 'package:pressaoarterialapp/pages/controllers/registros_pressao_controller.dart';
import 'package:pressaoarterialapp/pages/lista_medicoes.dart';
import 'configuracao_global.dart' as gc;
import 'package:flutter_modular/flutter_modular.dart';

final registro_controller = RegistroPressaoController();

class RelatorioGraficoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RelatorioGraficoPageState();
}

class _RelatorioGraficoPageState extends State<RelatorioGraficoPage> {
  List<charts.Series> seriesList;
  static final List<GraficoConstrutor> _pressaoSiastolicaTempoLista = [
    GraficoConstrutor(eixoX: 0, eixoY: 100),
    GraficoConstrutor(eixoX: 1, eixoY: 90),
    GraficoConstrutor(eixoX: 2, eixoY: 110),
    GraficoConstrutor(eixoX: 3, eixoY: 150),
    GraficoConstrutor(eixoX: 4, eixoY: 110),
    GraficoConstrutor(eixoX: 5, eixoY: 50),
    GraficoConstrutor(eixoX: 5, eixoY: 80),
    GraficoConstrutor(eixoX: 5, eixoY: 90),
    GraficoConstrutor(eixoX: 5, eixoY: 70),
    GraficoConstrutor(eixoX: 5, eixoY: 80),
    GraficoConstrutor(eixoX: 6, eixoY: 105),
  ];

  static final List<GraficoConstrutor> _pressaoDiastolicaTempoLista = [
    GraficoConstrutor(eixoX: 0, eixoY: 70),
    GraficoConstrutor(eixoX: 1, eixoY: 55),
    GraficoConstrutor(eixoX: 2, eixoY: 84),
    GraficoConstrutor(eixoX: 3, eixoY: 95),
    GraficoConstrutor(eixoX: 4, eixoY: 80),
    GraficoConstrutor(eixoX: 5, eixoY: 40),
    GraficoConstrutor(eixoX: 6, eixoY: 60),
  ];

  static final List<LinearSales1> _pressaoSiastolicaAtividadeCorrerLista = [
    LinearSales1(eixoY: 'Segunda', eixoX: 140),
    LinearSales1(eixoY: 'Terça', eixoX: 140),
    LinearSales1(eixoY: 'Quarta', eixoX: 140),
    LinearSales1(eixoY: 'Quinta', eixoX: 120),
    LinearSales1(eixoY: 'Quinta', eixoX: 90),
    LinearSales1(eixoY: 'Sexta', eixoX: 140),
    LinearSales1(eixoY: 'Sabado', eixoX: 110),
    LinearSales1(eixoY: 'Domingo', eixoX: 110),
  ];

  static final List<LinearSales1> _pressaoSiastolicaAtividadeCozinhandoLista = [
    LinearSales1(eixoY: 'Segunda', eixoX: 100),
    LinearSales1(eixoY: 'Terça', eixoX: 90),
    LinearSales1(eixoY: 'Quarta', eixoX: 110),
    LinearSales1(eixoY: 'Quinta', eixoX: 100),
    LinearSales1(eixoY: 'Sexta', eixoX: 90),
    LinearSales1(eixoY: 'Sabado', eixoX: 110),
    LinearSales1(eixoY: 'Domingo', eixoX: 140),
  ];

  static final List<LinearSales1> _pressaoSiastolicaAtividadeEstudandoLista = [
    LinearSales1(eixoY: 'Segunda', eixoX: null),
    LinearSales1(eixoY: 'Terça', eixoX: 90),
    LinearSales1(eixoY: 'Quarta', eixoX: 100),
    LinearSales1(eixoY: 'Quinta', eixoX: 105),
    LinearSales1(eixoY: 'Sexta', eixoX: 110),
    LinearSales1(eixoY: 'Sabado', eixoX: 100),
    LinearSales1(eixoY: 'Domingo', eixoX: 100),
  ];
  static List<charts.Series<GraficoConstrutor, int>> seriesSiastolica = [
    charts.Series<GraficoConstrutor, int>(
      id: 'graficoSiastolicaId',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (GraficoConstrutor series, _) => series.eixoX,
      measureFn: (GraficoConstrutor series, _) => series.eixoY,
      data: _pressaoSiastolicaTempoLista,
    ),
  ];

  static final List<PressaoGraficoLinha> teste = [
    PressaoGraficoLinha(eixoX: DateTime(2020, 05, 10 , 10, 15), eixoY: 100.00),
    PressaoGraficoLinha(eixoX: DateTime(2020, 05, 15, 10, 15),eixoY: 70.00 ),
    PressaoGraficoLinha(eixoX: DateTime(2020, 06, 10, 10, 15), eixoY: 120.00 ),
    PressaoGraficoLinha(eixoX: DateTime(2020, 07, 10, 10, 15), eixoY: 80.00 ),
    PressaoGraficoLinha(eixoX: DateTime(2020, 08, 10, 10, 15), eixoY: 90.05 ),
    PressaoGraficoLinha(eixoX: DateTime(2020, 09, 10, 10, 15),eixoY: 150.00),
    PressaoGraficoLinha(eixoX: DateTime(2020, 10, 10, 10, 15), eixoY: 100.00),
  ];

  static List<charts.Series<PressaoGraficoLinha, DateTime>>
      seriesSistolicaTime = [
    charts.Series<PressaoGraficoLinha, DateTime>(
      id: 'graficoSistolicaTime',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoLinha series, _) => series.eixoX,
      measureFn: (PressaoGraficoLinha series, _) => series.eixoY,
      data: registro_controller.sistolicaGrafico,
    ),
  ];

  static List<charts.Series<GraficoConstrutor, int>> seriesDiastolica = [
    charts.Series<GraficoConstrutor, int>(
      id: 'graficoDiastolicaId',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (GraficoConstrutor series, _) => series.eixoX,
      measureFn: (GraficoConstrutor series, _) => series.eixoY,
      data: _pressaoDiastolicaTempoLista,
    )
  ];
  static List<charts.Series<LinearSales1, String>> seriesAtividadeSiastolica = [
    charts.Series<LinearSales1, String>(
      id: 'Corrida',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (LinearSales1 series, _) => series.eixoY,
      measureFn: (LinearSales1 series, _) => series.eixoX,
      data: _pressaoSiastolicaAtividadeCorrerLista,
    ),
    charts.Series<LinearSales1, String>(
      id: 'Cozinhando',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (LinearSales1 series, _) => series.eixoY,
      measureFn: (LinearSales1 series, _) => series.eixoX,
      data: _pressaoSiastolicaAtividadeCozinhandoLista,
    ),
    charts.Series<LinearSales1, String>(
      id: 'Estudando',
      colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
      domainFn: (LinearSales1 series, _) => series.eixoY,
      measureFn: (LinearSales1 series, _) => series.eixoX,
      data: _pressaoSiastolicaAtividadeEstudandoLista,
    )
  ];
  final eixoXPersonalizado = charts.BasicNumericTickFormatterSpec((num valor) {
    switch (valor) {
      case 0:
        return "Seg";
        break;
      case 1:
        return "Ter";
        break;
      case 2:
        return "Qua";
        break;
      case 3:
        return "Qui";
        break;
      case 4:
        return "Sex";
        break;
      case 5:
        return "Sab";
        break;
      case 6:
        return "Dom";
        break;
    }
  });
  @override
  void initState() {
    registro_controller.getAllTimeGraficos();
    Timer(Duration(seconds: 2), () {
      registro_controller.setShowCalendario(true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pressão Arterial'),
        ),
        body: PageView(children: <Widget>[
         Observer(builder:(_){
           return  (!registro_controller.showCalendario)?
           Center(
             child: CircularProgressIndicator(),
           )
               :
           ListView(
             children: <Widget>[
               RaisedButton(onPressed: () {
                 setState(() {
                   teste.add(PressaoGraficoLinha(eixoX: DateTime(2020, 11, 10, 10, 15), eixoY:74.90 ));
                 });
               }),
               SizedBox(
                 height: 20.0,
               ),
               Center(
                 child: Text(
                   'Semanal',
                   style: TextStyle(
                     fontSize: 50,
                   ),
                 ),
               ),
               Container(
                 height: 400,
                 padding: EdgeInsets.all(20),
                 child: Card(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: <Widget>[
                         Text(
                           "Siastolica",
                           style: Theme.of(context).textTheme.body2,
                         ),
                         Expanded(
                           child: charts.TimeSeriesChart(seriesSistolicaTime,
                               animate: true,
                               dateTimeFactory:
                               charts.LocalDateTimeFactory(),
                               primaryMeasureAxis: new charts.NumericAxisSpec(
                                   tickProviderSpec:
                                   new charts.BasicNumericTickProviderSpec(
                                       desiredTickCount: 10)),
                               domainAxis: new charts.DateTimeAxisSpec(
                                   tickFormatterSpec:
                                   new charts.AutoDateTimeTickFormatterSpec(
                                       day: new charts.TimeFormatterSpec(
                                           format: 'MM/yyyy',
                                           transitionFormat:
                                           'MM/yyyy')))),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
               Container(
                 height: 400,
                 padding: EdgeInsets.all(20),
                 child: Card(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: <Widget>[
                         Text(
                           "Diastolica",
                           style: Theme.of(context).textTheme.body2,
                         ),
                         Expanded(
                           child: charts.LineChart(
                             seriesDiastolica,
                             defaultRenderer: new charts.LineRendererConfig(
                                 includeArea: true, stacked: true),
                             animate: true,
                             primaryMeasureAxis: new charts.NumericAxisSpec(
                                 tickProviderSpec:
                                 new charts.BasicNumericTickProviderSpec(
                                     desiredTickCount: 5)),
                             domainAxis: charts.NumericAxisSpec(
                               tickProviderSpec:
                               charts.BasicNumericTickProviderSpec(
                                   desiredTickCount: 7),
                               tickFormatterSpec: eixoXPersonalizado,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ],
           );
         }),
          ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'Semanal',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                height: 500,
                padding: EdgeInsets.all(20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Siastolica",
                          style: Theme.of(context).textTheme.body2,
                        ),
                        Expanded(
                          child: charts.BarChart(
                            seriesAtividadeSiastolica,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            vertical: false,
                            behaviors: [
                              new charts.SeriesLegend(
                                  position: charts.BehaviorPosition.end),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}

/// Sample linear data type.
class GraficoConstrutor {
  final int eixoX;
  final int eixoY;

  GraficoConstrutor({@required this.eixoX, @required this.eixoY});
}

class LinearSales {
  final int eixoX;
  final double eixoY;
  final double r;

  LinearSales({@required this.eixoX, @required this.eixoY, @required this.r});
}

/// Sample ordinal data type.
class LinearSales1 {
  final int eixoX;
  final String eixoY;

  LinearSales1({@required this.eixoY, this.eixoX});
}

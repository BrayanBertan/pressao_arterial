import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'globalConfiguracoes.dart' as gc;

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

  static final List<LinearSales> _pressaoSiastolicaAtividadeCorrerLista = [
    LinearSales(eixoX: 0, eixoY: 120,r:8.0),
    LinearSales(eixoX: 1, eixoY: 140,r:8.0),
    LinearSales(eixoX: 2, eixoY: 140,r:8.0),
    LinearSales(eixoX: 3, eixoY: 120,r:8.0),
    LinearSales(eixoX: 4, eixoY: 140,r:8.0),
    LinearSales(eixoX: 5, eixoY: 110,r:8.0),
    LinearSales(eixoX: 6, eixoY: 110,r:8.0),
  ];

   static final List<LinearSales> _pressaoSiastolicaAtividadeCozinhandoLista = [
     LinearSales(eixoX: 0, eixoY: 100,r:8.0),
     LinearSales(eixoX: 1, eixoY: 90,r:8.0),
     LinearSales(eixoX: 2, eixoY: 110,r:8.0),
     LinearSales(eixoX: 3, eixoY: 100,r:8.0),
     LinearSales(eixoX: 4, eixoY: 90,r:8.0),
     LinearSales(eixoX: 5, eixoY: 110,r:8.0),
     LinearSales(eixoX: 6, eixoY: 140,r:8.0),
   ];

   static final List<LinearSales> _pressaoSiastolicaAtividadeEstudandoLista = [
     LinearSales(eixoX: 0, eixoY: null,r:8.0),
     LinearSales(eixoX: 1, eixoY: 90,r:8.0),
     LinearSales(eixoX: 2, eixoY: 100,r:8.0),
     LinearSales(eixoX: 3, eixoY: 105,r:8.0),
     LinearSales(eixoX: 4, eixoY: 110,r:8.0),
     LinearSales(eixoX: 5, eixoY: 100,r:8.0),
     LinearSales(eixoX: 6, eixoY: 100,r:8.0),
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

  static List<charts.Series<GraficoConstrutor, int>> seriesDiastolica = [
    charts.Series<GraficoConstrutor, int>(
      id: 'graficoDiastolicaId',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (GraficoConstrutor series, _) => series.eixoX,
      measureFn: (GraficoConstrutor series, _) => series.eixoY,
      data: _pressaoDiastolicaTempoLista,
    )
  ];
  static List<charts.Series<LinearSales, int>> seriesAtividadeSiastolica = [
    charts.Series<LinearSales, int>(
      id: 'Corrida',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (LinearSales series, _) => series.eixoX,
      measureFn: (LinearSales series, _) => series.eixoY,
      radiusPxFn: (LinearSales sales, _) => sales.r,
      data: _pressaoSiastolicaAtividadeCorrerLista,
    ),
    charts.Series<LinearSales, int>(
      id: 'Cozinhando',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (LinearSales series, _) => series.eixoX,
      measureFn: (LinearSales series, _) => series.eixoY,
      radiusPxFn: (LinearSales sales, _) => sales.r,
      data: _pressaoSiastolicaAtividadeCozinhandoLista,
    ),
    charts.Series<LinearSales, int>(
      id: 'Estudando',
      colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
      domainFn: (LinearSales series, _) => series.eixoX,
      measureFn: (LinearSales series, _) => series.eixoY,
      radiusPxFn: (LinearSales sales, _) => sales.r,
      data: _pressaoSiastolicaAtividadeEstudandoLista,
    )
  ];
  final eixoXPersonalizado = charts.BasicNumericTickFormatterSpec((num valor) {
    switch(valor) {
      case 0: return "Seg";
      break;
      case 1: return "Ter";
      break;
      case 2: return "Qua";
      break;
      case 3: return "Qui";
      break;
      case 4: return "Sex";
      break;
      case 5: return "Sab";
      break;
      case 6: return "Dom";
      break;
    }
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pressão Arterial'),
        ),
        body: PageView(children: <Widget>[
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
                        child: charts.LineChart(
                          seriesSiastolica,
                          defaultRenderer:
                          new charts.LineRendererConfig(includeArea: true, stacked: true),
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
                          defaultRenderer:
                          new charts.LineRendererConfig(includeArea: true, stacked: true),
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
        ),
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
                height: 300,
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
                          child: charts.ScatterPlotChart(
                            seriesAtividadeSiastolica,
                            animate: true,
                            primaryMeasureAxis: new charts.NumericAxisSpec(
                                tickProviderSpec:
                                new charts.BasicNumericTickProviderSpec(
                                    desiredTickCount: 3)),
                            domainAxis: charts.NumericAxisSpec(
                              tickProviderSpec:
                              charts.BasicNumericTickProviderSpec(
                                  desiredTickCount: 7),
                              tickFormatterSpec: eixoXPersonalizado,
                            ),
                            behaviors: [
                              new charts.SeriesLegend(position: charts.BehaviorPosition.end),
                            ],
                          ),
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
                            seriesAtividadeSiastolica,
                            defaultRenderer:
                            new charts.LineRendererConfig(includeArea: true, stacked: true),
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
          ),

    ])
    );
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

  LinearSales({@required this.eixoX,@required  this.eixoY,@required  this.r});
}

/// Sample ordinal data type.
class OrdinalSales {
  final String eixoX;
  final int eixoY;

  OrdinalSales({@required this.eixoX,@required  this.eixoY});
}
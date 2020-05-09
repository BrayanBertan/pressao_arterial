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

  static final List<GraficoConstrutor> _pressaoSiastolicaAtividadeCorrerLista = [
    GraficoConstrutor(eixoX: 0, eixoY: 120),
    GraficoConstrutor(eixoX: 1, eixoY: 140),
    GraficoConstrutor(eixoX: 2, eixoY: null),
    GraficoConstrutor(eixoX: 3, eixoY: 120),
    GraficoConstrutor(eixoX: 4, eixoY: 140),
    GraficoConstrutor(eixoX: 5, eixoY: 110),
    GraficoConstrutor(eixoX: 6, eixoY: 110),
  ];

  static final List<GraficoConstrutor> _pressaoDiastolicaAtividadeCorrerLista = [
    GraficoConstrutor(eixoX: 0, eixoY: 90),
    GraficoConstrutor(eixoX: 1, eixoY: 100),
    GraficoConstrutor(eixoX: 2, eixoY: null),
    GraficoConstrutor(eixoX: 3, eixoY: 90),
    GraficoConstrutor(eixoX: 4, eixoY: 100),
    GraficoConstrutor(eixoX: 5, eixoY: 75),
    GraficoConstrutor(eixoX: 6, eixoY: 100),
  ];

   static final List<GraficoConstrutor> _pressaoSiastolicaAtividadeCozinhandoLista = [
     GraficoConstrutor(eixoX: 0, eixoY: 100),
     GraficoConstrutor(eixoX: 1, eixoY: 90),
     GraficoConstrutor(eixoX: 2, eixoY: 110),
     GraficoConstrutor(eixoX: 3, eixoY: 100),
     GraficoConstrutor(eixoX: 4, eixoY: 90),
     GraficoConstrutor(eixoX: 5, eixoY: 110),
     GraficoConstrutor(eixoX: 6, eixoY: null),
   ];

   static final List<GraficoConstrutor> _pressaoDiastolicaAtividadeCozinhandoLista = [
     GraficoConstrutor(eixoX: 0, eixoY: 70),
     GraficoConstrutor(eixoX: 1, eixoY: 55),
     GraficoConstrutor(eixoX: 2, eixoY: 84),
     GraficoConstrutor(eixoX: 3, eixoY: 70),
     GraficoConstrutor(eixoX: 4, eixoY: 55),
     GraficoConstrutor(eixoX: 5, eixoY: 84),
     GraficoConstrutor(eixoX: 6, eixoY: null),

   ];

   static final List<GraficoConstrutor> _pressaoSiastolicaAtividadeEstudandoLista = [
     GraficoConstrutor(eixoX: 0, eixoY: 105),
     GraficoConstrutor(eixoX: 1, eixoY: 90),
     GraficoConstrutor(eixoX: 2, eixoY: 100),
     GraficoConstrutor(eixoX: 3, eixoY: 105),
     GraficoConstrutor(eixoX: 4, eixoY: 110),
     GraficoConstrutor(eixoX: 5, eixoY: 100),
     GraficoConstrutor(eixoX: 6, eixoY: 100),
   ];

   static final List<GraficoConstrutor> _pressaoDiastolicaAtividadeEstudandoLista = [
     GraficoConstrutor(eixoX: 0, eixoY: 65),
     GraficoConstrutor(eixoX: 1, eixoY: 50),
     GraficoConstrutor(eixoX: 2, eixoY: 60),
     GraficoConstrutor(eixoX: 3, eixoY: 65),
     GraficoConstrutor(eixoX: 4, eixoY: 50),
     GraficoConstrutor(eixoX: 5, eixoY: 55),
     GraficoConstrutor(eixoX: 6, eixoY: 60),
   ];



  List<charts.Series<GraficoBarra, String>> _seriesBarra = [
    charts.Series(
        id: "GraficoBarraId",
        data: _exemploBarraLista,
        domainFn: (GraficoBarra series, _) => series.eixoX,
        measureFn: (GraficoBarra series, _) => series.eixoY)
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
  static List<charts.Series<GraficoConstrutor, int>> seriesAtividadeSiastolica = [
    charts.Series<GraficoConstrutor, int>(
      id: 'graficoSiastolicaId',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (GraficoConstrutor series, _) => series.eixoX,
      measureFn: (GraficoConstrutor series, _) => series.eixoY,
      data: _pressaoSiastolicaAtividadeCorrerLista,
    ),
    charts.Series<GraficoConstrutor, int>(
      id: 'graficoSiastolicaId',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (GraficoConstrutor series, _) => series.eixoX,
      measureFn: (GraficoConstrutor series, _) => series.eixoY,
      data: _pressaoSiastolicaAtividadeCozinhandoLista,
    ),
    charts.Series<GraficoConstrutor, int>(
      id: 'graficoSiastolicaId',
      colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
      domainFn: (GraficoConstrutor series, _) => series.eixoX,
      measureFn: (GraficoConstrutor series, _) => series.eixoY,
      data: _pressaoSiastolicaAtividadeEstudandoLista,
    )
  ];

  static List<charts.Series<GraficoConstrutor, int>> seriesAtividadeDiastolica = [
    charts.Series<GraficoConstrutor, int>(
      id: 'graficoDiastolicaId',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (GraficoConstrutor series, _) => series.eixoX,
      measureFn: (GraficoConstrutor series, _) => series.eixoY,
      data: _pressaoDiastolicaAtividadeCorrerLista,
    ),
    charts.Series<GraficoConstrutor, int>(
      id: 'graficoDiastolicaId',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (GraficoConstrutor series, _) => series.eixoX,
      measureFn: (GraficoConstrutor series, _) => series.eixoY,
      data: _pressaoDiastolicaAtividadeCozinhandoLista,
    ),
    charts.Series<GraficoConstrutor, int>(
      id: 'graficoDiastolicaId',
      colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
      domainFn: (GraficoConstrutor series, _) => series.eixoX,
      measureFn: (GraficoConstrutor series, _) => series.eixoY,
      data: _pressaoDiastolicaAtividadeEstudandoLista,
    ),
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
                            seriesAtividadeDiastolica,
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

  static final List<GraficoBarra> _exemploBarraLista = [
    GraficoBarra(
      eixoX: "Segunda",
      eixoY: 10,
      barColor: charts.ColorUtil.fromDartColor(gc.corPadrao),
    ),
    GraficoBarra(
      eixoX: "Terça",
      eixoY: 9,
      barColor: charts.ColorUtil.fromDartColor(gc.corPadrao),
    ),
    GraficoBarra(
      eixoX: "Quarta",
      eixoY: 11,
      barColor: charts.ColorUtil.fromDartColor(gc.corPadrao),
    ),
    GraficoBarra(
      eixoX: "Quinta",
      eixoY: 14,
      barColor: charts.ColorUtil.fromDartColor(gc.corPadrao),
    ),
    GraficoBarra(
      eixoX: "Sexta",
      eixoY: 15,
      barColor: charts.ColorUtil.fromDartColor(gc.corPadrao),
    ),
    GraficoBarra(
      eixoX: "Sabado",
      eixoY: 8,
      barColor: charts.ColorUtil.fromDartColor(gc.corPadrao),
    ),
    GraficoBarra(
      eixoX: "Domingo",
      eixoY: 11,
      barColor: charts.ColorUtil.fromDartColor(gc.corPadrao),
    ),
  ];
}

class GraficoBarra {
  final String eixoX;
  final int eixoY;
  final charts.Color barColor;

  GraficoBarra(
      {@required this.eixoX, @required this.eixoY, @required this.barColor});
}

/// Sample linear data type.
class GraficoConstrutor {
  final int eixoX;
  final int eixoY;

  GraficoConstrutor({@required this.eixoX, @required this.eixoY});
}

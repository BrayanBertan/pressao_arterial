import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pressaoarterialapp/models/pressao_grafico_barra_model.dart';
import 'package:pressaoarterialapp/models/pressao_grafico_linha_model.dart';
import 'package:pressaoarterialapp/pages/controllers/registros_pressao_controller.dart';
import 'package:pressaoarterialapp/pages/lista_medicoes.dart';
import 'configuracao_global.dart' as gc;
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter_modular/flutter_modular.dart';

final registro_controller = RegistroPressaoController();

class RelatorioGraficoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RelatorioGraficoPageState();
}

class _RelatorioGraficoPageState extends State<RelatorioGraficoPage> {

  static final List<OrdinalSales> _pressaoSiastolicaTempoLista = [
    OrdinalSales(eixoX: 'Caminhada', eixoY: 110),
    OrdinalSales(eixoX: 'Estudando', eixoY: 120),
    OrdinalSales(eixoX: 'Correndo', eixoY: 140),
    OrdinalSales(eixoX: 'Cozinhando', eixoY: 90),
  ];

  static List<charts.Series<PressaoGraficoBarra, String>> seriesSistolicaAtividade = [
    charts.Series<PressaoGraficoBarra, String>(
      id: 'seriesSistolicaAtividade',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoBarra series, _) => series.eixoX,
      measureFn: (PressaoGraficoBarra series, _) => series.eixoY,
      data: registro_controller.sistolicaGraficoAtividade,
    )
  ];

  static List<charts.Series<PressaoGraficoBarra, String>> seriesDiastolicaAtividade = [
    charts.Series<PressaoGraficoBarra, String>(
      id: 'seriesDiastolicaAtividade',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoBarra series, _) => series.eixoX,
      measureFn: (PressaoGraficoBarra series, _) => series.eixoY,
      data: registro_controller.diastolicaGraficoAtividade,
    )
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

  static List<charts.Series<PressaoGraficoLinha, DateTime>>
  seriesDiastolicaTime = [
    charts.Series<PressaoGraficoLinha, DateTime>(
      id: 'graficoDiastolicaTime',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoLinha series, _) => series.eixoX,
      measureFn: (PressaoGraficoLinha series, _) => series.eixoY,
      data: registro_controller.diastolicaGrafico,
    ),
  ];
  @override
  void initState() {
    registro_controller.getAllTimeGraficos();
    registro_controller.getAllAtividadesFiltro();
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
                Observer(builder: (_) {
                  return DropdownButton<int>(
                    items: [
                      DropdownMenuItem(
                        value: 5,
                        child: Center(
                          child: Text(
                            'Ultimas 24 horas',
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 6,
                        child: Center(
                          child: Text(
                            'Ultima semana',
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Center(
                          child: Text(
                            'Ultimo mês',
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Center(
                          child: Text(
                            'Ultimos 3 mêses',
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Center(
                          child: Text(
                            'Ultimos 6 mêses',
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 4,
                        child: Center(
                          child: Text(
                            'Ultimo ano',
                          ),
                        ),
                      ),
                    ],
                    onChanged: (valor) {
                      registro_controller.setShowCalendario(false);
                      registro_controller.setFiltroGraficoTempo(valor);
                      registro_controller.setFormatoData();
                      registro_controller.getAllTimeGraficos();
                      Timer(Duration(seconds: 1), () {
                        registro_controller.setShowCalendario(true);
                      });

                    },
                    value:  registro_controller.filtroGraficoTempo,
                    isExpanded: true,
                  );
                }),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    (registro_controller.filtroGraficoTempo == 1)?'Ultimo mês':(registro_controller.filtroGraficoTempo == 2)?'Ultimos 3 mêses':(registro_controller.filtroGraficoTempo == 3)?'Ultimos 6 mêses':'Ultimo ano',
                    style: TextStyle(
                      fontSize: 30,
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
                                            format: registro_controller.formatoDataX,
                                            transitionFormat:
                                            registro_controller.formatoDataX)))),
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
                            child: charts.TimeSeriesChart(seriesDiastolicaTime,
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
                                            format: registro_controller.formatoDataX,
                                            transitionFormat:
                                            registro_controller.formatoDataX)))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),

          Observer(builder:(_){
            return  (!registro_controller.showCalendario)?
            Center(
              child: CircularProgressIndicator(),
            )
                :
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),   Observer(builder: (_) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: MultiSelectFormField(
                      autovalidate: false,
                      titleText: 'Atividades',
                      validator: (value) {
                        if (value.length > 5) {
                          return 'Limite de 5';
                        }
                        return null;
                      },
                      dataSource: registro_controller.atividadesRelacionadasFiltro,
                      textField: 'nome',
                      valueField: 'id',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCELAR',
                      // required: true,
                      hintText: '',
                      initialValue: registro_controller.atividades_selecionadas,
                      onSaved: (value) {
                        if (value == null) return;
                        registro_controller.setShowCalendario(false);
                        registro_controller.setAtividadesSelecionadas(value);
                        registro_controller.getAllBarraGraficos();
                        Timer(Duration(seconds: 2), () {
                          registro_controller.setShowCalendario(true);
                        });
                      },
                    ),
                  );
                }),
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
                            "Sistolica",
                            style: Theme.of(context).textTheme.body2,
                          ),
                          Expanded(
                            child:  new charts.BarChart( seriesSistolicaAtividade, animate: true, ),
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
                            child:  new charts.BarChart( seriesDiastolicaAtividade, animate: true, ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
          Observer(builder:(_){
            return  (!registro_controller.showCalendario)?
            Center(
              child: CircularProgressIndicator(),
            )
                :
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),   Observer(builder: (_) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: MultiSelectFormField(
                      autovalidate: false,
                      titleText: 'Atividades',
                      validator: (value) {
                        if (value.length > 5) {
                          return 'Limite de 5';
                        }
                        return null;
                      },
                      dataSource: registro_controller.atividadesRelacionadasFiltro,
                      textField: 'nome',
                      valueField: 'id',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCELAR',
                      // required: true,
                      hintText: '',
                      initialValue: registro_controller.atividades_selecionadas,
                      onSaved: (value) {
                        if (value == null) return;
                        registro_controller.setShowCalendario(false);
                        registro_controller.setAtividadesSelecionadas(value);
                        registro_controller.getAllBarraGraficos();
                        Timer(Duration(seconds: 2), () {
                          registro_controller.setShowCalendario(true);
                        });
                      },
                    ),
                  );
                }),
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
                            "Sistolica",
                            style: Theme.of(context).textTheme.body2,
                          ),
                          Expanded(
                            child:  new charts.BarChart( seriesSistolicaAtividade, animate: true, ),
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
                            child:  new charts.BarChart( seriesDiastolicaAtividade, animate: true, ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ]),
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

  LinearSales({@required this.eixoX, @required this.eixoY, @required this.r});
}

/// Sample ordinal data type.
class LinearSales1 {
  final int eixoX;
  final String eixoY;

  LinearSales1({@required this.eixoY, this.eixoX});
}


class OrdinalSales {
  final String eixoX;
  final int eixoY;

  OrdinalSales({this.eixoX, this.eixoY});
}
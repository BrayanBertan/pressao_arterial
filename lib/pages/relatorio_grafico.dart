import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pressaoarterialapp/models/pressao_grafico_barra_model.dart';
import 'package:pressaoarterialapp/models/pressao_grafico_linha_model.dart';
import 'package:pressaoarterialapp/pages/controllers/registros_pressao_controller.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter_modular/flutter_modular.dart';

final registro_controller = RegistroPressaoController();

class RelatorioGraficoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RelatorioGraficoPageState();
}

class _RelatorioGraficoPageState extends State<RelatorioGraficoPage> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 150.0;

  static List<charts.Series<PressaoGraficoBarra, String>>
      seriesSistolicaAtividade = [
    charts.Series<PressaoGraficoBarra, String>(
      id: 'seriesSistolicaAtividade',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoBarra series, _) => series.eixoX,
      measureFn: (PressaoGraficoBarra series, _) => series.eixoY,
      data: registro_controller.sistolicaGraficoAtividade,
    )
  ];

  static List<charts.Series<PressaoGraficoBarra, String>>
      seriesDiastolicaAtividade = [
    charts.Series<PressaoGraficoBarra, String>(
      id: 'seriesDiastolicaAtividade',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoBarra series, _) => series.eixoX,
      measureFn: (PressaoGraficoBarra series, _) => series.eixoY,
      data: registro_controller.diastolicaGraficoAtividade,
    )
  ];

  static List<charts.Series<PressaoGraficoBarra, String>> seriesPulsoAtividade =
      [
    charts.Series<PressaoGraficoBarra, String>(
      id: 'seriesPulsoAtividade',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoBarra series, _) => series.eixoX,
      measureFn: (PressaoGraficoBarra series, _) => series.eixoY,
      data: registro_controller.pulsoGraficoAtividade,
    )
  ];

  static List<charts.Series<PressaoGraficoBarra, String>>
      seriesSistolicaMedicamento = [
    charts.Series<PressaoGraficoBarra, String>(
      id: 'seriesSistolicaMedicamento',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoBarra series, _) => series.eixoX,
      measureFn: (PressaoGraficoBarra series, _) => series.eixoY,
      data: registro_controller.sistolicaGraficoMedicamento,
    )
  ];

  static List<charts.Series<PressaoGraficoBarra, String>>
      seriesDiastolicaMedicamento = [
    charts.Series<PressaoGraficoBarra, String>(
      id: 'seriesDiastolicaMedicamento',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoBarra series, _) => series.eixoX,
      measureFn: (PressaoGraficoBarra series, _) => series.eixoY,
      data: registro_controller.diastolicaGraficoMedicamento,
    )
  ];

  static List<charts.Series<PressaoGraficoBarra, String>>
      seriesPulsoMedicamento = [
    charts.Series<PressaoGraficoBarra, String>(
      id: 'seriesPulsoMedicamento',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoBarra series, _) => series.eixoX,
      measureFn: (PressaoGraficoBarra series, _) => series.eixoY,
      data: registro_controller.pulsoGraficoMedicamento,
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

  static List<charts.Series<PressaoGraficoLinha, DateTime>> seriesPulsoTime = [
    charts.Series<PressaoGraficoLinha, DateTime>(
      id: 'seriesPulsoTime',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (PressaoGraficoLinha series, _) => series.eixoX,
      measureFn: (PressaoGraficoLinha series, _) => series.eixoY,
      data: registro_controller.pulsoGrafico,
    ),
  ];
  @override
  void initState() {
    registro_controller.getAllTimeGraficos();
    registro_controller.getAllAtividadesFiltro();
    registro_controller.getAllMedicamentosFiltro();
    registro_controller.setShowCalendario(false);
    Timer(Duration(seconds: 2), () {
      registro_controller.setShowCalendario(true);
    });
    super.initState();
  }

  @override
  void dispose() {
   registro_controller.atividades_selecionadas_filtro.clear();
   registro_controller.atividadesRelacionadasFiltro.clear();
   registro_controller.medicamentos_selecionados_filtro.clear();
   registro_controller.medicamentosRelacionadasFiltro.clear();
   registro_controller.sistolicaGraficoAtividade.clear();
   registro_controller.diastolicaGraficoAtividade.clear();
   registro_controller.pulsoGraficoAtividade.clear();
   registro_controller.sistolicaGraficoMedicamento.clear();
   registro_controller.diastolicaGraficoMedicamento.clear();
   registro_controller.pulsoGraficoMedicamento.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relátorios'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: _pageViewConstrutor(),
                ),
                _indicadorConstrutor(),
              ],
            )
          ],
        ),
      ),
    );
  }

  _indicadorConstrutor() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          dotColor: Colors.blue,
          selectedDotColor: Colors.blue[800],
          size: 15.0,
          selectedSize: 20.0,
          itemCount: 3,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

  Widget _pageViewConstrutor() {
    return PageView(
        onPageChanged: (int index) {
          _currentPageNotifier.value = index;
        },
        children: <Widget>[
          Observer(builder: (_) {
            return (!registro_controller.showCalendario)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: <Widget>[
                      Observer(builder: (_) {
                        return DropdownButton<int>(
                          items: [
                            DropdownMenuItem(
                              value: 5,
                              child: Center(
                                child: Text(
                                  'Últimas 24 horas',
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 6,
                              child: Center(
                                child: Text(
                                  'Última semana',
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Center(
                                child: Text(
                                  'Último mês',
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Center(
                                child: Text(
                                  'Últimos 3 meses',
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Center(
                                child: Text(
                                  'Últimos 6 meses',
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 4,
                              child: Center(
                                child: Text(
                                  'Último ano',
                                ),
                              ),
                            ),
                          ],
                          onChanged: (valor) {
                            registro_controller.setShowCalendario(false);
                            registro_controller.setFiltroGraficoTempo(valor);
                            registro_controller.getAllTimeGraficos();
                            Timer(Duration(seconds: 1), () {
                              registro_controller.setShowCalendario(true);
                            });
                          },
                          value: registro_controller.filtroGraficoTempo,
                          isExpanded: true,
                        );
                      }),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Text(
                          (registro_controller.filtroGraficoTempo == 1)
                              ? 'Último mês'
                              : (registro_controller.filtroGraficoTempo == 2)
                                  ? 'Últimos 3 meses'
                                  : (registro_controller.filtroGraficoTempo ==
                                          3)
                                      ? 'Últimos 6 meses'
                                      : (registro_controller
                                                  .filtroGraficoTempo ==
                                              5)
                                          ? 'Últimas 24 horas'
                                          : (registro_controller
                                                      .filtroGraficoTempo ==
                                                  6)
                                              ? "Última semana"
                                              : "Último Ano",
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
                                  "Sistólica",
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Expanded(
                                  child: charts.TimeSeriesChart(
                                      seriesSistolicaTime,
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
                                                      format:
                                                          registro_controller
                                                              .formatoDataX,
                                                      transitionFormat:
                                                          registro_controller
                                                              .formatoDataX)))),
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
                                  "Diastólica",
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Expanded(
                                  child: charts.TimeSeriesChart(
                                      seriesDiastolicaTime,
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
                                                      format:
                                                          registro_controller
                                                              .formatoDataX,
                                                      transitionFormat:
                                                          registro_controller
                                                              .formatoDataX)))),
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
                                  "Pulso",
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Expanded(
                                  child: charts.TimeSeriesChart(seriesPulsoTime,
                                      animate: true,
                                      dateTimeFactory:
                                          charts.LocalDateTimeFactory(),
                                      primaryMeasureAxis:
                                          new charts.NumericAxisSpec(
                                              tickProviderSpec:
                                                  new charts.BasicNumericTickProviderSpec(
                                                      desiredTickCount: 10)),
                                      domainAxis: new charts.DateTimeAxisSpec(
                                          tickFormatterSpec:
                                              new charts.AutoDateTimeTickFormatterSpec(
                                                  day: new charts.TimeFormatterSpec(
                                                      format:
                                                          registro_controller
                                                              .formatoDataX,
                                                      transitionFormat:
                                                          registro_controller
                                                              .formatoDataX)))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          }),
          Observer(builder: (_) {
            return (!registro_controller.showCalendario)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Observer(builder: (_) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          child: MultiSelectFormField(
                            autovalidate: false,
                            title: Text("Atividades"),
                            validator: (value) {
                              if (value.length > 5) {
                                return 'Limite de 5';
                              }
                              return null;
                            },
                            dataSource: registro_controller
                                .atividadesRelacionadasFiltro,
                            textField: 'nome',
                            valueField: 'id',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCELAR',
                            // required: true,
                            hintWidget: Text(""),
                            initialValue: registro_controller
                                .atividades_selecionadas_filtro,
                            onSaved: (value) {
                              if (value == null) return;
                              registro_controller.setShowCalendario(false);
                              registro_controller
                                  .setAtividadesSelecionadasFiltro(value);
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
                          'Atividades',
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
                                  "Sistólica",
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Expanded(
                                  child: new charts.BarChart(
                                    seriesSistolicaAtividade,
                                    animate: true,
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
                                  "Diastólica",
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Expanded(
                                  child: new charts.BarChart(
                                    seriesDiastolicaAtividade,
                                    animate: true,
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
                                  "Pulso",
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Expanded(
                                  child: new charts.BarChart(
                                    seriesPulsoAtividade,
                                    animate: true,
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
          Observer(builder: (_) {
            return (!registro_controller.showCalendario)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Observer(builder: (_) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          child: MultiSelectFormField(
                            autovalidate: false,
                            title:  Text('Medicamentoa'),
                            validator: (value) {
                              if (value.length > 5) {
                                return 'Limite de 5';
                              }
                              return null;
                            },
                            dataSource: registro_controller
                                .medicamentosRelacionadasFiltro,
                            textField: 'nome',
                            valueField: 'id',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCELAR',
                            // required: true,
                            hintWidget: Text(''),
                            initialValue: registro_controller
                                .medicamentos_selecionados_filtro,
                            onSaved: (value) {
                              if (value == null) return;
                              registro_controller.setShowCalendario(false);
                              registro_controller
                                  .setMedicamentosSelecionadosFiltro(value);
                              registro_controller
                                  .getAllBarraGraficosMedicamentos();
                              Timer(Duration(seconds: 2), () {
                                registro_controller.setShowCalendario(true);
                              });
                            },
                          ),
                        );
                      }),
                      Center(
                        child: Text(
                          'Medicamentos',
                          style: TextStyle(
                            fontSize: 40,
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
                                  "Sistólica",
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Expanded(
                                  child: new charts.BarChart(
                                      seriesSistolicaMedicamento,
                                      animate: true),
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
                                  "Diastólica",
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Expanded(
                                  child: new charts.BarChart(
                                      seriesDiastolicaMedicamento,
                                      animate: true),
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
                                  "Pulso",
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Expanded(
                                  child: new charts.BarChart(
                                      seriesPulsoMedicamento,
                                      animate: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          }),
        ]);
  }
}

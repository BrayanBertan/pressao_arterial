import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class relatorio_graficoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> _relatorio_graficoPageState();

}

class _relatorio_graficoPageState extends State<relatorio_graficoPage> {

  static final List<LinearSales> data1 = [
    LinearSales(year:0, sales:100),
    LinearSales(year:1, sales:90),
    LinearSales(year:2, sales:110),
    LinearSales(year:3, sales:150),
    LinearSales(year:4, sales:110),
    LinearSales(year:5, sales:85),
    LinearSales(year:6, sales:105),
  ];

  static final List<LinearSales> data2 = [
    LinearSales(year:0, sales:70),
    LinearSales(year:1, sales:55),
    LinearSales(year:2, sales:84),
    LinearSales(year:3, sales:95),
    LinearSales(year:4, sales:80),
    LinearSales(year:5, sales:40),
    LinearSales(year:6, sales:60),
  ];

  static final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "Segunda",
      subscribers: 10,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "Terça",
      subscribers: 9,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "Quarta",
      subscribers: 11,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "Quinta",
      subscribers: 14,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "Sexta",
      subscribers: 15,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "Sabado",
      subscribers: 8,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "Domingo",
      subscribers: 11,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
  ];

  List<charts.Series<SubscriberSeries, String>> series = [
    charts.Series(
        id: "Subscribers",
        data: data,
        domainFn: (SubscriberSeries series, _) => series.year,
        measureFn: (SubscriberSeries series, _) => series.subscribers
    )
  ];

  static List<charts.Series<LinearSales, int>> series1 = [
       charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data1,
      )
    ];

  static List<charts.Series<LinearSales, int>> series2 = [
    charts.Series<LinearSales, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (LinearSales sales, _) => sales.year,
      measureFn: (LinearSales sales, _) => sales.sales,
      data: data2,
    )
  ];
  final customTickFormatter =
  charts.BasicNumericTickFormatterSpec((num value) {
    if (value == 0) {
      return "Seg";
    } else if (value == 1) {
      return "Ter";
    } else if (value == 2) {
      return "Qua";
    } else if (value == 3) {
      return "Qui";
    } else if (value == 4) {
      return "Sex";
    } else if (value == 5) {
      return "Sab";
    } else if (value == 6) {
      return "Dom";
    }
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pressão Arterial'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            Container(
              height: 400,
              padding: EdgeInsets.all(20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Semanal(Siastolica)",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Expanded(
                        child: charts.LineChart(
                          series1,
                          animate: true,
                          primaryMeasureAxis: new charts.NumericAxisSpec(
                              tickProviderSpec:
                              new charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
                          domainAxis: charts.NumericAxisSpec(
                            tickProviderSpec:
                            charts.BasicNumericTickProviderSpec(desiredTickCount: 7),
                            tickFormatterSpec: customTickFormatter,
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
                        "Semanal(Diastolica)",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Expanded(
                        child: charts.LineChart(
                          series2,
                          animate: true,
                          primaryMeasureAxis: new charts.NumericAxisSpec(
                              tickProviderSpec:
                              new charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
                          domainAxis: charts.NumericAxisSpec(
                            tickProviderSpec:
                            charts.BasicNumericTickProviderSpec(desiredTickCount: 7),
                            tickFormatterSpec: customTickFormatter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )


    );
  }


}




class SubscriberSeries {
  final String year;
  final int subscribers;
  final charts.Color barColor;

  SubscriberSeries(
      {@required this.year,
        @required this.subscribers,
        @required this.barColor});
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(
  {@required this.year,
  @required  this.sales
      });
}
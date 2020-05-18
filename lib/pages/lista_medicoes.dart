import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pressaoarterialapp/pages/controllers/registros_pressao_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import 'medicamentos.dart';
import 'relatorio_grafico.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'configuracao_global.dart' as gc;
import 'package:flutter_modular/flutter_modular.dart';

final registro_controller = RegistroPressaoController();

class ListaMedicoesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListaMedicoesPageState();
}

class _ListaMedicoesPageState extends State<ListaMedicoesPage> {
  int _telaDescricaoMedicao = 1;
  List<String> _listaRemedios = [
    'Remedio 1 10ml 1 vez ao dia Aaaaaaaaa',
    'Remedio 2 1mg 3 vez ao dia Bbbbbbbbbb'
  ];
  List<String> _atividades = [
    'Atividade 1 Andei pra krlha',
    'Atividade 2 Cozinhando',
    'Atividade 3 Estudando'
  ];
  CalendarController _calendarioController;
  @override
  void initState() {
    super.initState();
    registro_controller.getAllRegistros();
    _calendarioController = CalendarController();

    Timer(Duration(seconds: 2), () {
      registro_controller.setShowCalendario(true);
    });
  }

  @override
  void dispose() {
    _calendarioController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      registro_controller.eventosSelecionados = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registros'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: new Container(child: Observer(builder: (_) {
        return (!registro_controller.showCalendario)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _calendarioConstrutor(),
                  SizedBox(height: 8.0),
                  Expanded(child: _listaEventosConstrutor())
                ],
              );
      })),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black87,
        animatedIconTheme: IconThemeData(size: 22.0),
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pressao1.png'),
                ),
              ),
              backgroundColor: Colors.green,
              label: 'Anotar',
              labelBackgroundColor: Colors.white,
              onTap: () {
                Modular.to.pushNamed('/registroPressao');
              }),
          SpeedDialChild(
              child: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/remedio.png'),
                ),
              ),
              backgroundColor: Colors.green,
              label: 'Medicamentos',
              labelBackgroundColor: Colors.white,
              onTap: () {
                Modular.to.pushNamed('/medicamentos');
              }),
          SpeedDialChild(
              child: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/rela.png'),
                ),
              ),
              backgroundColor: Colors.green,
              label: 'Relátorios',
              labelBackgroundColor: Colors.white,
              onTap: () {
                Modular.to.pushNamed('/relatorios');
              }),
        ],
      ),
    );
  }

  //=============FUCKING CALENDARIO DO SATANAS

  Widget _calendarioConstrutor() {
    return Observer(builder: (_) {
      return TableCalendar(
        calendarController: _calendarioController,
        locale: 'pt_BR',
        builders:
            CalendarBuilders(markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }
          return children;
        }),
        availableCalendarFormats: const {
          CalendarFormat.month: '2 semanas',
          CalendarFormat.week: 'Mês',
          CalendarFormat.twoWeeks: 'Semana',
        },
        events: registro_controller.listaEventos,
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarStyle: CalendarStyle(
          selectedColor: gc.corPadrao,
          todayColor: gc.corPadrao[100],
          markersColor: Colors.black,
          outsideDaysVisible: false,
        ),
        headerStyle: HeaderStyle(
          formatButtonTextStyle:
              TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
          formatButtonDecoration: BoxDecoration(
            color: gc.corPadrao,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        onDaySelected: _onDaySelected,
      );
    });
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: gc.corPadrao,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _listaEventosConstrutor() {
    return Observer(builder: (_) {
      return Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: registro_controller.eventosSelecionados
              .map((event) => GestureDetector(
            onTap: () {
              registro_controller.getAtividadesRelacionadas(event["id"]);
              registro_controller
                  .getMedicamentosRelacionadas(event["id"]);
              _descricaoMedicaoDialog(context, event);
            },
            child: Container(
                decoration: BoxDecoration(
                  color: gc.corPadrao,
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 4.0),
                child: Center(
                  child: Text("${event['descricao']}"),
                )),
          ))
              .toList(),
        ),
      );
    });
  }

  void _descricaoMedicaoDialog(BuildContext context, Map event) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipPath(
                      clipper: WaveClipperOne(),
                      child: Container(
                        height: 120,
                        color: gc.corPadrao,
                        child: Center(child: Text("${event['anotacao']}")),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(37, 15, 0, 0),
                      child: new Row(
                        children: <Widget>[
                          SizedBox(
                            width: 25.00,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _telaDescricaoMedicao = 1;
                                print(_telaDescricaoMedicao);
                              });
                            },
                            child: Container(
                              height: 65,
                              width: 65,
                              color: _telaDescricaoMedicao == 0
                                  ? Colors.grey
                                  : Colors.transparent,
                              child: CircleAvatar(
                                backgroundImage: ExactAssetImage(
                                    'assets/images/remedio.png'),
                                minRadius: 90,
                                maxRadius: 120,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _telaDescricaoMedicao = 2;
                                print(_telaDescricaoMedicao);
                              });
                            },
                            child: Container(
                              height: 65,
                              width: 65,
                              color: _telaDescricaoMedicao == 0
                                  ? Colors.grey
                                  : Colors.transparent,
                              child: CircleAvatar(
                                backgroundImage:
                                    ExactAssetImage('assets/images/at.png'),
                                minRadius: 90,
                                maxRadius: 120,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                  //padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                  decoration: BoxDecoration(
                                    color: gc.corPadrao,
                                    border: Border.all(width: 0.8),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 1.0),
                                  child: Center(
                                    child: Text(
                                      (_telaDescricaoMedicao == 1)
                                          ? "${registro_controller.medicamentosRelacionadas[index]['nome']}"
                                          : "${registro_controller.atividadesRelacionadas[index]['nome']}",
                                    ),
                                  ));
                            },
                            itemCount: (_telaDescricaoMedicao == 1)
                                ? registro_controller
                                    .medicamentosRelacionadas.length
                                : registro_controller
                                    .atividadesRelacionadas.length,
                          ),
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 1),
                        child: Center(
                          child: RaisedButton(
                            color: gc.corPadrao,
                            onPressed: () {
                              Modular.to.pop();
                            },
                            child: Text(
                              'Voltar',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            );
          });
        });
  }
}

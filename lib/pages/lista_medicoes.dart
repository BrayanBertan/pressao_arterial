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
import 'package:sweetalert/sweetalert.dart';

final registro_controller = RegistroPressaoController();

class ListaMedicoesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListaMedicoesPageState();
}

class _ListaMedicoesPageState extends State<ListaMedicoesPage> {
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

  void _onDaySelected(DateTime day, List events, List a) {
    print('CALLBACK: _onDaySelected');
    registro_controller.setDiaSelecionado(day);
    registro_controller.eventosSelecionados = events;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            gc.clearPerfil();
            Modular.to.pushReplacementNamed('/login');
          },
          child: CircleAvatar(
            backgroundImage:
                ExactAssetImage('assets/images/${gc.perfilSelecionado.icone}'),
            minRadius: 20,
            maxRadius: 30,
          ),
        ),
        title: Text('${gc.perfilSelecionado.nome}'),
      ),
      body: new Container(child: Observer(builder: (_) {
        return (!registro_controller.showCalendario)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 5.0),
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider(color: Colors.black)),
                      Text(
                        'Calendário:',
                        style: TextStyle(fontSize: 25),
                      ),
                      Expanded(child: Divider(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  _calendarioConstrutor(),
                  SizedBox(height: 5.0),
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider(color: Colors.black)),
                      Observer(
                        builder: (_) {
                          return Text(
                            '${registro_controller.diaSelecionado}',
                            style: TextStyle(fontSize: 25),
                          );
                        },
                      ),
                      Expanded(child: Divider(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  (registro_controller.eventosSelecionados.length > 0)
                      ? Expanded(child: _listaEventosConstrutor())
                      : Center(
                          child: Text("Sem registros neste dia",
                              style: TextStyle(fontSize: 25)),
                        )
                ],
              );
      })),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black87,
        animatedIconTheme: IconThemeData(size: 30.0),
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Tab(
                icon: Container(
                  child: Image(
                    image: AssetImage(
                      'assets/images/pressao1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  height: 46,
                  width: 46,
                ),
              ),
              backgroundColor: Colors.green,
              label: 'Anotar',
              labelBackgroundColor: Colors.white,
              onTap: () {
                Modular.to.pushNamed('/registroPressao').then((onValue) {
                  registro_controller.setShowCalendario(false);
                  registro_controller.getAllRegistros();
                  Timer(Duration(seconds: 2), () {
                    registro_controller.setShowCalendario(true);
                  });
                });
              }),
          SpeedDialChild(
              child: Tab(
                icon: Container(
                  child: Image(
                    image: AssetImage(
                      'assets/images/remedio.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  height: 46,
                  width: 46,
                ),
              ),
              backgroundColor: Colors.green,
              label: 'Medicamentos',
              labelBackgroundColor: Colors.white,
              onTap: () {
                Modular.to.pushNamed('/medicamentos');
              }),
          SpeedDialChild(
              child: Tab(
                icon: Container(
                  child: Image(
                    image: AssetImage(
                      'assets/images/rela.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  height: 46,
                  width: 46,
                ),
              ),
              backgroundColor: Colors.green,
              label: 'Relátorios',
              labelBackgroundColor: Colors.white,
              onTap: () {
                Modular.to.pushNamed('/relatorios');
              }),
          SpeedDialChild(
              child: Tab(
                icon: Container(
                  child: Image(
                    image: AssetImage(
                      'assets/images/dica.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  height: 46,
                  width: 46,
                ),
              ),
              backgroundColor: Colors.green,
              label: 'Dicas',
              labelBackgroundColor: Colors.white,
              onTap: () {
                Modular.to.pushNamed('/dicas').then((onValue) {
                  registro_controller.setShowCalendario(false);
                  registro_controller.getAllRegistros();
                  Timer(Duration(seconds: 2), () {
                    registro_controller.setShowCalendario(true);
                  });
                });
              }),
          SpeedDialChild(
              child: Tab(
                icon: Container(
                  child: Image(
                    image: AssetImage(
                      'assets/images/bd.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  height: 46,
                  width: 46,
                ),
              ),
              backgroundColor: Colors.green,
              label: 'Transferir',
              labelBackgroundColor: Colors.white,
              onTap: () {
                Modular.to.pushNamed('/transferir');
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
        initialCalendarFormat: CalendarFormat.twoWeeks,
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
        width: MediaQuery.of(context).size.width * 0.97,
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
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        margin: const EdgeInsets.only(left: 25.0),
                        padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: gc.corPadrao),
                          ),
                        ),
                        child: Card(
                          child: ListTile(
                            title: Text(
                                "Sistolica: ${event['sistolica']} Diastolica: ${event['diastolica']}",
                                style: TextStyle(fontSize: 15)),
                            subtitle: Text(
                                "Pulso: ${event['pulso']} Anotação: ${event['anotacao']}"),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: new BoxDecoration(
                            color: gc.corPadrao,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        alignment: new FractionalOffset(0.0, 0.5),
                        margin: const EdgeInsets.only(left: 0),
                        child: Tab(
                          icon: Container(
                            margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025, left: MediaQuery.of(context).size.width * 0.015),
                            child: Center(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('${event['hora']}'),
                              )
                            ),
                            height: 42,
                            width: 42,
                          ),
                        ),
                      )
                    ],
                  )))
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
                        child: Center(
                            child: Text(event['hora'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25))),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 60, right: 10, top: 1),
                      child: Row(
                        children: <Widget>[
                          Observer(builder: (_) {
                            return (event['braco'] == 1)
                                ? Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  style: BorderStyle.none),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                          ),
                                          height: 65,
                                          width: 65,
                                          child: CircleAvatar(
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/brae.png'),
                                            minRadius: 90,
                                            maxRadius: 120,
                                          ),
                                        ),
                                        Text("Esquerdo")
                                      ],
                                    ),
                                  )
                                : Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  style: BorderStyle.none),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                          ),
                                          height: 65,
                                          width: 65,
                                          child: CircleAvatar(
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/brad.png'),
                                            minRadius: 90,
                                            maxRadius: 120,
                                          ),
                                        ),
                                        Text("Direito")
                                      ],
                                    ),
                                  );
                          }),
                          SizedBox(
                            width: 15,
                          ),
                          Observer(builder: (_) {
                            return (event['postura'] == 1)
                                ? Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  style: BorderStyle.none),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                          ),
                                          height: 65,
                                          width: 65,
                                          child: CircleAvatar(
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/pos1.png'),
                                            minRadius: 90,
                                            maxRadius: 120,
                                          ),
                                        ),
                                        Text("Em pé")
                                      ],
                                    ),
                                  )
                                : (event['postura'] == 2)
                                    ? Container(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1.0,
                                                      style: BorderStyle.none),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                ),
                                              ),
                                              height: 65,
                                              width: 65,
                                              child: CircleAvatar(
                                                backgroundImage: ExactAssetImage(
                                                    'assets/images/pos2.png'),
                                                minRadius: 90,
                                                maxRadius: 120,
                                              ),
                                            ),
                                            Text("Sentado")
                                          ],
                                        ),
                                      )
                                    : Container(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1.0,
                                                      style: BorderStyle.none),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                ),
                                              ),
                                              height: 65,
                                              width: 65,
                                              child: CircleAvatar(
                                                backgroundImage: ExactAssetImage(
                                                    'assets/images/pos3.png'),
                                                minRadius: 90,
                                                maxRadius: 120,
                                              ),
                                            ),
                                            Text("Deitado")
                                          ],
                                        ),
                                      );
                          }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                      child: new Row(
                        children: <Widget>[
                          SizedBox(
                            width: 25.00,
                          ),
                          GestureDetector(
                            onTap: () {
                              registro_controller.setTelaDescricaoMedicao(1);
                            },
                            child: Container(
                              height: 65,
                              width: 65,
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
                              registro_controller.setTelaDescricaoMedicao(2);
                            },
                            child: Container(
                              height: 65,
                              width: 65,
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
                    Observer(builder: (_) {
                      return Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  //padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                          color: gc.corPadrao, width: 5.5),
                                    ),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 1.0, vertical: 1.0),
                                  child: Card(
                                    child: ListTile(
                                      leading: (registro_controller
                                                  .telaDescricaoMedicao !=
                                              1)
                                          ? CircleAvatar(
                                              backgroundImage: ExactAssetImage(
                                                  'assets/images/at${registro_controller.atividadesRelacionadas[index]['id']}.png'),
                                              minRadius: 20,
                                              maxRadius: 30,
                                            )
                                          : null,
                                      title: Text(
                                          (registro_controller
                                                      .telaDescricaoMedicao ==
                                                  1)
                                              ? (registro_controller
                                                          .medicamentosRelacionadas
                                                          .length >
                                                      0)
                                                  ? "${registro_controller.medicamentosRelacionadas[index]['nome']} ${registro_controller.medicamentosRelacionadas[index]['descricao']} "
                                                  : "Sem medicamentos Relacionados!"
                                              : (registro_controller
                                                          .atividadesRelacionadas
                                                          .length >
                                                      0)
                                                  ? "${registro_controller.atividadesRelacionadas[index]['nome']}"
                                                  : "Sem atividades Relacionadas!",
                                          style: TextStyle(fontSize: 11)),
                                    ),
                                  ),
                                );
                              },
                              itemCount:
                                  (registro_controller.telaDescricaoMedicao ==
                                          1)
                                      ? registro_controller
                                          .medicamentosRelacionadas.length
                                      : registro_controller
                                          .atividadesRelacionadas.length,
                            ),
                          ));
                    }),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 10, top: 1),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              RaisedButton(
                                color: gc.corPadrao,
                                onPressed: () {
                                  SweetAlert.show(context,
                                      title: "Deletar?",
                                      style: SweetAlertStyle.confirm,
                                      showCancelButton: true,
                                      cancelButtonText: "Cancelar",
                                      confirmButtonText: "Confirmar",
                                      onPress: (bool isConfirm) {
                                        if (isConfirm) {
                                          registro_controller.removeRegistro(event['id']);
                                          Modular.to.pop();
                                        }
                                      });
                                },
                                child: Text(
                                  'Excluir',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                              SizedBox(width:15.0),
                              RaisedButton(
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
                            ],
                          )
                        )),
                  ],
                ),
              ),
            );
          });
        });
  }
}

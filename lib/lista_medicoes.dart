import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'medicamentos.dart';
import 'relatorio_grafico.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class listaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _listaPageState();
}

class _listaPageState extends State<listaPage> {
  int _tela_descricao_medicao = 1;
  List<String> remedios = [
    'Remedio 1 10ml 1 vez ao dia Aaaaaaaaa',
    'Remedio 2 1mg 3 vez ao dia Bbbbbbbbbb'
  ];
  List<String> atividades = [
    'Atividade 1 Andei pra krlha',
    'Atividade 2 Cozinhando',
    'Atividade 3 Estudando'
  ];

  CalendarController _calendarController = new CalendarController();

  Map<DateTime, List> _events;
  List _selectedEvents = new List();
  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 2)): [
        {'sis': '120', 'dia': '80', 'pulso': '50', 'Horario': '10:00'},
        {'sis': '100', 'dia': '65', 'pulso': '90', 'Horario': '15:00'}
      ],
      _selectedDay: [
        {'sis': '110', 'dia': '70', 'pulso': '70', 'Horario': '20:00'}
      ],
      _selectedDay.add(Duration(days: 1)): [
        {'sis': '90', 'dia': '50', 'pulso': '70', 'Horario': '21:00'},
        {'sis': '150', 'dia': '90', 'pulso': '70', 'Horario': '22:00'},
        {'sis': '105', 'dia': '75', 'pulso': '70', 'Horario': '05:00'}
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = new CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registros'),
      ),
      body: new Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //-----------------------
            _buildTableCalendar(),
            const SizedBox(height: 8.0),
            Expanded(child: _buildEventList()),
          ],
        ),
      ),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicamentosPage(),
                    ));
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => relatorio_graficoPage(),
                    ));
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
                print('a');
              }),
        ],
      ),
    );
  }

  //=============FUCKING CALENDARIO DO SATANAS

  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      locale: 'pt_BR',
      events: _events,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.blue,
        todayColor: Colors.blue[100],
        markersColor: Colors.black,
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
    );
  }

  Widget _buildEventList() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: _selectedEvents
          .map((event) => GestureDetector(
                onTap: () {
                  showSimpleCustomDialog(context, event);
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(width: 0.8),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 50,
                            ),
                            Text('Sistólica '),
                            SizedBox(
                              width: 10,
                            ),
                            Text('diastólica '),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Pulso'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Horário'),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 70,
                            ),
                            Text(event['sis']),
                            SizedBox(
                              width: 40,
                            ),
                            Text(event['dia']),
                            SizedBox(
                              width: 50,
                            ),
                            Text(event['pulso']),
                            SizedBox(
                              width: 25,
                            ),
                            Text(event['Horario']),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    )),
              ))
          .toList(),
    );
  }

  void showSimpleCustomDialog(BuildContext context, Map event) {
    showDialog(context: context, builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (context, setState) {
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
                        color: Colors.blue,
                        child: Center(child: Text("AQUI VAI ALGUMA COISA")),
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
                                _tela_descricao_medicao=1;
                                print(_tela_descricao_medicao);
                              });
                            },
                            child: Container(
                              height: 65,
                              width: 65,
                              color: _tela_descricao_medicao == 0
                                  ? Colors.grey
                                  : Colors.transparent,
                              child: CircleAvatar(
                                backgroundImage:
                                ExactAssetImage('assets/images/remedio.png'),
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
                                _tela_descricao_medicao=2;
                                print(_tela_descricao_medicao);
                              });
                            },
                            child: Container(
                              height: 65,
                              width: 65,
                              color: _tela_descricao_medicao == 0
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
                                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(width: 0.8),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: Column(
                                  children: <Widget>[
                                    Text( (_tela_descricao_medicao==1)?remedios[index]:atividades[index]),
                                  ],
                                ),
                              );
                            },
                            itemCount: (_tela_descricao_medicao==1)?2:3,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 1),
                        child: Center(
                          child: RaisedButton(
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Voltar',
                              style: TextStyle(fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            );
          }
      );
    });
  }
}

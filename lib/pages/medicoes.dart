import 'package:flutter/material.dart';
import 'configuracao_global.dart' as gc;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class MedicoesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MedicoesPageState();
}

class _MedicoesPageState extends State<MedicoesPage> {
  List _myActivities;
  String _myActivitiesResult;
  int pos_valor = -1;
  var selectedRange = RangeValues(70, 100);
  double a=70;

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    //conferir se colocando medicamento no construtor do controller funciona
    _myActivitiesResult = '';
  }
  final _formularioMedicaoKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Medições"),
        ),
        body: new Container(
            padding: EdgeInsets.all(25),
            child: Form(
              key: _formularioMedicaoKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Row(children: <Widget>[
                      Container(
                        decoration: ShapeDecoration(
                          color: gc.corPadrao,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: Text(
                          ('Sistolica: ${selectedRange.end.round()}'),
                        ),
                      ),
                      SizedBox(width: 40,),
                      Container(
                        decoration: ShapeDecoration(
                          color: gc.corPadrao,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: Text(
                          ('Diastolica: ${selectedRange.start.round()}'),
                        ),
                      ),
                    ]),
                  ),
                  Transform(
                    alignment: FractionalOffset.center,
                    // Rotate sliders by 90 degrees
                    transform: new Matrix4.identity()
                      ..rotateZ(180 * 3.1415927 / 180),
                    child: RangeSlider(
                      values: selectedRange,
                      onChanged: (RangeValues n) {
                        setState(() {
                          selectedRange = n;
                        });
                      },
                      min: 0,
                      max: 300,
                      divisions: 300,
                    ),
                  ),
                  Center(
                    child: Container(
                        decoration: ShapeDecoration(
                          color: gc.corPadrao,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: Text(
                          ('Pulso: ${a.round()}'),
                        ),
                      ),
                  ),
                  Slider(
                      value: a,
                      min: 0,
                      max: 200,
                      onChanged: (double value) {
                        setState(() => a = value);
                      }
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: MultiSelectFormField(
                      autovalidate: false,
                      titleText: 'Atividades',
                      validator: (value) {
                        if (value == null || value.length == 0) {
                          return 'Escolha uma atividade';
                        }
                        return null;
                      },
                      dataSource: [
                        {
                          "display": "Cozinhando",
                          "value": 1,
                        },
                        {
                          "display": "Correndo",
                          "value": 2,
                        },
                        {
                          "display": "Caminhada",
                          "value": 3,
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      // required: true,
                      hintText: '',
                      initialValue: _myActivities,
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          _myActivities = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: MultiSelectFormField(
                      autovalidate: false,
                      titleText: 'Medicamentos',
                      validator: (value) {
                        if (value == null || value.length == 0) {
                          return 'Escolha uma atividade';
                        }
                        return null;
                      },
                      dataSource: [
                        {
                          "display": "Paracetamol",
                          "value": "1",
                        },
                        {
                          "display": "Eficentus",
                          "value": "2",
                        },
                        {
                          "display": "Clauvulin",
                          "value": "3",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCELAR',
                      // required: true,
                      hintText: '',
                      initialValue: _myActivities,
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          _myActivities = value;
                          print(_myActivities);
                        });
                      },
                    ),
                  ),
                  Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(color: Colors.black)
                        ),

                        Text("Postura"),

                        Expanded(
                            child: Divider(color: Colors.black)
                        ),
                      ]
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => setState(() => pos_valor = 1),
                          child: Container(
                            decoration: ShapeDecoration(
                              color: pos_valor == 1 ? Colors.blue[700] : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0, style: BorderStyle.none),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            height: 56,
                            width: 56,
                            child: CircleAvatar(
                              backgroundImage:
                              ExactAssetImage('assets/images/pos1.png'),
                              minRadius: 90,
                              maxRadius: 120,
                            ),
                          ),
                        ),
                        SizedBox(width:15,),
                        GestureDetector(
                          onTap: () => setState(() => pos_valor = 2),
                          child: Container(
                            decoration: ShapeDecoration(
                              color: pos_valor == 2 ? Colors.blue[700] : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0, style: BorderStyle.none),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            height: 56,
                            width: 56,
                            child: CircleAvatar(
                              backgroundImage:
                              ExactAssetImage('assets/images/pos2.png'),
                              minRadius: 90,
                              maxRadius: 120,
                            ),
                          ),
                        ),
                        SizedBox(width:15,),
                        GestureDetector(
                          onTap: () => setState(() => pos_valor = 3),
                          child: Container(
                            decoration: ShapeDecoration(
                              color: pos_valor == 3 ? Colors.blue[700] : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0, style: BorderStyle.none),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            height: 56,
                            width: 56,
                            child: CircleAvatar(
                              backgroundImage:
                              ExactAssetImage('assets/images/pos3.png'),
                              minRadius: 90,
                              maxRadius: 120,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:15,),
                  Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(color: Colors.black)
                        ),

                        Text("Braço medido"),

                        Expanded(
                            child: Divider(color: Colors.black)
                        ),
                      ]
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 50,),
                        GestureDetector(
                          onTap: () => setState(() => pos_valor = 1),
                          child: Container(
                            decoration: ShapeDecoration(
                              color: pos_valor == 1 ? Colors.blue[700] : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0, style: BorderStyle.none),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            height: 56,
                            width: 56,
                            child: CircleAvatar(
                              backgroundImage:
                              ExactAssetImage('assets/images/brad.png'),
                              minRadius: 90,
                              maxRadius: 120,
                            ),
                          ),
                        ),
                        SizedBox(width:15,),
                        GestureDetector(
                          onTap: () => setState(() => pos_valor = 2),
                          child: Container(
                            decoration: ShapeDecoration(
                              color: pos_valor == 2 ? Colors.blue[700] : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0, style: BorderStyle.none),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            height: 56,
                            width: 56,
                            child: CircleAvatar(
                              backgroundImage:
                              ExactAssetImage('assets/images/brae.png'),
                              minRadius: 90,
                              maxRadius: 120,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(onPressed: () {
                    if(_formularioMedicaoKey.currentState.validate()) {
                      _myActivitiesResult = _myActivities.join(',');
                          print(_myActivitiesResult);
                          print(_myActivitiesResult.split(','));
                    }
                  })
                ],
              ),
            )));
  }
}

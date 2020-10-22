import 'dart:async';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pressaoarterialapp/pages/controllers/registros_pressao_controller.dart';
import 'configuracao_global.dart' as gc;
import 'package:sweetalert/sweetalert.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

final registro_controller = RegistroPressaoController();

class RegistroPressaoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistroPressaoPageState();
}

class _RegistroPressaoPageState extends State<RegistroPressaoPage> {
  final _formularioRegistroKey = GlobalKey<FormState>();

  @override
  void initState() {
    registro_controller.clearRegistro();
    registro_controller.getAllAtividades();
    registro_controller.getAllMedicamentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro de pressão'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              registro_controller.setShowCalendario(false);
              Modular.to.pop(context);
            },
          ),
        ),
        body: Observer(
          builder: (_){
            return (registro_controller.showRegistro == false)?
               Center(
                 child:  CircularProgressIndicator(),
               )
                :
            Container(
              padding: EdgeInsets.all(25),
              child: Form(
                key: _formularioRegistroKey,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Observer(builder: (_) {
                      return Center(
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
                              ('Sistólica: ${registro_controller.pressao.end.round()}'),
                                style: TextStyle(fontSize: 20)
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
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
                              ('Diastólica: ${registro_controller.pressao.start.round()}'),
                                style: TextStyle(fontSize: 20)
                            ),
                          ),
                        ]),
                      );
                    }),
                    Observer(builder: (_) {
                      return Transform(
                        alignment: FractionalOffset.center,
                        // Rotate sliders by 90 degrees
                        transform: new Matrix4.identity()
                          ..rotateZ(180 * 3.1415927 / 180),
                        child: RangeSlider(
                          values: registro_controller.pressao,
                          onChanged: (RangeValues novo) {
                            registro_controller.setPressao(novo);
                          },
                          min: 0,
                          max: 300,
                          divisions: 60,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return Center(
                        child: Container(
                          decoration: ShapeDecoration(
                            color: gc.corPadrao,
                            shape: RoundedRectangleBorder(
                              side:
                              BorderSide(width: 1.0, style: BorderStyle.solid),
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                          child: Text(
                            ('Pulso: ${registro_controller.pulso.round()}'),
                              style: TextStyle(fontSize: 20)
                          ),
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return Slider(
                          value: registro_controller.pulso,
                          min: 0,
                          max: 200,
                          onChanged: (double value) {
                            registro_controller.pulso = value;
                          });
                    }),
                    Observer(builder: (_) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: MultiSelectFormField(
                          autovalidate: false,
                          title: Text("Atividades"),
                          validator: (value) {
                            if (value == null || value.length == 0) {
                              // return 'Escolha uma atividade';
                            }
                            return null;
                          },
                          dataSource: registro_controller.atividades,
                          textField: 'nome',
                          valueField: 'id',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCELAR',
                          // required: true,
                         hintWidget: Text(''),
                          initialValue: registro_controller.atividades_selecionadas,
                          onSaved: (value) {
                            if (value == null) return;
                            registro_controller.setAtividadesSelecionadas(value);
                          },
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: MultiSelectFormField(
                          autovalidate: false,
                          title: Text("Medicamentos"),
                          validator: (value) {
                            if (value == null || value.length == 0) {
                              //return 'Escolha um Medicamentos';
                            }
                            return null;
                          },
                          dataSource: registro_controller.medicamentos,
                          textField: 'nome',
                          valueField: 'id',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCELAR',
                          // required: true,
                          hintWidget: Text(''),
                          initialValue:
                          registro_controller.medicamentos_selecionados,
                          onSaved: (value) {
                            if (value == null) return;
                            registro_controller.setMedicamentosSelecionados(value);
                          },
                        ),
                      );
                    }),
                    Row(children: <Widget>[
                      Expanded(child: Divider(color: Colors.black)),
                      Text("Postura",
                          style: TextStyle(fontSize: 20)),
                      Expanded(child: Divider(color: Colors.black)),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    Observer(builder: (_) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () => registro_controller.setPostura(1),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: ShapeDecoration(
                                          color: registro_controller.postura == 1
                                              ? Colors.blue[700]
                                              : Colors.transparent,
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
                                      Text("Em pé",style: (registro_controller.postura==1)?
                                      TextStyle(
                                         fontSize: 15,
                                        color: gc.corPadrao,
                                      ):
                                      TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      )
                                      )
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                                onTap: () => registro_controller.setPostura(2),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: ShapeDecoration(
                                          color: registro_controller.postura == 2
                                              ? Colors.blue[700]
                                              : Colors.transparent,
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
                                      Text("Sentado",style: (registro_controller.postura==2)?
                                      TextStyle(
                                        fontSize: 15,
                                        color: gc.corPadrao,
                                      ):
                                      TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ))
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                                onTap: () => registro_controller.setPostura(3),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: ShapeDecoration(
                                          color: registro_controller.postura == 3
                                              ? Colors.blue[700]
                                              : Colors.transparent,
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
                                      Text("Deitado",style: (registro_controller.postura==3)?
                                      TextStyle(
                                        fontSize: 15,
                                        color: gc.corPadrao,
                                      ):
                                      TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      )),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Row(children: <Widget>[
                      Expanded(child: Divider(color: Colors.black)),
                      Text("Braço medido",
                          style: TextStyle(fontSize: 20)),
                      Expanded(child: Divider(color: Colors.black)),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                          ),
                          Observer(builder: (_) {
                            return GestureDetector(
                                onTap: () => registro_controller.setBraco(1),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: ShapeDecoration(
                                          color: registro_controller.braco == 1
                                              ? Colors.blue[700]
                                              : Colors.transparent,
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
                                      Text("Esquerdo",style: (registro_controller.braco==1)?
                                      TextStyle(
                                        fontSize: 15,
                                        color: gc.corPadrao,
                                      ):
                                      TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ))
                                    ],
                                  ),
                                )
                            );
                          }),
                          SizedBox(
                            width: 15,
                          ),
                          Observer(
                              builder: (_) {
                                return GestureDetector(
                                    onTap: () => registro_controller.setBraco(2),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            decoration: ShapeDecoration(
                                              color: registro_controller.braco == 2
                                                  ? Colors.blue[700]
                                                  : Colors.transparent,
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
                                          Text("Direito",style: (registro_controller.braco==2)?
                                          TextStyle(
                                            fontSize: 15,
                                            color: gc.corPadrao,
                                          ):
                                          TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ))
                                        ],
                                      ),
                                    )
                                );
                              }
                          ),
                        ],
                      ),
                    ),
                FlatButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          maxTime: DateTime.now(),
                          onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                        registro_controller.registroObj.dataHora = date;
                        registro_controller.setDiaSelecionadoCadastro(date);
                          }, currentTime: DateTime.now(), locale: LocaleType.pt);
                    },
                    child:Observer(
                      builder: (_) {
                        return Card(
                          child: ListTile(
                            title: Text((registro_controller.diaSelecionadoCadastro)),
                            leading: Image.asset('assets/images/schedule.png'),
                          ),
                        );
                      },
                    )),
                    TextFormField(
                      controller: registro_controller.registro_anotacao,
                      decoration: InputDecoration(
                          labelText: 'Anotação', hintText: 'Ex: De manhã'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: RaisedButton(
                          child: new Text('Salvar'),
                          onPressed: () {
                            if (_formularioRegistroKey.currentState.validate()) {
                              registro_controller.setAnotacao();
                              FocusScope.of(context).unfocus();
                              SweetAlert.show(context,
                                  title: "Salvo",
                                  style: SweetAlertStyle.success,
                                  onPress: (a) {
                                    //controller.jumpTo(controller.position.maxScrollExtent);
                                  });
                              registro_controller.setShowRegistro(false);
                              Timer(Duration(milliseconds: 500), () {
                                registro_controller.setShowRegistro(true);
                              });
                            }
                          }),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

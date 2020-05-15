import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pressaoarterialapp/pages/controllers/registros_pressao_controller.dart';
import 'configuracao_global.dart' as gc;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

final registro_controller = RegistroPressaoController();

class RegistroPressaoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistroPressaoPageState();
}

class _RegistroPressaoPageState extends State<RegistroPressaoPage> {
  final _formularioRegistroKey = GlobalKey<FormState>();

  @override
  void initState() {
    registro_controller.getAllAtividades();
    registro_controller.getAllMedicamentos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${registro_controller.pulso}'),
        ),
        body: Container(
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
                          ('Sistolica: ${registro_controller.pressao.end.round()}'),
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
                          ('Diastolica: ${registro_controller.pressao.start.round()}'),
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
                Observer(
                    builder: (_) {
                      return  Center(
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
                            ('Pulso: ${registro_controller.pulso.round()}'),
                          ),
                        ),
                      );
                    }
                ),
                Observer(
                    builder: (_) {
                      return  Slider(
                          value: registro_controller.pulso,
                          min: 0,
                          max: 200,
                          onChanged: (double value) {
                            setState(() => registro_controller.pulso = value);
                          }
                      );
                    }
                ),
                Observer(
                    builder: (_) {
                      return Container(
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
                          dataSource: registro_controller.atividades,
                          textField: 'nome',
                          valueField: 'id',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCELAR',
                          // required: true,
                          hintText: '',
                          initialValue: registro_controller.atividades_selecionadas,
                          onSaved: (value) {
                            if (value == null) return;
                            registro_controller.setAtividadesSelecionadas(value);
                          },
                        ),
                      );
                    }
                ),
                Observer(
                    builder: (_) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: MultiSelectFormField(
                          autovalidate: false,
                          titleText: 'Medicamentos',
                          validator: (value) {
                            if (value == null || value.length == 0) {
                              return 'Escolha um Medicamentos';
                            }
                            return null;
                          },
                          dataSource: registro_controller.medicamentos,
                          textField: 'nome',
                          valueField: 'id',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCELAR',
                          // required: true,
                          hintText: '',
                          initialValue: registro_controller.medicamentos_selecionados,
                          onSaved: (value) {
                            if (value == null) return;
                            registro_controller.setMedicamentosSelecionados(value);
                          },
                        ),
                      );
                    }
                ),
              ],
            ),
          ),
        ));
  }
}

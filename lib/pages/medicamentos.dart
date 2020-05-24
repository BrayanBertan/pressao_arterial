import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pressaoarterialapp/pages/lista_medicoes.dart';
import 'configuracao_global.dart' as gc;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pressaoarterialapp/pages/controllers/medicamentos_controller.dart';
import 'package:pressaoarterialapp/models/unidade_model.dart';
import 'package:sweetalert/sweetalert.dart';

final medicamento = MedicamentoController();

class MedicamentosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MedicamentosPageState();
}

class _MedicamentosPageState extends State<MedicamentosPage> {
  final focusNome = FocusNode();
  final focusDose = FocusNode();
  final focusQtde = FocusNode();
  final ScrollController controller = ScrollController();

  final _formularioKey = GlobalKey<FormState>();

  @override
  void initState() {
    medicamento.getAllMedicamentos();
    medicamento.setShow(false);
    Timer(Duration(milliseconds: 500), () {
      medicamento.setShow(true);
    });
    super.initState();
  }

  @override
  void dispose() {
    FocusScope.of(context).unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medicamentos'),
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: <Widget>[
                Form(
                    key: _formularioKey,
                    child: Column(
                      children: <Widget>[
                        Observer(builder: (_) {
                          return TextFormField(
                            controller: medicamento.medicamento_nome,
                            focusNode: focusNome,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                labelText: 'Nome', hintText: 'Ex: Paracetamol'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Nome obrigátorio';
                              }
                              return null;
                            },
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).nextFocus();
                            },
                          );
                        }),
                        Observer(builder: (_) {
                          return TextFormField(
                            controller: medicamento.medicamento_dose,
                            focusNode: focusDose,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Dose',
                              hintText: 'Ex: 10ml',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Dose obrigátoria';
                              }
                              return null;
                            },
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).nextFocus();
                            },
                          );
                        }),
                        Observer(builder: (_) {
                          return TextFormField(
                            controller:
                                medicamento.medicamento_quantidade_diaria,
                            focusNode: focusQtde,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                labelText: 'Vezes por dia', hintText: 'Ex: 1'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigátorio';
                              }
                              return null;
                            },
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).nextFocus();
                            },
                          );
                        }),
                        SizedBox(
                          height: 15,
                        ),
                        new Text(
                          'Unidade:',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0, style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            child: Observer(builder: (_) {
                              return DropdownButton<int>(
                                items: medicamento.unidades
                                    .map(
                                      ((element) => DropdownMenuItem(
                                            value: element.id,
                                            child: Center(
                                              child: Text(
                                                element.nome,
                                              ),
                                            ),
                                          )),
                                    )
                                    .toList(),
                                onChanged: (valor) {
                                  medicamento.setUnidadeSelecionada(valor);
                                  print(valor);
                                },
                                value: medicamento.remedio.id_unidade,
                                isExpanded: true,
                              );
                            })),
                        SizedBox(
                          height: 15,
                        ),
                        new Text(
                          'Tipo:',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0, style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                          child: Observer(builder: (_) {
                            return DropdownButton<int>(
                              items: medicamento.tipos
                                  .map(
                                    ((element) => DropdownMenuItem(
                                          value: element.id,
                                          child: Center(
                                            child: Text(
                                              element.nome,
                                            ),
                                          ),
                                        )),
                                  )
                                  .toList(),
                              onChanged: (valor) {
                                medicamento.setTipoSelecionado(valor);
                                print(valor);
                              },
                              value: medicamento.remedio.id_tipo,
                              isExpanded: true,
                            );
                          }),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Observer(builder: (_) {
                          return TextFormField(
                            controller: medicamento.medicamento_anotacao,
                            decoration: InputDecoration(
                                labelText: 'Anotação',
                                hintText: 'Ex: De manhã'),
                          );
                        }),
                        SizedBox(
                          height: 15.0,
                        ),
                        Observer(builder: (_) {
                          return Center(
                            child: RaisedButton(
                                child: new Text('Salvar'),
                                onPressed: () {
                                  if (_formularioKey.currentState.validate()) {
                                    medicamento.setMedicamentos();
                                    FocusScope.of(context).unfocus();
                                    SweetAlert.show(context,
                                        title: "Salvo",
                                        style: SweetAlertStyle.success,
                                        onPress: (a) {
//controller.jumpTo(controller.position.maxScrollExtent);
                                    });
                                  }
                                }),
                          );
                        }),
                      ],
                    )),
                Observer(builder: (_) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: medicamento.remedios.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Observer(
                            builder: (_) {
                              return GestureDetector(
                                onTap: () {
                                  medicamento.setEditMedicamento(
                                      medicamento.remedios[index]);
                                  controller.jumpTo(
                                      controller.position.minScrollExtent);
                                  FocusScope.of(context)
                                      .requestFocus(focusNome);
                                },
                                child: Card(
                                  child: ListTile(
                                    title:
                                        Text(medicamento.remedios[index].nome),
                                    trailing: FlatButton(
                                        onPressed: () {
                                          SweetAlert.show(context,
                                              title: "Deletar?",
                                              style: SweetAlertStyle.confirm,
                                              showCancelButton: true,
                                              cancelButtonText: "Cancelar",
                                              confirmButtonText: "Confirmar",
                                              onPress: (bool isConfirm) {
                                            if (isConfirm) {
                                              medicamento.removeMedicamento(
                                                  medicamento
                                                      .remedios[index].id);
                                              SweetAlert.show(context,
                                                  style:
                                                      SweetAlertStyle.success,
                                                  title: "Deletado");
                                              FocusScope.of(context).unfocus();
// return false to keep dialog
                                              return false;
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.delete_forever,
                                          size: 50,
                                          color: gc.corPadrao,
                                        )),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ));
                }),
              ],
            )));
  }
}

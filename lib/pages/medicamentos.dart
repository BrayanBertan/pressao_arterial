import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'configuracao_global.dart' as gc;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pressaoarterialapp/pages/controllers/medicamentos_controller.dart';
import 'package:pressaoarterialapp/models/unidade_model.dart';
final medicamento = MedicamentoController();
class MedicamentosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MedicamentosPageState();
}

class _MedicamentosPageState extends State<MedicamentosPage> {
  final TextEditingController medicamento_nome = TextEditingController();
  final TextEditingController medicamento_dose = TextEditingController();
  final TextEditingController medicamento_quantidade_diaria = TextEditingController();
  final TextEditingController medicamento_anotacao = TextEditingController();

  final _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: new Container(
          padding: EdgeInsets.all(25),
          child: Form(
              key: _formularioKey,
              child: ListView(
                children: <Widget>[
                  Observer(
                      builder: (_) {
                        medicamento_nome.text = "${medicamento.remedio.nome}";
                        return TextFormField(
                          controller: medicamento_nome,
                          decoration: InputDecoration(
                              labelText: 'Nome', hintText: 'Ex: Paracetamol'),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Nome obrigátorio';
                            }
                            return null;
                          },
                        );
                      }
                  ),
                  Observer(
                  builder: (_) {
                    medicamento_dose.text = medicamento.remedio.dose == 0?"":"${medicamento.remedio.dose}";
                    return TextFormField(
                      controller: medicamento_dose,
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
                    );
                  }
                  ),
                  Observer(
                      builder: (_) {
                        medicamento_quantidade_diaria.text = medicamento.remedio.quantidade_diaria == 0?"":"${medicamento.remedio.quantidade_diaria}";
                        return TextFormField(
                          controller: medicamento_quantidade_diaria,
                          decoration: InputDecoration(
                              labelText: 'Vezes por dia', hintText: 'Ex: 1'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Campo obrigátorio';
                            }
                            return null;
                          },
                        );
                      }
                  ),
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
                        width: 50,
                        height: 40,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: Observer(
                            builder: (_) {
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
                                  )
                                  ),
                                ).toList(),
                                onChanged: (valor) {
                                  medicamento.setUnidadeSelecionada(valor);
                                  print(valor);
                                },
                                value: medicamento.remedio.id_unidade,
                                isExpanded: true,
                              );
                            }
                        )
                      ),
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
                        width: 150,
                        height: 40,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: Observer(
                            builder: (_) {
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
                                  )
                                  ),
                                ).toList(),
                                onChanged: (valor) {
                                  medicamento.setUnidadeSelecionada(valor);
                                  print(valor);
                                },
                                value: medicamento.remedio.id_unidade,
                                isExpanded: true,
                              );
                            }
                        ),
                      ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
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
                          if (_formularioKey.currentState.validate()) {
                           medicamento.setMedicamentos(medicamento_nome.text,medicamento_dose.text,medicamento_quantidade_diaria.text,medicamento_anotacao.text);
                          }
                        }),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Observer(
                      builder: (_) {
                        return Container(
                          child: Column(
                            children: medicamento.remedios
                                .map((event) => Container(
                              decoration: BoxDecoration(
                                color: gc.corPadrao,
                                border: Border.all(width: 0.8),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              child: ListTile(
                                title: Text(event.nome),
                                leading: Icon(Icons.delete_forever),
                              ),
                            ))
                                .toList(),
                          ),
                        );
                      }
                  )
                ],
              )),
        ));
  }
}
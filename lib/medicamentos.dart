import 'package:flutter/material.dart';

class MedicamentosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MedicamentosPageState();
}

class _MedicamentosPageState extends State<MedicamentosPage> {
  final _formKey = GlobalKey<FormState>();
  List<String> _unidades = ['Ml', 'Mg', 'G'];
  List<String> _tiposRemedio = [
    'Relaxante Muscular',
    'Anticoagulante',
    'anti-hipertensivo',
    'Analgésico',
    'Antidiabético',
    'Suplemento de vitamina',
    'Anti-inflamatório',
    'Ansiolitíco',
    'Anticonvulsionante',
  ];

  String _unidadeSelecionada = 'Ml';
  String _tipoSelecionado = 'Analgésico';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medicamentos'),
        ),
        body: new Container(
          padding: EdgeInsets.all(25),
          child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nome', hintText: 'Ex: Paracetamol'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Nome obrigátorio';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
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
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Vezes por dia', hintText: 'Ex: 1'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo obrigátorio';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
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
                        child: DropdownButton<String>(
                          items: _unidades
                              .map(
                                ((element) => DropdownMenuItem(
                                      value: element,
                                      child: Center(
                                        child: Text(
                                          element,
                                        ),
                                      ),
                                    )),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _unidadeSelecionada = value;
                            });
                          },
                          value: _unidadeSelecionada,
                          isExpanded: true,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      new Text(
                        'Tipo:',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      SizedBox(
                        width: 5,
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
                        child: DropdownButton<String>(
                          items: _tiposRemedio
                              .map(
                                ((element) => DropdownMenuItem(
                                      value: element,
                                      child: Text(
                                        element,
                                      ),
                                    )),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _tipoSelecionado = value;
                            });
                          },
                          value: _tipoSelecionado,
                          isExpanded: true,
                        ),
                      ),
                    ],
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
                          if (_formKey.currentState.validate()) {
                            print('pegou');
                          }
                        }),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: Column(
                      children: _tiposRemedio
                          .map((event) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(width: 0.8),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                child: ListTile(
                                  title: Text(event),
                                  leading: Icon(Icons.delete_forever),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ],
              )),
        ));
  }
}

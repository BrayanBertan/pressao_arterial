import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pressaoarterialapp/pages/controllers/perfis_controller.dart';
import 'configuracao_global.dart' as gc;
import 'package:sweetalert/sweetalert.dart';
import 'package:flutter/services.dart';

final perfil_controller = PerfilController();

class PerfilPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  final _formularioPerfilKey = GlobalKey<FormState>();
  @override
  void initState() {
    gc.clearPerfil();
    perfil_controller.getAllPerfis();
    perfil_controller.clearPerfil();
    perfil_controller.setShowLista(false);

    Timer(Duration(milliseconds: 500), () {
      perfil_controller.setShowLista(true);
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
        title: Observer(builder: (_) {
          return Center(
              child: Text('Diário de pressão ', textAlign: TextAlign.center)
          );
        })
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              Expanded(child: Divider(color: Colors.black)),
              Text(
                'Novo perfil:',
                style: TextStyle(fontSize: 25),
              ),
              Expanded(child: Divider(color: Colors.black)),
            ],
          ),
          Form(
              key: _formularioPerfilKey,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      children: <Widget>[
                        Observer(builder: (_) {
                          return TextFormField(
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(labelText: 'Nome'),
                            controller: perfil_controller.perfilNome,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                FocusScope.of(context).requestFocus();
                                return 'Nome obrigátorio';
                              }
                              return null;
                            },
                          );
                        }),
                        SizedBox(height: 8),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) =>
                                Observer(builder: (_) {
                                  return GestureDetector(
                                    onTap: () => perfil_controller
                                        .setAvatarSelecionado(index),
                                    child: Center(
                                        child: CircleAvatar(
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/avatar${index}.png'),
                                            minRadius: 40,
                                            maxRadius: (perfil_controller
                                                .avatarSelecionado ==
                                                index)
                                                ? 60
                                                : 50)),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ))),
          Center(
            child: RaisedButton(
              child: Text('Salvar',style: TextStyle(fontSize: 20),),
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_formularioPerfilKey.currentState.validate()) {
                  perfil_controller.setAvatar();
                  if (perfil_controller.modoEdicao == false) {
                    Timer(Duration(milliseconds: 500), () {
                      Modular.to.pushReplacementNamed('/registros');
                    });
                  }else{
                    SweetAlert.show(context,
                        title: "Salvo",
                        style: SweetAlertStyle.success, onPress: (a) {
                        });
                  }
                }
              },
            ),

          ),
          Row(
            children: <Widget>[
              Expanded(child: Divider(color: Colors.black)),
              Text(
                'Perfil existente:',
                style: TextStyle(fontSize: 25),
              ),
              Expanded(child: Divider(color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Observer(builder: (_) {
            return (!perfil_controller.showLista)
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: perfil_controller.listaPerfis.length,
                itemBuilder: (BuildContext context, int index) {
                  return Observer(
                    builder: (_) {
                      return GestureDetector(
                        onTap: () {
                          gc.changePerfil(
                              perfil_controller.listaPerfis[index]);
                          Modular.to.pushReplacementNamed('/registros');
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(perfil_controller
                                .listaPerfis[index].nome,style: TextStyle(fontSize: 20)),
                            leading: CircleAvatar(
                              backgroundImage: ExactAssetImage(
                                  'assets/images/${perfil_controller.listaPerfis[index].icone}'),
                              minRadius: 30,
                              maxRadius: 30,
                            ),
                            trailing: FlatButton(
                              onPressed: () {
                                perfil_controller.setEdicao(
                                    perfil_controller.listaPerfis[index]);
                              },
                              child: Icon(
                                Icons.edit,
                                size: 50,
                                color: gc.corPadrao,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }


}
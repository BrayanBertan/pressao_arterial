import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pressaoarterialapp/pages/controllers/transferir_controller.dart';

final transferir_controller = TransferirController();

class TransferirPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TransferirPageState();
}

class _TransferirPageState extends State<TransferirPage> {
  @override
  void initState() {
    transferir_controller.getListaDispositivosPareados();
    transferir_controller.getListaDispositivos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Transferir Dados'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Observer(builder: (_) {
                  return IgnorePointer(
                    ignoring: transferir_controller.disable,
                    child: ListTile(
                      title: Text(
                        'Dispositivos Pareados:',
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: GestureDetector(
                        onTap: () => transferir_controller
                            .getListaDispositivosPareados(),
                        child: CircleAvatar(
                          backgroundImage:
                          ExactAssetImage(transferir_controller.disable?'assets/images/carregando.gif':'assets/images/reload.png'),
                          minRadius: 20,
                          maxRadius: 20,
                        ),
                      ),
                    ),
                  );
                }),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Observer(builder: (_) {
                    return (!transferir_controller.showDispositivosPareados)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : (transferir_controller
                                    .listaDispositivosPareados.length >
                                0)
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: transferir_controller
                                    .listaDispositivosPareados.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Observer(
                                    builder: (_) {
                                      return GestureDetector(
                                          child: Card(
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/bluetooth.png'),
                                            minRadius: 20,
                                            maxRadius: 20,
                                          ),
                                          title: Text(
                                              "${transferir_controller.listaDispositivosPareados[index]['nome']}"),
                                        ),
                                      ));
                                    },
                                  );
                                },
                              )
                            : Center(
                                child: Text('Sem dispositivos disponiveis!'),
                              );
                  }),
                ),
                Observer(builder: (_) {
                  return IgnorePointer(
                    ignoring: transferir_controller.disable,
                    child: ListTile(
                      title: Text(
                        'Dispositivos não Pareados:',
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: GestureDetector(
                        onTap: () =>
                            transferir_controller.getListaDispositivos(),
                        child: CircleAvatar(
                          backgroundImage:
                          ExactAssetImage(transferir_controller.disable?'assets/images/carregando.gif':'assets/images/reload.png'),
                          minRadius: 20,
                          maxRadius: 20,
                        ),
                      ),
                    ),
                  );
                }),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Observer(builder: (_) {
                    return (!transferir_controller.showDispositivos)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : (transferir_controller.listaDispositivos.length > 0)
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: transferir_controller
                                    .listaDispositivos.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Observer(
                                    builder: (_) {
                                      return GestureDetector(
                                          child: Card(
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/bluetooth.png'),
                                            minRadius: 20,
                                            maxRadius: 20,
                                          ),
                                          title: Text(
                                              "${transferir_controller.listaDispositivos[index]['nome']}"),
                                        ),
                                      ));
                                    },
                                  );
                                },
                              )
                            : Center(
                                child: Text('Sem dispositivos disponiveis!'),
                              );
                  }),
                )
              ]),
        ),
      ),
    );
  }
}

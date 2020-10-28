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
    transferir_controller.getBateria();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Transferir dados entre dispositivos'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Dispositivos Pareados:',
                  style: TextStyle(fontSize: 15),
                ),
                Observer(builder: (_) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) {
                          return Observer(
                            builder: (_) {
                              return GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: ListTile(
                                    title: Text("aaaaaa"),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ));
                }),
                Text(
                  'Dispositivos não Pareados:',
                  style: TextStyle(fontSize: 15),
                ),
                Observer(builder: (_) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) {
                          return Observer(
                            builder: (_) {
                              return GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: ListTile(
                                    title: Text("aaaaaa"),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ));
                }),
              ]),
        ),
      ),
    );
  }
}

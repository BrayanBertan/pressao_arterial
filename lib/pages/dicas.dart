import 'package:flutter/material.dart';
import 'package:pressaoarterialapp/pages/controllers/dicas_controller.dart';
import 'lista_medicoes.dart';
import 'configuracao_global.dart' as gc;

final dica_controller = DicaController();

class DicaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DicaPageState();
}

class _DicaPageState extends State<DicaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dicas'),
        ),
        body: new Container(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: dica_controller.listaDicas.length,
                    itemBuilder: (BuildContext context, int index) => Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              margin: const EdgeInsets.only(left: 25.0),
                              padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: gc.corPadrao),
                                ),
                              ),
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                      "${dica_controller.listaDicas[index]['titulo']}",
                                      style: TextStyle(fontSize: 15)),
                                  subtitle: Text(
                                      "${dica_controller.listaDicas[index]['subtitulo']}"),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.15),
                              child: Text(
                                  "${dica_controller.listaDicas[index]['tituloprincipal']}",
                                  style: TextStyle(fontSize: 11)),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: new BoxDecoration(
                                  color: gc.corPadrao,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              alignment: new FractionalOffset(0.0, 0.5),
                              margin: const EdgeInsets.only(left: 0),
                              child: new Image(
                                image: new AssetImage(
                                    'assets/images/${dica_controller.listaDicas[index]['foto']}'),
                                height: 50,
                                width: 50,
                              ),
                            )
                          ],
                        )))));
  }
}

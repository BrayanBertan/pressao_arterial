import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'lista_medicoes.dart';
import 'configuracao_global.dart' as gc;

class PerfilPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pressão Arterial'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 5),
          Text(
            'Crie um novo perfil:',
            style: TextStyle(fontSize: 18),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nome', hintText: 'Ex: Paracetamol'),
              )),
          Text(
            'Foto',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => Center(
                  child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/pa.png'),
                minRadius: 30,
                maxRadius: 50,
              )),
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text('Salvar'),
                onPressed: (){

                },
            ),
          ),
          Text(
            'Entrar com um perfil existente:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, int) {
                return Card(
                  child: ListTile(
                      title: Text('Motivation $int'),
                      leading: CircleAvatar(
                        backgroundImage: ExactAssetImage('assets/images/pa.png'),
                        minRadius: 30,
                        maxRadius: 50,
                      ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

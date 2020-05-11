import 'package:flutter/material.dart';
import 'lista_medicoes.dart';
import 'configuracao_global.dart' as gc;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pressão Arterial'),
        ),
        body: new Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/fundo.jpg"), fit: BoxFit.cover
                )
            ),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    new Center(
                      child: CircleAvatar(
                        backgroundImage: ExactAssetImage('assets/images/pa.png'),
                        minRadius: 90,
                        maxRadius: 120,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(30),
                        child: new Center(
                          child: new Text(
                            'Entre com:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25
                            ),
                          ),
                        )
                    ),
                    new GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) =>ListaMedicoesPage())
                        );
                            
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 30, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: ExactAssetImage('assets/images/google.jpg'),
                              minRadius: 12,
                              maxRadius: 20,
                            ),
                            SizedBox(width: 30,),
                            Text('Faça o login com o google')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    new GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>ListaMedicoesPage())
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 30, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromRGBO(59, 89, 152,1.0),
                        ),
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: ExactAssetImage('assets/images/facebook.jpg'),
                              minRadius: 12,
                              maxRadius: 20,
                            ),
                            SizedBox(width: 30,),
                            Text('Faça o login com o facebook')
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}
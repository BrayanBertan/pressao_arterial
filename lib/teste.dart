Dialog simpleDialog = Dialog(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
  child: Container(
    height: MediaQuery.of(context).size.height * 1,
    width: MediaQuery.of(context).size.width * 1,
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipPath(
          clipper: WaveClipperOne(),
          child: Container(
            height: 120,
            color: Colors.blue,
            child: Center(child: Text("AQUI VAI ALGUMA COISA")),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(37, 15, 0, 0),
          child: new Row(
            children: <Widget>[
              SizedBox(
                width: 25.00,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _tela_descricao_medicao=1;
                    print(_tela_descricao_medicao);
                  });
                },
                child: Container(
                  height: 65,
                  width: 65,
                  color: _tela_descricao_medicao == 0
                      ? Colors.grey
                      : Colors.transparent,
                  child: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/remedio.png'),
                    minRadius: 90,
                    maxRadius: 120,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _tela_descricao_medicao=2;
                    print(_tela_descricao_medicao);
                  });
                },
                child: Container(
                  height: 65,
                  width: 65,
                  color: _tela_descricao_medicao == 0
                      ? Colors.grey
                      : Colors.transparent,
                  child: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/at.png'),
                    minRadius: 90,
                    maxRadius: 120,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(width: 0.8),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Column(
                      children: <Widget>[
                        Text( (_tela_descricao_medicao==1)?remedios[index]:atividades[index]),
                      ],
                    ),
                  );
                },
                itemCount: (_tela_descricao_medicao==1)?2:3,
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 1),
            child: Center(
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Voltar',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            )),
      ],
    ),
  ),
);



showDialog(
context: context, builder: (BuildContext context) => simpleDialog);
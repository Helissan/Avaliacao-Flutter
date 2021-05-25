import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calcule sua viagem'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tempoController = TextEditingController();
  final _distanciaController = TextEditingController();
  int _resultado = 0;

  void _limpa() {
    setState(() {
      _tempoController.text = "";
      _distanciaController.text = "";
      _resultado = 0;
    });
  }

  void _calcula() {
    setState(() {
      int _tempo = int.parse(_tempoController.text);
      int _distancia = int.parse(_distanciaController.text);
      if (_tempo < 5){
        _resultado = 600;
      }else if(_tempo < 60){
          _resultado = _tempo * 100 + _distancia * 50;
        }else if(_distancia < 100){
            _resultado = _distancia * 200;
          }else{
            _resultado = _distancia * 150;
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            Text(
            "Informe os dados nos campos abaixo",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white,),
            ),
            SizedBox(
            height: 20,
            ),
            TextFormField(
            controller: _tempoController,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: new EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              labelText: "Tempo em minutos",
              filled: true,
              fillColor: Colors.white24,
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              )
            ),
            style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
            height: 20,
            ),
            TextFormField(
            controller: _distanciaController,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: new EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              labelText: "Distância em quilômetros",
              filled: true,
              fillColor: Colors.white24,
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              )
            ),
            style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
            height: 20,
            ),
            Container(
            child: Row(              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[                
                new FlatButton(
                  color: Colors.white,
                  child: Text('Limpar'),
                  onPressed:() async{
                    _limpa();           
                }
                ),
                new FlatButton(  
                  color: Colors.indigo[300],
                  child: Text('Calcular'),
                  onPressed:() async{  
                    _calcula();             
                  },
                ),
              ],
            ) 
            ),
            Text(
              '$_resultado',
              style: Theme.of(context).textTheme.headline4,
            ),  
          ],
        ),
      ),
    );
  }
}
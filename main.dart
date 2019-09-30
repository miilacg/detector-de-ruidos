import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp()); 
class MyApp extends StatelessWidget {//raiz da aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detector de ruídos', //aparece quando o app é minimizado
      home: MyHomePage(title: 'Detector de ruídos'),
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
  int count = 0;

  void _incrementCounter() {
    setState(() {
      count++;
    });
  }

  void _decrementCounter() {
    setState(() {
      count--;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Detector de ruídos'), // titulo na pagina
      ), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selecione o máximo de ruído permitido:',
            ),
            Text(
              ' ',
            ),
            Text(
              ' ',
            ),
            _scoreButtons(count),
            Text(
              ' ',
            ),
            Text(
              ' ',
            ),
            Text(
              ' ',
            ),
            Text(
              ' ',
            ),
            _conexao(),
          ],
        ),
      ),
    );
  }
  
  Widget _scoreButtons(int count) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buttonRuido(
          text: '-',
          color: Colors.black.withOpacity(0.1),
          onPressed: _decrementCounter,
        ),
        Text(
          '$count',
          style: Theme.of(context).textTheme.display1, //mexe no tamanho da letra
        ),
        _buttonRuido(
          text: '+',
          color: Colors.blue.withOpacity(0.70),
          onPressed: _incrementCounter,
        ),
      ],
    );
  }

   Widget _buttonRuido({String text, double size = 52.0, Color color, Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipOval(
        child: Container(
          color: color,
          height: size,
          width: size,
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  Widget _conexao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buttonConexao(
          text: 'Conectar',
          color: Colors.blue.withOpacity(0.90),
          onPressed: _decrementCounter,
        ),
        Text(
          ' ',
        ),
        _buttonConexao(
          text: 'Desconectar',
          color: Colors.black.withOpacity(0.1),
          onPressed: _incrementCounter,
        ),
        Text(
          ' ',
        ),
        Text(
          ' ',
        ),
        Text(
          ' ',
        ),
        Text(
          ' ',
        ),
        _buttonConexao(
          text: 'Ver analise de dados',
          color: Colors.blue.withOpacity(0.90),
          onPressed: _incrementCounter,
        ),
      ],
    );
  }

  Widget _buttonConexao({String text, Color color, Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,      
      child: Container(
        color: color,
        height: 42.0,
        width: 250.0,
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        )),
      ),      
    );
  }
}
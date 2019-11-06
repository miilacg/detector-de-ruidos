import 'package:flutter/material.dart';
import 'package:bluetooth_teste/analise_grafica.dart';
import 'package:bluetooth_teste/analise_estatistica.dart';

class Analise extends StatefulWidget{
  _Analise createState() => _Analise();
}

class _Analise extends State<Analise> {

  void _grafico(){ // leva para pagina de analisar dados
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnaliseGrafica()),
    );
  }

  void _estatistica(){ // leva para pagina de analisar dados
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnaliseEstatistica()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detector de ruídos"), //titulo da pagina 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Análise de dados',
              style: TextStyle (fontSize: 35.0, color: Colors.blue.withOpacity(0.90),),
            ),
            Text(' ',),
            Text(' ',),
            Text(' ',),
            Text(' ',),
            Text(' ',),
            Text('Selecione o modo que deseja visualizar a análise:',),
            Text(' ',),
            Text(' ',),
            Text(' ',),
            _modoAnalise(),
          ],
        ),
      ),
    );
  }

  Widget _modoAnalise() { 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buttonModoAnalise(
          onPressed: _grafico,
          text: 'Análise gráfica',
          color: Colors.blue.withOpacity(0.85),
        ),
        Text(' ',),
        _buttonModoAnalise(
          onPressed: _estatistica,
          text: 'Análise estatística',
          color: Colors.blue.withOpacity(0.85),
        ),
      ],
    );
  }

  Widget _buttonModoAnalise({String text, Color color, Function onPressed}) { //implementacao das caracteristicas do botões 
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
          )
        ),
      ),      
    );
  }
}
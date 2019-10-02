import 'package:flutter/material.dart';

class AnaliseGrafica extends StatefulWidget{
  _AnaliseGrafica createState() => _AnaliseGrafica();
}

class _AnaliseGrafica extends State<AnaliseGrafica> {
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
            Text(
              'Análise grafica',
              style: TextStyle (fontSize: 25.0, color: Colors.black.withOpacity(0.90),),
            ),
            Text(' ',),
            Text(' ',),
            Text(' ',),
          ],
        ),
      ),
    );
  }
}
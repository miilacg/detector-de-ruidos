import 'package:flutter/material.dart';

class AnaliseEstatistica extends StatefulWidget{
  _AnaliseEstatistica createState() => _AnaliseEstatistica();
}

class _AnaliseEstatistica extends State<AnaliseEstatistica> {
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
              'Análise estatistica',
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
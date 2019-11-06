import 'package:flutter/material.dart';
import 'package:bluetooth_teste/tela_inicial.dart';

void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget {//raiz da aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detector de ruídos', //aparece quando o app é minimizado
      home: MyHomePage(), //primeira tela mostrada no aplicativo
    );
  }
}
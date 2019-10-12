import 'package:flutter/material.dart';

class Conexao extends StatefulWidget{
  _Conexao createState() => _Conexao();
}

class _Conexao extends State<Conexao> {
  String senha = "";
  String rede = "";
  
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
              'Conectar',
              style: TextStyle (fontSize: 35.0, color: Colors.blue.withOpacity(0.90),),
            ),
            Text(' ',),
            Text(' ',),
            Text(' ',),
            Text(' ',),
            Text(' ',),
            Text ('Nome da rede:'),
            TextField(
              onChanged: (text){
                rede = text;
              }
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '                                Nome da rede'
              ),
            ),
            Text(' ',),
            Text(' ',),
            Text ('Senha da rede:'),
            TextField(
              onChanged: (text){
                senha = text;
              }
              /*decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '                                       Senha'
              ),*/
            ),
            Text(' ',),
            Text(' ',),
            Text(' ',),
            _conexao(),
          ],
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
        ),
        Text(' ',),        
      ],
    );
  }

  Widget _buttonConexao({String text, Color color, Function onPressed}) { //implementacao das caracteristicas do botões conectar, desconectare e analise de dados
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
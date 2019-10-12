import 'package:flutter/material.dart';
import 'package:detector_ruidos/analise_dados.dart';
import 'package:detector_ruidos/conexao.dart';

class MyHomePage extends StatefulWidget { // satateful = estado mutavel, ou seja, pode mudar durante o tempo 
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 10;
  String texto = "";

  var _opcoes = ['Controle', 'Vigilância'];
  var _itemSelecionado;
  
  void _incrementCounter() { //aumenta o valor de ruido permitido
    setState(() {
      if (count < 20){
        count ++;
        texto = "";
      }else{ //avisa quando chegar ao maximo que o sensor aceita
        texto = "Você chegou ao limite";
      }
    });
  }

  void _decrementCounter() { //diminui o valor de ruido permitido
    setState(() {
      if (count > 10){
        count --;
        texto = "";
      }else{ //avisa quando chegar ao minimo aceito
        texto = "Você chegou ao limite";
      }
    });
  }

  void _dropDownItemSelected(String novoItem){//função relacionada a selação do modulo
      setState(() {
        this._itemSelecionado = novoItem;
      });
  }

  void _dados(){ // leva para pagina de analisar dados
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Analise()),
    );
  }

  void _conecta(){ // leva para pagina de conexao
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Conexao()),
    );
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
            _selecaoModulo(), //chama o widget da seleção do modulo
            Text(' ',),
            Text(' ',),
            Text('Selecione o máximo de ruído permitido:',),
            Text(' ',),
            Text(' ',),
            _ruido(count), //chama widget para seleção do valor do ruído
            Text(' ',),
            _imprime(texto), //chama widget que avisa quando chega no limite do ruído
            Text(' ',),
            Text(' ',),
            Text(' ',),
            _conexao(), //botoes de conectar, desconectar e analise de dados
          ],
        ),
      ),
    );
  }
  
  Widget _selecaoModulo() { //seleção do modulo
    return Container(
      child: Column(
        children: <Widget>[
            Text('Selecione o modulo de operação:',),
            Text(' ',),
          DropdownButton<String>(
            items : _opcoes.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            style: Theme.of(context).textTheme.display1,
            onChanged: (String novoItemSelecionado) {
              _dropDownItemSelected(novoItemSelecionado);
              setState(() {
              this._itemSelecionado =  novoItemSelecionado;
              });
            },
            value: _itemSelecionado
          ),
          //Text("O modulo selecionado foi \n$_itemSelecionado"),
        ],
      ),
    );
  }

  Widget _imprime(String texto){ //imprime quando chega no limite do valor
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          '$texto',
          style: TextStyle(
          color: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _ruido(int count) { //botão para selecionar o volume do ruído
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
          style: Theme.of(context).textTheme.display1, //mexe no estilo da letra
        ),
        _buttonRuido(
          text: '+',
          color: Colors.blue.withOpacity(0.70),
          onPressed: _incrementCounter,
        ),
      ],
    );
  }

   Widget _buttonRuido({String text, double size = 45.0, Color color, Function onPressed}){ //implementacao das caracteristicas do botões usados na seleção de ruidos
    return GestureDetector(//detecta gestos
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
          onPressed: _conecta,
        ),
        Text(' ',),
        _buttonConexao(
          text: 'Desconectar',
          color: Colors.black.withOpacity(0.1),
        ),
        Text(' ',),
        Text(' ',),
        Text(' ',),
        Text(' ',),
        _buttonConexao(
          text: 'Ver analise de dados',
          color: Colors.blue.withOpacity(0.90),
          onPressed: _dados,
        ),
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
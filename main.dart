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
  int count = 10;
  String texto = " ";
  var _opcoes = ['Controle', 'Vigilancia'];
  var _itemSelecionado;

  void _incrementCounter() {
    setState(() {
      if (count < 20){
        count ++;
        texto = "";
      }else{
        texto = "Você chegou ao limite";
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (count > 10){
        count --;
        texto = "";
      }else{
        texto = "Você chegou ao limite";
      }
    });
  }

  void _dropDownItemSelected(String novoItem){
      setState(() {
      this._itemSelecionado = novoItem;
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
            criaDropDownButton(),
            Text(
              ' ',
            ),
            Text(
              ' ',
            ),
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
            _imprime(texto),
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
  
  Widget criaDropDownButton() {
    return Container(
      child: Column(
        children: <Widget>[
            Text(
              'Selecione o modulo de operação:',
            ),
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

  Widget _imprime(String texto){
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
          style: Theme.of(context).textTheme.display1, //mexe no stilo da letra
        ),
        _buttonRuido(
          text: '+',
          color: Colors.blue.withOpacity(0.70),
          onPressed: _incrementCounter,
        ),
      ],
    );
  }

   Widget _buttonRuido({String text, double size = 45.0, Color color, Function onPressed}) {
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
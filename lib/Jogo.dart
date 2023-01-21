import 'package:flutter/material.dart';
import 'dart:math';


class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _comp_image = AssetImage('images/padrao.png');
  var _comp_result;
  var _user_result;
  var _status = "Escolha uma opção abaixo:";

  void gerador(var _user_result){
    final random = Random();
    final randomNumber = random.nextInt(3);
    _comp_result = randomNumber;

    if (_user_result == 0 && _comp_result == 0){
      setState((){
        this._comp_image = AssetImage('images/papel.png');
      });
      _status = 'Houve empate!';
    } else if (_user_result == 0 && _comp_result == 1){
      setState((){
        this._comp_image = AssetImage('images/pedra.png');
      });
      _status = 'Você ganhou!';
    } else if (_user_result == 0 && _comp_result == 2){
      setState((){
        this._comp_image = AssetImage('images/tesoura.png');
      });
      _status = 'Você perdeu!';
    }

    if (_user_result == 1 && _comp_result == 0){
      setState((){
        this._comp_image = AssetImage('images/papel.png');
      });
      _status = 'Você perdeu!';
    } else if(_user_result == 1 && _comp_result == 1){
      setState((){
        this._comp_image = AssetImage('images/pedra.png');
      });
      _status = 'Houve empate!';
    } else if(_user_result == 1 && _comp_result == 2){
      setState((){
        this._comp_image = AssetImage('images/tesoura.png');
      });
      _status = 'Você ganhou!';
    }

    if (_user_result == 2 && _comp_result == 0){
      setState((){
        this._comp_image = AssetImage('images/papel.png');
      });
      _status = 'Você ganhou!';
    } else if (_user_result == 2 && _comp_result == 1){
      setState((){
        this._comp_image = AssetImage('images/pedra.png');
      });
      _status = 'Você perdeu!';
    } else if (_user_result == 2 && _comp_result == 2){
      setState((){
        this._comp_image = AssetImage('images/tesoura.png');
      });
      _status = 'Houve empate!';
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("JokenPo"),
        backgroundColor: Colors.indigo,
      ),



      body:
        Center(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),

            child: Column(
              children: <Widget>[
                Text("Escolha do app:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Padding(padding: EdgeInsets.only(top:32, bottom:16, ), child: Image(image: this._comp_image, width: 100,)),


                Text(_status, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Padding(padding: EdgeInsets.only(top:32),
                  child:
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          GestureDetector(
                            onTap: () => gerador(0),
                            child: Image.asset('images/papel.png', width: 100)
                          ),
                          GestureDetector(
                            onTap: () => gerador(1),
                            child: Column(
                              children: <Widget>[
                                Image.asset("images/pedra.png", width: 100)
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => gerador(2),
                            child: Column(
                              children: <Widget>[
                                Image.asset("images/tesoura.png", width: 100)
                              ],
                            ),
                          )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),



    );
  }
}

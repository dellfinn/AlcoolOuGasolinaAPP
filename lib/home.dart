import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){
    double? precoAlcool = double.tryParse(_controllerAcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = 'Número inválido, digite valores maiores que 0 e utilizando [ . ]';
      });
    }else{
      setState(() {
        if((precoAlcool / precoGasolina) >= 0.7){
          _textoResultado = "Melhor abastecer com gasolina";
        }else{
          setState(() {
            _textoResultado = "Melhor abastecer com alcool";
          });
        }
      });
      _limparCampos();
    }
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alcool ou gasolina'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset('images/logo.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Saiba qual é a melhor opção de abastecimento para seu carro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
                decoration: InputDecoration(
                  labelText: "Preço do Alcool, ex: 3.50",
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 22),
                controller: _controllerAcool,
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina, ex: 4.50",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: const Text("Calcular"),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
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

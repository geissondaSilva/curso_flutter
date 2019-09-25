import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: new Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String infoText = "Informe seus dados!";

  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetField() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      infoText = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      print(imc);
      if (imc < 18.6) {
        infoText = "Abaixo do peso! ${imc.toStringAsPrecision(4)}";
      }
      // continua o if para as outras medidas
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetField,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    size: 120.0,
                    color: Colors.green,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso (Kg)",
                        labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    controller: weightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira seu peso!';
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura (cm)",
                        labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    controller: heightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira sua altura!";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            calculate();
                          }
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Text(
                    infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  )
                ],
              ),
            )));
  }
}

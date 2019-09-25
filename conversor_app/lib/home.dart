import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';


const request = "https://api.hgbrasil.com/finance?format=json&key=03f381a8";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                    child: Text("Carregando dados", style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25.0
                    ),
                    )
                );
                break;
              default:
                if(snapshot.hasError){
                  return Center(
                    child: Text("Erro ao carregar dados", style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25.0
                    ),),
                  );
                }else{
                  return Container(color: Colors.green);
                }
            };
          }
      ),
    );
  }
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _toDoList = [];

  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> savedata() async {
    String data = json.encode(_toDoList);
    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try{
      final file = await getFile();
      return file.readAsString();
    }catch (e){
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nova tarefa",
                        labelStyle: TextStyle(
                            color: Colors.blueAccent
                        )
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("ADD"),
                  textColor: Colors.white,
                  onPressed: (){

                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
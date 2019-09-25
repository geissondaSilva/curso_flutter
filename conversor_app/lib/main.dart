import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';

import 'home.dart';

const request = "https://api.hgbrasil.com/finance?format=json&key=03f381a8";

void main() async {

  runApp(MaterialApp(
    home: Home(),
  ));
}
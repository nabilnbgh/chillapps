import 'package:chillapps/pages/home.dart';
import 'package:chillapps/pages/show.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const HomeScreen(),
    routes: {'/show': (context) => const ShowDataScreen()},
  ));
}

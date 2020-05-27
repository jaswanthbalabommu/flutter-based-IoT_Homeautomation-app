import 'package:flutter/material.dart';
import 'package:home_automahine/Pages/Setup/welcome.dart';


void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Home_automachine',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
    home: new WelcomePage(),  
    );
  }
}





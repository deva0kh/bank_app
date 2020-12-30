import 'package:bank_app/constants/color_constant.dart';
import 'package:bank_app/view/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: cAccent,
        backgroundColor: cBackground,
      ),
      home:Homescreen() ,
    );
  }


}
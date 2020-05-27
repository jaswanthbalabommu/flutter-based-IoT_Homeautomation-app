import 'dart:async';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'CircleProgress.dart';
import 'control.dart';

double data;
class WaterlevelPage extends StatefulWidget {
  WaterlevelPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CircleProgressState createState() => _CircleProgressState();
}

class _CircleProgressState extends State<WaterlevelPage> with SingleTickerProviderStateMixin {

  AnimationController progressController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    progressController = AnimationController(vsync: this,duration: Duration(milliseconds: 1000)); 
    animation = Tween<double>(begin: 0,end: data).animate(progressController)..addListener((){
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Water Level"),
      ),
      body:Container( 
       decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
              "assets/images/morning.jpg"
            ),
            fit: BoxFit.cover),
          ),
      child:Center(
        child: CustomPaint(

          foregroundPainter: CircleProgress(animation.value), // this will add custom painter after child
          child: Container(
            width: 200,
            height: 200,
            child: GestureDetector(
               onTap: (){
                 if (animation.value==0)
                    progressController.forward();
                 else 
                    progressController.reverse();
                },
                child: Center(child: Text("${animation.value.toInt()} %",style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),))),
          ),
        ),

      ),
      )
    );
  }
}
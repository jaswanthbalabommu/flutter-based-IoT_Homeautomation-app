import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_automahine/Pages/Setup/waterlevel.dart';
import 'package:home_automahine/Pages/Setup/waterusage.dart';

import 'accontrol.dart';
import 'fancontrol.dart';
import 'lightcontrol.dart';
import 'motor_control.dart';

class WatermanagementPage extends StatefulWidget {
  @override
  _WatermanagementPageState createState() => _WatermanagementPageState();
}

class _WatermanagementPageState extends State<WatermanagementPage> {
 List<String> events =["Water Level","Water usage","Motor Control",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Management'),
      ),  
      body:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
              "assets/images/morning.jpg"
            ),
            fit: BoxFit.cover),
          ),
          child: Container(
            margin: const EdgeInsets.only(top:20.0),
            child: GridView(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
              children: events.map((title){
              return GestureDetector(
                child: Card(
                  margin: const EdgeInsets.all(20.0),
                  child: getCardByTitle(title),
                ),
                    onTap: (){
                  if (title=="Water Level")
                  waterlevel();
                  else if (title=="Water usage")
                  waterusage();
                  else if (title=="Motor Control")
                  motorcontrol();
                    },
              );
              }).toList(), 
          ),
          ),));
  }
  Column getCardByTitle(String title){
    String img="";
    if (title=="Water Level")
    img="assets/pie3.png";
    else if (title=="Water usage")
    img="assets/graph1.png";
    else if (title=="Motor Control")
    img="assets/water2.png";
    return Column(
     mainAxisAlignment: MainAxisAlignment.center, 
     children: <Widget>[
       new Center(
         child: Container(
           child: new Stack(
             children: <Widget>[
              new Image.asset(
                img,
                width:80.0,
                height:80.0,
                )  
             ],
           )
         ),
       ),
       Text(title,style:TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),
       textAlign: TextAlign.center,
       )      
     ],
    );
  }
void waterlevel(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> WaterlevelPage()));
}
void waterusage(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> WaterusagePage()));
}
void motorcontrol(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> MotorcontrolPage()));
}  
}
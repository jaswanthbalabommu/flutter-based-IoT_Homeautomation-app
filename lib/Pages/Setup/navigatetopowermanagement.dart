import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:home_automahine/Pages/Setup/powercharged.dart';
import 'package:home_automahine/Pages/Setup/powermonthpage.dart';
import 'package:home_automahine/Pages/Setup/powerusage.dart';

import 'accontrol.dart';
import 'fancontrol.dart';
import 'lightcontrol.dart';

class PowermanagementPage extends StatefulWidget {
  @override
  _PowermanagementPageState createState() => _PowermanagementPageState();
}

class _PowermanagementPageState extends State<PowermanagementPage> {
 List<String> events =["Power Daily Usage","Power Used this Month","Power chraged this Month"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Power Management'),
      ),
      body: Container(
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
                  if (title=="Power Daily Usage")
                  powerusagecontrol();
                  else if (title=="Power Used this Month")
                  powerusedmonth();
                  else if (title=="Power chraged this Month")
                  powercharged();
                    },
              );
              }).toList(), 
          ),
          ),));
  }
  Column getCardByTitle(String title){
    String img="";
    if (title=="Power Daily Usage")
    img="assets/graph1.png";
    else if (title=="Power Used this Month")
    img="assets/Power.png";
    else if (title=="Power chraged this Month")
    img="assets/rupee.png";
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
void powerusedmonth(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> PowermonthPage()));
}
void powerusagecontrol(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> PowerusagePage()));
}
void powercharged(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> PowerchargedPage()));
}  
}
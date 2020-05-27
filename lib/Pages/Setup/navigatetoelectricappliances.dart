import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_automahine/Pages/Setup/fancontrol.dart';

import 'accontrol.dart';
import 'lightcontrol.dart';
import 'navigatetopowermanagement.dart';

class ElectricappliancesPage extends StatefulWidget {
  @override
  _ElectricappliancesPageState createState() => _ElectricappliancesPageState();
}

class _ElectricappliancesPageState extends State<ElectricappliancesPage> {
  List<String> events =["Lights Control","Fans Control","A/C Control"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electric Appliances'),
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
                  if (title=="Lights Control")
                  lightcontrol();
                  else if (title=="Fans Control")
                  fancontrol();
                  else if (title=="A/C Control")
                  accontrol();
                    },
              );
              }).toList(), 
          ),
          ),));
  }
  Column getCardByTitle(String title){
    String img="";
    if (title=="Lights Control")
    img="assets/light.jpg";
    else if (title=="Fans Control")
    img="assets/fan.png";
    else if (title=="A/C Control")
    img="assets/ac.png";
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
void lightcontrol(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> LightcontrolPage()));
}
void fancontrol(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> FancontrolPage()));
}
void accontrol(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> AccontrolPage()));
}  
}
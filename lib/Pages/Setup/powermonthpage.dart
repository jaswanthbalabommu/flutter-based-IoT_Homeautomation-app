import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'control.dart';
final databaseReference = FirebaseDatabase.instance.reference();

class PowermonthPage extends StatefulWidget {
  PowermonthPage():super();
  @override
  _PowermonthPageState createState() => _PowermonthPageState();
}

class _PowermonthPageState extends State<PowermonthPage> {
  @override
  void initState(){
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Power Used This Month"),
      ),
      body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
              "assets/images/morning.jpg"
            ),
            fit: BoxFit.cover),
          ),
         child: Center(
        child:new Text(us.toString() == null ? 'Loding....' : 'Units Used : Units ${us.toString()}',style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold,color: Colors.black)),
      ),
    )
    );
  }
}
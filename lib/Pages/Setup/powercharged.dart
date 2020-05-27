import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'control.dart';
final databaseReference = FirebaseDatabase.instance.reference();
class PowerchargedPage extends StatefulWidget {
  PowerchargedPage():super();
  @override
  _PowerchargedPageState createState() => _PowerchargedPageState();
}

class _PowerchargedPageState extends State<PowerchargedPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Power Charged"),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
              "assets/images/morning.jpg"
            ),
            fit: BoxFit.cover),
          ),
         child:  
      Center(
        child:new Text(rate.toString() == null ? 'Loding....' : '₹: ${rate.toString()}',style: TextStyle(fontSize: 140,fontWeight: FontWeight.bold,color: Colors.black)),
      ),
    ));
  }
}
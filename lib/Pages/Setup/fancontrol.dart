import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'control.dart';
final databaseReference = FirebaseDatabase.instance.reference();
Future<FirebaseUser> user = FirebaseAuth.instance.currentUser();
var dAta;

class FancontrolPage extends StatefulWidget {
  FancontrolPage(): super();
  @override
  _FancontrolPageState createState() => _FancontrolPageState(); 
}



void _value()  {
 
    databaseReference.child(userid).child("Temporary/Fans").once().then((DataSnapshot snapshot) {
    print('Data : ${snapshot.value}');
    dAta=snapshot.value;
    //print(dAta);
    });
  }


class _FancontrolPageState extends State<FancontrolPage> {
  bool isSwitched=false;
  @override
  Void initState(){
    _value();
  //print(dAta);
  //int j = int.parse(dAta);
  super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fan Control'),
        ),
        
        body:   Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
              "assets/images/morning.jpg"
            ),
            fit: BoxFit.cover),
          ),
  child:
        Center(
          child:_switching(),
        )
         
        // updatedata(isSwitched),
  
        
        )    
    );
  }

   updatedata(isSwitched) {
   if(isSwitched==true){
      databaseReference.child(userid).child("Temporary").update({
      'Lights': '1'
    });
   }
   else if(isSwitched==false){
           databaseReference.child(userid).child("Temporary").update({
          'Lights': '0'
    });
   } 

  }


  _switching(){  
  if (dAta=='0'){
  isSwitched= false ;}
  else if (dAta=='1')
  {isSwitched= true;}
  //print(isSwitched);
  return  
  Transform.scale( scale: 3.0,
          child:Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
                updatedata(isSwitched);
              });
            },
            
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          )
  );
          }

  }

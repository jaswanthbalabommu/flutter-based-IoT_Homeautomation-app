import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cron/cron.dart';
import 'package:numberpicker/numberpicker.dart';
import 'control.dart';
String mi,hr,dd,mm='*';
class AccontrolPage extends StatefulWidget {
  @override
  _AccontrolPageState createState() => _AccontrolPageState();
}

class _AccontrolPageState extends State<AccontrolPage> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time =new TimeOfDay.now();
  
  void leaddata(newValue){
  var cron = new Cron();
  cron.schedule(new Schedule.parse('* * * * *'), () async {
   databaseReference.child(userid).child("Temporary").update({
      'Temperature': newValue ,
      'AC' : '1'
   });
  });
  }
DateTime _date1;
TimeOfDay _time1;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context, 
      initialDate: _date, 
      firstDate: _date, 
      lastDate: new DateTime(2021)
      );
      if(picked!=null ){
        print('Date Selected: ${_date1.toString()}');
        setState(() {
          _date1=picked;
        });
      }
  }
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context, 
      initialTime: _time , 
      );
    if(picked!=null && picked !=_time){
        print('Time Selected: ${_time1.toString()}');
        setState(() {
          _time1 = picked;
        });
      }
  }
    var _currentValue=18;
  @override
  Widget build(BuildContext context) {
   
        return Scaffold(
          appBar: AppBar(
            title: Text("A/C Scheduler"),
          ),
          body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
              "assets/images/morning.jpg"
            ),
            fit: BoxFit.cover),
          ),
         child:  
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,  
        children: <Widget>[  
          new Container(
            padding: new EdgeInsets.all(150.0),
            child: new Column(
              children:<Widget>[
                new Text('Date Selected: ${_date1.toString()}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
                new RaisedButton(
                color: Color(0xFFF44336),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                  child: new Text("Select Date",style: TextStyle(fontSize: 20)),
                  onPressed:() {_selectDate(context);} 
                  ),
                new Text('Time Selected: ${_time1.toString()}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)), 
                new RaisedButton(
                 color: Color(0xFFF44336),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                  child: new Text("Select Time" ,style: TextStyle(fontSize: 20,)),
                  onPressed:() {_selectTime(context);} 
                  ), 
             Transform.scale( scale: 1.0,
             child:
                  new NumberPicker.integer(
                    initialValue: _currentValue, 
                    minValue: 18, 
                    maxValue: 30, 
                    onChanged:(newValue) {
                    setState(() => _currentValue = newValue);
                    int value=_currentValue;
                    }),
             ),
            new Text("Temperature: $_currentValue",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
             new RaisedButton(
                color: Color(0xFFF44336),
                textColor: Colors.white,
               padding: const EdgeInsets.all(0.0), 
              child: new Text("Schedule",style: TextStyle(fontSize: 20)),
              onPressed:() {
                    leaddata(_currentValue);
              } 
              ),  
          ], 
        ),
      ),
        ]
        )
        )
        );
  }

  
  }
import 'dart:ffi';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
 
class WaterusagePage extends StatefulWidget {
  //
  WaterusagePage() : super();
  @override
  WaterusagePageState createState() => WaterusagePageState();
}
 



class WaterusagePageState extends State<WaterusagePage> {
  var data =new List();
  var date =new List();
 
  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
    _getUserDetails();
  }
 final databaseReference = FirebaseDatabase.instance.reference();
 
 Future<FirebaseUser> user = FirebaseAuth.instance.currentUser();
  //
  Future _getUserDetails() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print(user.uid);
    print(user.email);
    final _userid = user.uid; 
    databaseReference.child(_userid).child("Permanent/Water_used").once().then((DataSnapshot snapshot) {
    print('Data : ${snapshot.value}');
    String hello= snapshot.value.toString();
    print(hello);
    });
    }
 
  

 List<charts.Series> seriesList;
  static List<charts.Series<Usage, String>> _createRandomData() {

    final usageData = [     
      Usage('20-04-10', 9),
      Usage('20-04-09', 14),
      Usage('20-04-08', 10),
      Usage('20-04-07', 8),
      Usage('20-04-06', 12),
      Usage('20-04-05', 13),
      Usage('20-04-04', 11),];
  
   return [
      charts.Series<Usage, String>(
        id: 'Usage',
        domainFn: (Usage used, _) => used.year,
        measureFn: (Usage used, _) => used.used,
        data: usageData,
        fillColorFn: (Usage used, _) {
          return charts.MaterialPalette.red.shadeDefault;
        },
      ),
      
    ];
  }
 
  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      domainAxis: charts.OrdinalAxisSpec(
      //  renderSpec: charts.NoneRenderSpec(),
      ),
    );
  }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Water Usage"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: barChart(),
      ),
    );
  }
}

 
class Usage {
  final String year;
  final int used;
  Usage(this.year, this.used);
  Usage.fromSnapshot(DataSnapshot snapshot)
    : year = snapshot.key,
      used = snapshot.value["data"];

}
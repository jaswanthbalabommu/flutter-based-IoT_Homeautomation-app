import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_automahine/Pages/Setup/water_management.dart';

import 'navigatetoelectricappliances.dart';
import 'navigatetopowermanagement.dart';
double data;
int rate,us;
var userid;
final databaseReference = FirebaseDatabase.instance.reference();
class ControlPage extends StatefulWidget {
  @override
  _ControlPageState createState() => _ControlPageState();
}
  Future<String> getCurrentUID() async{
  FirebaseUser _userid=await FirebaseAuth.instance.currentUser();
  userid =_userid.uid;
  print(userid);
    databaseReference.child(userid).child("Temporary/Power_Usedm").once().then((DataSnapshot snapshot){
    us=snapshot.value;
    print(us);
    print(rate);
  });
  databaseReference.child(userid).child("Temporary/Power_charged").once().then((DataSnapshot snapshot2){
    rate=snapshot2.value;
  });
  databaseReference.child(userid).child("Temporary/Water_level").once().then((DataSnapshot snapshot) {
    print('Data : ${snapshot.value}');
    double data=(snapshot.value);
    print(data);
    });
  return userid;
  } 




class _ControlPageState extends State<ControlPage> {
  //final List<String> entries = <String>['Water Management', 'Power Management', 'Electric Appliances']; 
  void navigatetowatermanagement(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> WatermanagementPage()));
} 
void navigatetopowermanagement(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> PowermanagementPage()));
} 
void navigatetoelectricappliances(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> ElectricappliancesPage()));
} 
Image appLogo = new Image(
image: new ExactAssetImage("assets/water1.jpg"),
height: 75.0,
width: 75.0,
);
Image pLogo = new Image(
image: new ExactAssetImage("assets/Power.png"),
height: 75.0,
width: 75.0,
);
Image eLogo = new Image(
image: new ExactAssetImage("assets/ep.png"),
height: 75.0,
width: 75.0,
);
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Control Page'),
          ),
          body: new Stack(
          children: <Widget>[
          Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/morning.jpg"),
            fit: BoxFit.cover,
          ),
        )),
    ListView(
      children:  <Widget>[  
       Card(
        child: ListTile(
        leading: appLogo,
        title: Text('Water Management'),
        subtitle: Text(
          'Water storage control system and water Usage'
        ),
     //   trailing: Icon(Icons.more_vert),
        isThreeLine: true,
        onTap:navigatetowatermanagement,
      ),
    ),
       Card(
      child: ListTile(
        leading: pLogo,
        title: Text('Power Management'),
        subtitle: Text(
          'Power consumption and chrages for power consumed'
        ),
     //   trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      onTap:navigatetopowermanagement,  
      ),
    ),
       Card(
      child: ListTile(
        leading: eLogo,
        title: Text('Electric Appliances'),
        subtitle: Text(
          'A sufficiently long subtitle warrants three lines.'
        ),
     //   trailing: Icon(Icons.more_vert),
        isThreeLine: true,
        onTap:navigatetoelectricappliances,
      ),
    ),
  ],
)
          ]
          )
    
    );

  }
  @override
  void initState(){
    super.initState();
    getCurrentUID();
  }  
}
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_automahine/Pages/Setup/signin.dart';
import 'package:home_automahine/Pages/Setup/signup.dart';
import 'package:flutter/src/material/raised_button.dart';
class WelcomePage extends StatefulWidget {
  @override
_WelcomePageState createState()=>_WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Automachine'),
      ),
      body:new Stack(
         children: <Widget>[
       Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/morning.jpg"),
            fit: BoxFit.cover,
          ),
        )),
        
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
      ClipRRect(
     borderRadius: BorderRadius.circular(8.0),
        child:Image.asset('assets/images/homeautomation.jpg',
          width: 30.0,
          height: 300.0,
          fit: BoxFit.fill,),
      ),
           RaisedButton(
              color: Color(0xFFF44336), 
                textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              onPressed: navigateToSignUp,
              child: Text('Sign up',style: TextStyle(fontSize: 20)),
            ),
           new RaisedButton(
               color: Color(0xFFF44336), 
              onPressed: navigateToSignIn,
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
           
            child: Text('Login', style: TextStyle(fontSize: 20)),
          
            ),
        ],
      ),
          ] 
          )
    );
    
  }
 Void navigateToSignIn(){
Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
  }
  Void navigateToSignUp(){
Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
  }
}
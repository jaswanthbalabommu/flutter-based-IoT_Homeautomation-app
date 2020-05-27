import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_automahine/Pages/Setup/signin.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   String _email,_password;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:Text('Sign Up'),
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
          ClipRRect(
     borderRadius: BorderRadius.circular(8.0),
        child:Image.asset('images/smarthome2.jpg',
          width: 400.0,
          height: 250.0,
          fit: BoxFit.fill,),
      ),

        Center( 
        child:Form(
        key: _formkey,
        //TODO: Implementing key
        child: Column(
          children: <Widget>[
            TextFormField(
              style: new TextStyle(color: Colors.white),
              validator: (input) {
                if (input.isEmpty){
                  return 'Please give an Email';
                }
              },
              onSaved: (input)=> _email=input,
              decoration: InputDecoration(
              fillColor: Colors.black, filled: true, 
               labelText: 'Email',
               labelStyle: TextStyle(color:Colors.white)
              ),
            ),
            TextFormField(
              style: new TextStyle(color: Colors.white),
              validator: (input) {
                if (input.isEmpty){
                  return 'Please give a Password';
                }
                if (input.length<8){
                  return 'you are password must contain atleast 8 characters';
                }
              },
              onSaved: (input)=> _password=input,
              decoration: InputDecoration(
               fillColor: Colors.black, filled: true, 
               labelText: 'Password',
                labelStyle: TextStyle(color:Colors.white)
              ),
              obscureText: true,
            ),
            RaisedButton(
              color: Color(0xFFF44336),
              onPressed: logIn,
               textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Text('Sign UP',style: TextStyle(fontSize: 20) ),
            )
        //TODO: Implementing Fields
          ],
        ),
        ),
        )
        ]
        )
      )
    );
  }

  
  Future<void> logIn() async{
    final formState= _formkey.currentState;
    if(formState.validate()){
      formState.save();
      try{
         final FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email , password: _password)).user;
    //TODO: Validate Fileds and signup to firebase
      user.sendEmailVerification();
      Navigator.of(context).pop();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    }
      catch(e){
          print(e.message);
      }
    }
  }
} 
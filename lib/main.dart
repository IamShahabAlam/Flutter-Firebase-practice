import 'package:firebase_practice/home.dart';
import 'package:firebase_practice/login.dart';
import 'package:firebase_practice/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error Found !"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Login() ,
              routes: {
                "/login" : (context) => Login(),
                "/reg" : (context) => Register(),
                "/home" : (context) => Home(),
                

              } 
                  
            );
          }
          return Container(child: Text("WAIT! Loading..."),);
        }
        );
  }
}


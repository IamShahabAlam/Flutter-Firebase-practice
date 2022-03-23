import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 
  void login() async { 
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    final String email = emailController.text;
    final String password = passwordController.text;
    

  try  { 
    final UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
    final DocumentSnapshot snapshot = await db.collection("users").doc(user.user.uid).get();
    final data = snapshot.data();

   

    print("Email :" + email);
   print("User ID:" + user.user.uid);
    print("**** User is Successfully logged In ****");
    
   Navigator.of(context).pushNamed("/home");
   }
  catch (e) {
     print("**** ERROR ****");
  }
    
  }

 
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.yellow[600], title: Center(child: Text("Login Page")) ,),
      body: 
     SingleChildScrollView(
        child: Column(
          children: [
            
          
            Center(
              child: Container( width: MediaQuery.of(context).size.width/1.2, padding: EdgeInsets.only(top:20),
                child: TextField(cursorColor: Colors.yellow, keyboardType: TextInputType.emailAddress,
                controller: emailController ,
                 decoration: InputDecoration(
                    hintText: ("Enter Email"),
                    labelText: ("Email"),
                    labelStyle: TextStyle(color: Colors.yellow[700], ),
                    focusColor: Colors.yellow,
                    filled: true,
                    fillColor: Colors.yellow[50],
                    enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow[600])
                    ) ,
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.red, width: 10)),
                    focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.yellow,width: 2, )),
                    
                    ),),
                
              ),
            ),


            Center(
              child: Container( width: MediaQuery.of(context).size.width/1.2, padding: EdgeInsets.only(top:20),
                child: TextField(cursorColor: Colors.yellow, 
                controller: passwordController , 
                 decoration: InputDecoration(
                    hintText: ("Enter Password"),
                    labelText: ("Password"),
                    labelStyle: TextStyle(color: Colors.yellow[700], ),
                    focusColor: Colors.yellow,
                    filled: true,
                    fillColor: Colors.yellow[50],
                    enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow[600])
                    ) ,
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.red, width: 10)),
                    focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.yellow,width: 2, )),
                    
                    ),),
                
              ),
            ),



            Container( width: 100, padding: EdgeInsets.only(top:15),
              child: DecoratedBox(decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(2, 2)
                  )
                ],
                borderRadius: BorderRadius.circular(25) ,
                gradient: LinearGradient(colors: [Colors.orange,Colors.yellow[600]])
              ),child: 
               ElevatedButton( style: ElevatedButton.styleFrom( 
                   primary: Colors.transparent, shadowColor: Colors.transparent  ),
                  onPressed: login, child: Text("Login")),
              ),
            ),
          
          
          ],
        ),
      ) ,
      
    );
  }

}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class Register extends StatelessWidget {
  @override
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  void register() async { 
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String age = ageController.text;

  try  { 
    final UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
    await db.collection("users").doc(user.user.uid).set({"Email": email, "Username": username, "Age": age});
    print("Email :" + email);
    print("Username :" + username);
    print("Age :" + age);
    print("**** User is Successfully Registered ****");
  }
  catch(e){
     print("**** ERROR ****");
  }
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.yellow[600], title: Center(child: Text("Registration")) ,),
      body: 
     SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container( width: MediaQuery.of(context).size.width/1.2, padding: EdgeInsets.only(top:20),
                child: TextField(maxLength: 15, cursorColor: Colors.yellow, 
                controller: usernameController ,
                 decoration: InputDecoration(
                    hintText: ("Enter Username"),
                    labelText: ("Username"),
                    labelStyle: TextStyle(color: Colors.yellow[700], ),
                    focusColor: Colors.yellow,
                    filled: true,
                    fillColor: Colors.yellow[50],
                    enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow[600])
                    ) ,
                    
                    focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.yellow,width: 2, )),
                    
                    ),),
                
              ),
            ),

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
                child: TextField(cursorColor: Colors.yellow, keyboardType: TextInputType.visiblePassword,
                controller: passwordController , obscureText: true,
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



            Center(
              child: Container( width: MediaQuery.of(context).size.width/1.2, padding: EdgeInsets.only(top:20),
                child: TextField(maxLength:2 , cursorColor: Colors.yellow, keyboardType: TextInputType.number,
                controller: ageController ,
                 decoration: InputDecoration(
                    hintText: ("Enter Age"),
                    labelText: ("Age"),
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
            
            Container( width: 100,
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
                  onPressed: register, child: Text("Register")),
              ),
            ),
          
          
          ],
        ),
      ) ,
      
    );
  }
}

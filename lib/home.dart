import 'package:firebase_practice/chat.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  Stream chatsStream = FirebaseFirestore.instance.collection('Chats').snapshots();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.blueGrey[900],
        leadingWidth: 100,
        elevation: 12,

        leading: Container( width: 200, margin: EdgeInsets.only(top: 14, left:10),
          child: Text("WhatsApp",
            style: TextStyle(color: Colors.grey[400], fontSize: 17,fontWeight: FontWeight.w500),
          ),
        ),
        actions: [Icon(Icons.search,color: Colors.grey[400]), Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Icon( Icons.more_vert, color: Colors.grey[400],),
        )],
      ),
      
     body: Container(
       child: StreamBuilder<QuerySnapshot>(
        stream: chatsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
            Map data = document.data();
              return Chat(data:data);
            }).toList(),
          );
        },
    ),
     )
    );
  }
}




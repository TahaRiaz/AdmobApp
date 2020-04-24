import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Constant.dart';
import 'package:elearn/Item/UserContainer2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Users extends StatefulWidget {
  
  static const id = 'Users';
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {

  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('Users',
        style: TextStyle(
          color: whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        leading: IconButton(icon: Icon(Icons.arrow_back,
        color: whiteColor,),
            onPressed: (){
          Navigator.pop(context);
            }),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('Users').snapshots(),
                    builder: (context,snapshot){
                      if(!snapshot.hasData){
                        return Center(child: Text('No Users Found'));
                      }
                      final user = snapshot.data.documents;
                      List<UserContainer2> list = [];
                      UserContainer2 container;

                      for(var usr in user){

                        final username = usr.data['username'];
                        final coins = usr.data['coins'];
                        final url = usr.data['image'];
                        final docId = usr.documentID;


                        container = UserContainer2(username: username,coins: coins,url: url,docId: docId,);
                        list.add(container);
                      }
                      return Column(
                        children: list,
                      );

                    }),
              ],
            ),),
          )
        ],
      ),
    );
  }
}

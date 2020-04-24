import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Constant.dart';
import 'package:elearn/Item/Contenders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CoinsArea extends StatefulWidget {

  static const id = 'CoinsArea';
  @override
  _CoinsAreaState createState() => _CoinsAreaState();
}

class _CoinsAreaState extends State<CoinsArea> {

  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('Coins Area',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            }),
      ),
      body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),

                    StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('Users').snapshots(),
                        builder: (context,snapshot){
                          if(!snapshot.hasData){
                            return Center(child: Text('No Users Found'));
                          }
                          final user = snapshot.data.documents;
                          List<Contenders> list = [];
                          Contenders container;

                          for(var usr in user){

                            final username = usr.data['username'];
                            final coins = usr.data['coins'];
                            final url = usr.data['image'];
                            final docId = usr.documentID;
                            final blogs = usr.data['blogs'];


                            container = Contenders(username: username,coins: coins,url: url,docId: docId,blogs: blogs);
                            list.add(container);
                          }

                          return Column(
                            children: list,
                          );

                        }),


                  ],
                ),
              ),
            ),

          ]),
    );
  }
}

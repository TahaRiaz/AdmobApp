import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class UserContainer2 extends StatefulWidget {

  final coins;
  final username;
  final url;
  final docId;

  UserContainer2({this.coins,this.url,this.username,this.docId});

  @override
  _UserContainer2State createState() => _UserContainer2State();
}

class _UserContainer2State extends State<UserContainer2> {

  NetworkImage _image;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Firestore _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08)
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
              ),
              height: 60,
              width: 60,
              child: _image == null
                  ? Center(child: Image.asset('assets/images/download.jpg',
                fit: BoxFit.fill,))
                  : Image.network(widget.url,fit: BoxFit.fill,),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              builder: (context){
                                return Container(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                          child: Text('Delete User',
                                          style: TextStyle(
                                            color: Color(0xffEB5757),
                                            fontSize: 18
                                          ),),
                                        ),
                                        onTap: (){


                                              _firestore.collection('Users').document(widget.docId).delete();

//                                          showDialog(context: context,
//                                          builder: (context){
//                                            return dialog();
//                                          });
                                        },
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Container(
                            width: 50,
                            child: Image.asset('assets/images/option.png')),
                      ),
                    ],
                  ),
                  Text(widget.username,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset('assets/images/coin1.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.coins.toString())
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

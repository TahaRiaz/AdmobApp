import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'UserRegAndLogin/Login.dart';



Dialog dialog({String docId,BuildContext context,String collection}){

  Firestore _firestore = Firestore.instance;
  return Dialog(
    child: Container(
      height: 150,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('Delete',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),),
          SizedBox(
            height: 10,
          ),
          Text('Are you sure you want to delete this post?',),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                hoverColor: mainColor,
                color: Colors.transparent,
                  elevation: 0.0,
                  onPressed: (){
                _firestore.collection(collection).document(docId).delete();
                Navigator.pop(context);
              },
              child: Text('Yes',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17
              ),),),
              SizedBox(
                width: 5,
              ),
              RaisedButton(
                hoverColor: mainColor,
                color: Colors.transparent,
                elevation: 0.0,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('No',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17
                  ),),),
            ],
          )
        ],
      ),
    ),
  );
}

class AwardDialog extends StatefulWidget {

  final coins;
  final uid;

  AwardDialog({this.coins,this.uid});

  @override
  _AwardDialogState createState() => _AwardDialogState();
}

class _AwardDialogState extends State<AwardDialog> {

  Firestore _firestore = Firestore.instance;
  final _coinsController = TextEditingController();
  String award = 'Award';
  Color color = Color(0xffFA9C10);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
      width: 300,
        height: 300,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/bigCoin.png'),
            SizedBox(
              height: 10,
            ),
            Text('Award Coins',
            style: TextStyle(
              fontSize: 17,
              fontWeight:
                FontWeight.bold,
              color: Color(0xffFA9C10)
            ),),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: ThemeData(
                primaryColor: Color(0xffFA9C10)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  controller: _coinsController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 20
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'coins'
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 60),
              color: color,
                onPressed: (){
                  setState(() {
                      color = Colors.grey.shade700;
                      award = 'Awarded';
                      int coins = int.parse(_coinsController.text.toString());
                      int coin = widget.coins + coins;
                      _firestore.collection('Users').document(widget.uid).updateData({
                        'coins': coin
                      });
                  });
                },
            child: Text(award,
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),),
            RaisedButton(
                color: Colors.transparent,
                elevation: 0.0,
                onPressed: (){
                  Navigator.pop(context);
            },
            child: Text('Leave',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18
            ),),)
          ],
        ),
      ),
    );
  }
}

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 200,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text('Please Login again to see the update',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: mainColor,
              child: Text('Logout',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 18
                ),),
             onPressed: (){
                _auth.signOut();
                Navigator.popAndPushNamed(context, Login.id);
             },
            )
          ],
        ),

      ),
    );
  }
}


Dialog exit(BuildContext context){

  return Dialog(
    child: Container(
      height: 150,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('Exit',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),),
          SizedBox(
            height: 10,
          ),
          Text('Are you sure you want to Exit the app?',),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                hoverColor: mainColor,
                color: Colors.transparent,
                elevation: 0.0,
                onPressed: (){
                  SystemNavigator.pop();
                },
                child: Text('Yes',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17
                  ),),),
              SizedBox(
                width: 5,
              ),
              RaisedButton(
                hoverColor: mainColor,
                color: Colors.transparent,
                elevation: 0.0,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('No',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17
                  ),),),
            ],
          )
        ],
      ),
    ),
  );
}



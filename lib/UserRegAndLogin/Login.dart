import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/AdminPanel/AddArticle.dart';
import 'package:elearn/AdminPanel/AdminHome.dart';
import 'package:elearn/Constant.dart';
import 'package:elearn/Home.dart';
import 'package:elearn/UserRegAndLogin/ForgetPassword.dart';
import 'package:elearn/UserRegAndLogin/Registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {

  static const id = 'Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser user;
  Firestore _firestore = Firestore.instance;

  var username;
  var coins;
  var image;
  var email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/backgrnd.png',
              fit: BoxFit.cover,),
            ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Center(child: Image.asset('assets/images/nobody.png')),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text('Access Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white
                  ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text('Login To Continue',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 20
                    ),
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(
                        color: Colors.white
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Builder(
                    builder:(context) => TextField(
                      style: TextStyle(
                        color: whiteColor,
                      ),
                      obscureText: true,
                      controller: _controllerPassword,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: ()async{

                              try {
                                AuthResult result = await _firebaseAuth
                                    .signInWithEmailAndPassword(
                                    email: _controllerEmail.text,
                                    password: _controllerPassword.text);
                                user = result.user;

                                if (_controllerEmail.text ==
                                    'admin@admin.com' &&
                                    _controllerPassword.text == 'camera1010') {
                                  Navigator.pushNamed(context, AdminHome.id);
                                }

                                else{

                                  try{
                                    DocumentSnapshot snapshot = await _firestore
                                        .collection('Users')
                                        .document('${user.uid}').get();

                                    if(snapshot.exists){


                                    var username = snapshot['username'];
                                    var email = snapshot['email'];
                                    var coins = snapshot['coins'];
                                    var image = snapshot['image'];
                                    var blogs = snapshot['blogs'];

                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Home(username: username,
                                            email: email,
                                            coins: coins,
                                            uid: user.uid,
                                            url: image,
                                            blogs: blogs,);
                                        }
                                    ));}
                                    else{
                                      setState(() {
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(content: Text('Your account has been deleted and you '
                                                'no longer will be able to access this app using this email.'),
                                              duration: Duration(seconds: 6),
                                              behavior: SnackBarBehavior.fixed,
                                            ));
                                      });
                                    }
                                  }
                                  catch(e){
                                    setState(() {
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(content: Text(e.message),
                                            duration: Duration(seconds: 3),
                                            behavior: SnackBarBehavior.fixed,
                                          ));
                                    });
                                  }
                                  }
                                }
                              catch (e) {
                                setState(() {
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text(e.message),
                                        duration: Duration(seconds: 3),
                                        behavior: SnackBarBehavior.fixed,
                                      ));
                                });
                              }

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: whiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_forward,
                            color: mainColor),
                          ),
                        ),
                          hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                  onTap: (){
                      Navigator.pushNamed(context, ForgetPassword.id);
                  },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Forgot Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white
                        ),),
                        SizedBox(
                          width: 3,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Text('?',
                            style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 100
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Don\'t have an account ',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, Registration.id);
                          },
                          child: Text('Register Now',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: mainColor
                            ),),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

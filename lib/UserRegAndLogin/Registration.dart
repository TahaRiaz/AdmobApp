import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/FIrebaseAuth.dart';
import 'package:elearn/UserRegAndLogin/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:elearn/Constant.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Registration extends StatefulWidget {

  static const id = 'Registration';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final _controllerUser = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerCPassword = TextEditingController();
  bool _validate = false;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser user;
  Firestore _firestore = Firestore.instance;
  File _image;
  String url;


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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                      ),
                      child: Image.asset('assets/images/nobody.png',)

                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text('Create Account',
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
                    child: Text('Fill All The Details',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 20
                    ),
                    controller: _controllerUser,
                    decoration: InputDecoration(
                        hintText: 'Enter User Name',
                        hintStyle: TextStyle(
                            color: Colors.white
                        )
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 20
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(
                            color: Colors.white
                        )
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: TextStyle(
                        color: whiteColor
                    ),
                    obscureText: true,
                    controller: _controllerPassword,
                    decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(
                            color: Colors.white
                        )
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Builder(
                    builder:(context) => TextField(
                      style: TextStyle(
                        color: whiteColor
                      ),
                      controller: _controllerCPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: ()async{
                            setState(() async{

                              if(_controllerUser.text.isEmpty||_controllerEmail.text.isEmpty||_controllerPassword.text.isEmpty||_controllerCPassword.text.isEmpty){
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Please fill all the boxes'),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.fixed,
                                    ));
                              }
                              else if(_controllerPassword.text != _controllerCPassword.text){
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Password do not match'),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.fixed,
                                    ));}
                              else{
                                try{

                                  AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
                                  user = result.user;


                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text('SignUp Succesful'),
                                        duration: Duration(seconds: 2),
                                        behavior: SnackBarBehavior.fixed,
                                      ));

                                  _firestore.collection('Users').document('${user.uid}').setData({
                                    'username': _controllerUser.text,
                                    'email': _controllerEmail.text,
                                    'coins': 0,
                                    'image': '',
                                    'uid': user.uid,
                                    'blogs': 0
                                  });
                                  _controllerEmail.clear();
                                  _controllerUser.clear();
                                  _controllerPassword.clear();
                                  _controllerCPassword.clear();
                                }
                                catch(e){
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text(e.message),
                                        duration: Duration(seconds: 2),
                                        behavior: SnackBarBehavior.fixed,
                                      ));
                                }

                              }});
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
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                              color: Colors.white
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50,bottom: 20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Already Have An Account',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, Login.id);
                            },
                            child: Text('Login Now',
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
            ),
          )
        ],
      ),
    );
  }
}


import 'package:elearn/Constant.dart';
import 'package:elearn/FIrebaseAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ForgetPassword extends StatefulWidget {

  static const id ='ForgetPassword';
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  final _controllerEmail = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                          color: whiteColor,),
                        onPressed: (){
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: 120,
                    ),
                    Center(
                      child: Text('Reset Password',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          color: whiteColor
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text('Provide Your Email',
                        style: TextStyle(
                            fontSize: 17,
                            color: whiteColor,
                            fontWeight: FontWeight.w600,
                        ),),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Builder(
                      builder: (context) => TextField(
                        style: TextStyle(
                            color: whiteColor
                        ),
                        controller: _controllerEmail,
                        decoration: InputDecoration(
                            hintText: 'Enter Email',
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                try{
                                  _firebaseAuth.sendPasswordResetEmail(email: _controllerEmail.text);
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text('Email has been send'),
                                        duration: Duration(seconds: 2),
                                        behavior: SnackBarBehavior.fixed,
                                      ));
                                  _controllerEmail.clear();
                                }
                                catch(e){
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text(e.message),
                                        duration: Duration(seconds: 2),
                                        behavior: SnackBarBehavior.fixed,
                                      ));
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.arrow_forward,
                                  color: mainColor),
                            ),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}

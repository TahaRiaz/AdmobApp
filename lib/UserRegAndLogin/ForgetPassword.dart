import 'package:elearn/Constant.dart';
import 'package:elearn/FIrebaseAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      body: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(image: AssetImage('assets/images/Group5.png')),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text('Reset Password',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text('Provide Your Email',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff5E5E5E),
                          fontWeight: FontWeight.w600
                      ),),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: mainColor),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          prefixIcon: Icon(Icons.email,
                              color: mainColor),
                          hintText: 'email@email.com'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Builder(
                        builder:(context) => FlatButton(
                          color: mainColor,
                          onPressed: (){
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
                          child: Text('Reset Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

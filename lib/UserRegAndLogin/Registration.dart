import 'package:elearn/FIrebaseAuth.dart';
import 'package:elearn/UserRegAndLogin/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:elearn/Constant.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(image: AssetImage('assets/images/Group5.png')),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text('Create Account',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text('Fill up all the details',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff5E5E5E),
                        fontWeight: FontWeight.w600
                    ),),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _controllerUser,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 10,left: 10),
                          child: FaIcon(FontAwesomeIcons.userAlt,
                            color: mainColor,),
                        ),
                        hintText: 'User Name',
                     // errorText: _validate?'Please fill this box':null
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        prefixIcon: Icon(Icons.email,
                          color: mainColor,),
                        hintText: 'email@email.com',
                       // errorText: _validate?'Please fill this box':null
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: true,
                    controller: _controllerPassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        prefixIcon: Icon(Icons.lock,
                          color: mainColor,),
                        hintText: 'Password',
                       // errorText: _validate?'Please fill this box':null
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _controllerCPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        prefixIcon: Icon(Icons.lock,
                          color: mainColor,),
                        hintText: 'Confirm Password',
                       // errorText: _validate?'Please fill this box':null
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Builder(
                      builder:(context) => FlatButton(
                        color: mainColor,
                        onPressed: () async{
                            setState(() async {

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
                        child: Text('Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Already have an account? ',
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


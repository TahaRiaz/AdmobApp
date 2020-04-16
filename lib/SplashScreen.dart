import 'dart:io';

import 'package:elearn/Constant.dart';
import 'package:elearn/UserRegAndLogin/Login.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SplashScreen extends StatefulWidget {

  static const id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();

}



class _SplashScreenState extends State<SplashScreen>with SingleTickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    controller.forward();

    controller.addListener(() {
      setState(() {
        if (controller.value == 1) {
//          Navigator.pushReplacement(
//              this.context,
//              MaterialPageRoute(
//                builder: (context) => Login(),
//                //anotherApp()),
//              ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("BINATE",
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 40,
              letterSpacing: 1,
              color: Colors.white,
              fontWeight: FontWeight.w900
            ),
            ),

            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DotsIndicator(
                  dotsCount: 5,
                  position: 0,
                  decorator: DotsDecorator(
                      activeColor: Colors.white,
                      color: Color(0xff4971B0)
                  ),
                ),
                Text('FORUM',
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w300,
                  fontSize: 17
                ),),
              ],
            ),
//            Image(image: AssetImage('assets/images/E-LEARN.png')),
//            SizedBox(
//              height: 10,
//            ),
//            Image(image: AssetImage('assets/images/NOW.png'))
          ],
        ),
      ),
    );
  }
}

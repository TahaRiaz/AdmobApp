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



class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin {

  AnimationController controller1;
  AnimationController controller2;
  AnimationController controller3;
  AnimationController controller4;
  Color c1 = Colors.white;
  Color c2 = Color(0xff4971B0);
  Color c3 = Color(0xff4971B0);
  Color c4 = Color(0xff4971B0);
  Color c5 = Color(0xff4971B0);

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    controller2 = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    controller3 = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    controller4 = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    controller1.forward();

    controller1.addListener(() {
      setState(() {
        if (controller1.value == 1) {
          setState(() {
            c2 = Colors.white;
          });
        }
      });
    });
    controller2.forward();

    controller2.addListener(() {
      setState(() {
        if (controller2.value == 1) {
          setState(() {
            c3 = Colors.white;
          });
        }
      });
    });
    controller3.forward();

    controller3.addListener(() {
      setState(() {
        if (controller3.value == 1) {
          setState(() {
            c4 = Colors.white;
          });
        }
      });
    });
    controller4.forward();

    controller4.addListener(() {
      setState(() {
        if (controller4.value == 1) {
          setState(() {
            c5 = Colors.white;
          });
          Navigator.pushReplacement(
              this.context,
              MaterialPageRoute(
                builder: (context) => Login(),
                //anotherApp()),
              ));
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
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: c1,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: c2,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: c3,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: c4,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: c5,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                ],
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

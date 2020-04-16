import 'package:elearn/AdminPanel/AdminBlogList.dart';
import 'package:elearn/Item/UsersContainer.dart';
import 'package:elearn/UserRegAndLogin/ForgetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elearn/Constant.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Description.dart';

class AdminHome extends StatefulWidget {

  static const id = 'AdminHome';
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  @override
  Widget build(BuildContext context) {

    Size media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        centerTitle: true,
        title: Text('Home',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10,top: 10,bottom: 10),
            child: Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                  color: Color(0xffEAEAEA),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Image(image: AssetImage('assets/images/coin1.png')),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text('120',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              showModalBottomSheet(
                  context: context,
                  builder: (context){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10,
                              top: 10),
                          child: GestureDetector(
                            child: Text('Cancel',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFB5858)
                              ),),
                            onTap: (){
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage('assets/images/download.jpg'),
                                  fit: BoxFit.cover,)
                            ),
                            height: 60,
                            width: 60,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text('profile Name',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: mainColor
                            ),),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: FaIcon(FontAwesomeIcons.home,
                                        color: mainColor),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text('Home',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: mainColor
                                    ),)
                                ],
                              ),
                              onTap: (){
                                Navigator.pushNamed(context, null);
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: FaIcon(FontAwesomeIcons.userAlt),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text('Profile',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),)
                                ],
                              ),
                              onTap: (){
                                Navigator.pushNamed(context, null);
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: FaIcon(FontAwesomeIcons.powerOff),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text('Logout',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),)
                                ],
                              ),
                              onTap: (){
                                Navigator.pushNamed(context, null);
                              },
                            )
                          ],
                        )
                      ],
                    );
                  });
            }),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: media.width,
                    height: media.height * 0.2,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1)
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff4F4F4F)
                          ),
                          child: Center(
                            child: Text('25',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25
                            ),),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('No. of Users',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: media.width * 0.4,
                        height: media.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff4F4F4F).withOpacity(0.3),
                                Color(0xff89C5FD).withOpacity(0.8)
                              ])
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff4F4F4F)
                              ),
                              child: Center(
                                child: Text('25',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25
                                  ),),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('No. of Articles',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, AdminBlogList.id);
                        },
                        child: Container(
                          width: media.width * 0.4,
                          height: media.height * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffE03510).withOpacity(0.3),
                                    Color(0xffE88E7B).withOpacity(0.8),
                                  ])
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4F4F4F)
                                ),
                                child: Center(
                                  child: Text('25',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25
                                    ),),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('No. of Blogs',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Recent Users',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),),
                  UsersContainer(),
                  UsersContainer(),
                  UsersContainer(),
                  UsersContainer(),
                  UsersContainer(),
                  UsersContainer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


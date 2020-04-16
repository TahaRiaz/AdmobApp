import 'package:elearn/AllItem.dart';
import 'package:elearn/Blog.dart';
import 'package:elearn/Constant.dart';
import 'package:elearn/Description.dart';
import 'package:elearn/NewBlog.dart';
import 'package:elearn/UserRegAndLogin/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {

  static const id = 'Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    Size media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
    body: Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  width: media.width,
                  height: media.height * 0.10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context){
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
                                              child: FaIcon(FontAwesomeIcons.userAlt,
                                                color: Color(0xffFB5858),),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text('Profile',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffFB5858)
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
                                              child: FaIcon(FontAwesomeIcons.handsHelping,
                                                color: Color(0xff0ACE9F),),
                                            ),
                                            SizedBox(
                                              width: 23,
                                            ),
                                            Text('Invite Friends',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff0ACE9F)
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
                                            Builder(
                                              builder:(context) => Text('Logout',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold
                                                ),),
                                            )
                                          ],
                                        ),
                                        onTap: ()async{
                                          try{
                                          _firebaseAuth.signOut();
                                          Navigator.pushNamed(context, Login.id);
                                        }
                                        catch(e){
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(content: Text(e.message),
                                                duration: Duration(seconds: 2),
                                                behavior: SnackBarBehavior.fixed,
                                              ));
                                        }
                                        },
                                      )
                                    ],
                                  )
                                ],
                              );
                            });
                          },
                          child: Icon(Icons.menu,
                            size: 30,),
                        ),
                      ),
                      Text('Home',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          height: 40,
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
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: media.height,
                  width: media.width,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: media.height * 0.25,
                          decoration: BoxDecoration(
                            color: Color(0xffE08010),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Main Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20
                      ),),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                              Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context){
                                        return AllItem(category: 'Insurance',);
                                      })
                                      );
                                    },
                                    child: Card(
                                      elevation: 5,
                                      child: Container(
                                        child: Image(image: AssetImage('assets/images/sheild.png')),
                                        width: 60,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3)
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Insurance',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                  ),)
                                ],
                              ),
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context){
                                          return AllItem(category: 'Education',);
                                        })
                                    );
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      child: Image(image: AssetImage('assets/images/school.png')),
                                      width: 60,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Education',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),)
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context){
                                          return AllItem(category: 'Cosmetics',);
                                        })
                                    );
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      child: Image(image: AssetImage('assets/images/cosmetics.png')),
                                      width: 60,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Cosmetics',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),)
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context){
                                          return AllItem(category: 'Travel',);
                                        })
                                    );
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      child: Image(image: AssetImage('assets/images/plane.png')),
                                      width: 60,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Travel',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context){
                                          return AllItem(category: 'Disease Research',);
                                        })
                                    );
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      child: Image(image: AssetImage('assets/images/bacteria.png')),
                                      width: 60,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('Disease',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text('Research',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
//                            SizedBox(
//                              width: 20,
//                            ),
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context){
                                          return AllItem(category: 'Current Affairs',);
                                        })
                                    );
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      child: Image(image: AssetImage('assets/images/megaphone.png')),
                                      width: 60,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('Current',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Affairs',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),),
                                  ],
                                )
                              ],
                            ),
//                            SizedBox(
//                              width: 20,
//                            ),
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context){
                                          return AllItem(category: 'Health Care',);
                                        })
                                    );

                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      child: Image(image: AssetImage('assets/images/heartbeat.png')),
                                      width: 60,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('Health',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Care',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: FlatButton(
                            onPressed: (){
                              Navigator.pushNamed(context, Blog.id);
                            },
                            child: Text('Daily Blogs',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}

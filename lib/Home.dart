import 'dart:io';

import 'package:elearn/AllItem.dart';
import 'package:elearn/Blog.dart';
import 'package:elearn/CoinsScreen.dart';
import 'package:elearn/Constant.dart';
import 'package:elearn/Description.dart';
import 'package:elearn/Dialog.dart';
import 'package:elearn/InviteFriends.dart';
import 'package:elearn/NewBlog.dart';
import 'package:elearn/Profile.dart';
import 'package:elearn/UserRegAndLogin/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Home extends StatefulWidget {

  static const id = 'Home';
  final username;
  final email;
  final coins;
  final uid;
  final url;
  final blogs;

  Home({this.username,this.email,this.coins,this.uid,this.url,this.blogs});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );


  BannerAd myBanner = BannerAd(
    adUnitId: "ca-app-pub-7843103597413736/3971013643",
    size: AdSize.smartBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );



  InterstitialAd myInterstitial = InterstitialAd(
    adUnitId: "ca-app-pub-7843103597413736/9794185963",
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );
  BannerAd centerBanner = BannerAd(
    adUnitId: "ca-app-pub-7843103597413736/8977403097",
    size: AdSize.mediumRectangle,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );


  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-7843103597413736~7341135211");
    myBanner
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );
//    centerBanner
//    ..load()
//    ..show(
//      anchorOffset: 40.0,
//      anchorType: AnchorType.top,
//      horizontalCenterOffset: 10.0,
//    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    myBanner.dispose();
    myInterstitial.dispose();
  }
  @override
  Widget build(BuildContext context) {

    File _image;
    Size media = MediaQuery.of(context).size;

    Future<bool> _onBackPressed(){
      return showDialog(context: context,
      builder: (context){
        return exit(context);
      });
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
                              showModalBottomSheet(context: context,
                                  isDismissible: false,
                                  builder: (context){
                                return Container(
                                  child: Wrap(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(right: 10,
                                                top: 10),
                                            child: GestureDetector(
                                              child: Text('Cancel',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xffFB5858),
                                                  fontSize: 18
                                                ),),
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                          ),
                                          height: 70,
                                          width: 70,
                                          child: widget.url == ""
                                              ? ClipOval(
                                                child: Image.asset('assets/images/download.jpg',
                                            fit: BoxFit.fill,),
                                              )
                                              : ClipOval(child: Image.network(widget.url,fit: BoxFit.fill,)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Text(widget.username,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w800,
                                              color: mainColor
                                          ),),
                                      ),
//                                    SizedBox(
//                                      height: 20,
//                                    ),
                                      Column(
                                        children: <Widget>[
                                          ListTile(
                                            title: Text('Home',
                                            style: TextStyle(
                                              color: mainColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                            ),),
                                            leading: FaIcon(FontAwesomeIcons.home,
                                            color: mainColor,),
                                            dense: true,
                                            onTap: (){

                                            },
                                            selected: true,
                                          ),
                                          ListTile(
                                            title: Text('Profile',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            leading: Icon(Icons.settings,
                                            color: Colors.black,),
                                            dense: true,
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(
                                                builder: (context){
                                                  return Profile(username: widget.username,email: widget.email,uid: widget.uid,url: widget.url,);
                                                }
                                              ));
                                            },
                                          ),
                                          ListTile(
                                            title: Text('Blogs',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            leading: FaIcon(FontAwesomeIcons.pen,
                                              color: Colors.black,),
                                            dense: true,
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(
                                                  builder: (context){
                                                    return Blog(uid: widget.uid,username: widget.username,blogs: widget.blogs,);
                                                  }));
                                            },
                                          ),
                                          ListTile(
                                            title: Text('Invite Friends',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            leading: FaIcon(FontAwesomeIcons.handsHelping,
                                              color: Colors.black),
                                            dense: true,
                                            onTap: (){
                                              Navigator.pushNamed(context, InviteFriends.id);
                                            },
                                          ),
                                          ListTile(
                                            title: Text('Logout',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            leading: FaIcon(FontAwesomeIcons.powerOff,
                                              color: Colors.black,),
                                            dense: true,
                                            onTap: (){
                                              _firebaseAuth.signOut();
                                              Navigator.popAndPushNamed(context, Login.id);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
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
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, CoinsScreen.id);
                            },
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
                                  Text(widget.coins.toString(),
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
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
                                        myInterstitial
                                          ..load()
                                          ..show(
                                            anchorType: AnchorType.bottom,
                                            anchorOffset: 0.0,
                                            horizontalCenterOffset: 0.0,
                                          );
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
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.18))
                                            ]
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
                                      myInterstitial
                                        ..load()
                                        ..show(
                                          anchorType: AnchorType.bottom,
                                          anchorOffset: 0.0,
                                        );
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context){
                                            return AllItem(category: 'Finance',);
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
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.18))
                                            ]
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Finance',
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
                                      myInterstitial
                                        ..load()
                                        ..show(
                                          anchorType: AnchorType.bottom,
                                          anchorOffset: 0.0,
                                        );
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context){
                                            return AllItem(category: 'Health',);
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
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.18))
                                            ]
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Health',
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
                                      myInterstitial
                                        ..load()
                                        ..show(
                                          anchorType: AnchorType.bottom,
                                          anchorOffset: 0.0,
                                        );
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
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.18))
                                            ]
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
                                      myInterstitial
                                        ..load()
                                        ..show(
                                          anchorType: AnchorType.bottom,
                                          anchorOffset: 0.0,
                                        );
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context){
                                            return AllItem(category: 'Beauty & Fitness');
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
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.18))
                                            ]
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text('Beauty &',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text('Fitness',
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
                                      myInterstitial
                                        ..load()
                                        ..show(
                                          anchorType: AnchorType.bottom,
                                          anchorOffset: 0.0,
                                        );
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context){
                                            return AllItem(category: 'Home & Gardens',);
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
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.18))
                                            ]
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text('Home &',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15
                                        ),),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Gardens',
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
                                      myInterstitial
                                        ..load()
                                        ..show(
                                          anchorType: AnchorType.bottom,
                                          anchorOffset: 0.0,
                                        );
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context){
                                            return AllItem(category: 'Real State',);
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
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.18))
                                            ]
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Real State',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),),

                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}

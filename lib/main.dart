import 'package:elearn/AdminPanel/AddArticle.dart';
import 'package:elearn/AdminPanel/AdminBlogList.dart';
import 'package:elearn/AdminPanel/AdminHome.dart';
import 'package:elearn/AdminPanel/Articles.dart';
import 'package:elearn/AdminPanel/CoinsArea.dart';
import 'package:elearn/AdminPanel/Users.dart';
import 'package:elearn/AllItem.dart';
import 'package:elearn/Blog.dart';
import 'package:elearn/BlogView.dart';
import 'package:elearn/Description.dart';
import 'package:elearn/Description2.dart';
import 'package:elearn/InviteFriends.dart';
import 'package:elearn/CoinsScreen.dart';
import 'package:elearn/NewBlog.dart';
import 'package:elearn/Profile.dart';
import 'package:elearn/SplashScreen.dart';
import 'package:elearn/UserRegAndLogin/ForgetPassword.dart';
import 'package:elearn/UserRegAndLogin/Login.dart';
import 'package:elearn/UserRegAndLogin/Registration.dart';
import 'package:flutter/material.dart';
import 'package:elearn/Home.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
      MyApp());
//    DevicePreview(
//    builder: (context) => MyApp(),
//  ));

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

//      locale: DevicePreview.of(context).locale, // <--- Add the locale
//      builder: DevicePreview.appBuilder,

      initialRoute: Articles.id,
      routes: {
        SplashScreen.id:(context) => SplashScreen(),
        Login.id:(context) =>Login(),
        Registration.id:(context) =>Registration(),
        Home.id:(context) => Home(),
        Descriptionpart2.id:(context) => Descriptionpart2(),
        InviteFriends.id:(context) => InviteFriends(),
        CoinsScreen.id:(context) => CoinsScreen(),
        Profile.id:(context) => Profile(),
        ForgetPassword.id:(context) => ForgetPassword(),
        AdminHome.id : (context) => AdminHome(),
        AddArticle.id : (context) => AddArticle(),
        NewBlog.id: (context) => NewBlog(),
        Blog.id :(context) => Blog(),
        Description.id: (context) => Description(),
        AllItem.id: (context) => AllItem(),
        BlogView.id: (context) => BlogView(),
        AdminBlogList.id: (context) => AdminBlogList(),
        CoinsArea.id: (context) => CoinsArea(),
        Users.id: (context) => Users(),
        Articles.id: (context) => Articles()

      },
    );
  }
}

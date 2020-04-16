import 'package:elearn/Constant.dart';
import 'package:elearn/Item/InfoContainer.dart';
import 'package:flutter/material.dart';

class Articles extends StatefulWidget {

  static const id = 'Articles';
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8, 
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            centerTitle: true,
            title: Text('Articles',
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            leading: IconButton(
                icon: Icon(Icons.arrow_back,
                color: whiteColor,),
                onPressed: (){
                  Navigator.pop(context);
                }),
            bottom: TabBar(
                tabs:
              [
              Text('All',
              style: TextStyle(
                color: mainColor,
                fontSize: 5,
                //fontWeight: FontWeight.bold
              ),),
              Text('Insurance',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 5,
                  //  fontWeight: FontWeight.bold
                ),),
              Text('Education',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 5,
                    //fontWeight: FontWeight.bold
                ),),
              Text('Cosmetics',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 5,
                 //   fontWeight: FontWeight.bold
                ),),
              Text('Travel',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 5,
                   // fontWeight: FontWeight.bold
                ),),
              Text('Disease Research',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 5,
                   // fontWeight: FontWeight.bold
                ),),
              Text('Current Affairs',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 5,
                   // fontWeight: FontWeight.bold
                ),),
              Text('Health Care',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 5,
                  //  fontWeight: FontWeight.bold
                ),),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                    InfoContainer(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

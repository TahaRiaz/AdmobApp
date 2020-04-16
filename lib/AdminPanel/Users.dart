import 'package:elearn/Constant.dart';
import 'package:elearn/Item/UserContainer2.dart';
import 'package:flutter/material.dart';


class Users extends StatefulWidget {
  
  static const id = 'Users';
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('Users',
        style: TextStyle(
          color: whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        leading: IconButton(icon: Icon(Icons.arrow_back,
        color: whiteColor,),
            onPressed: (){
          Navigator.pop(context);
            }),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                UserContainer2(),
                UserContainer2(),
                UserContainer2(),
                UserContainer2(),
                UserContainer2(),
                UserContainer2(),
                UserContainer2(),
                UserContainer2(),


              ],
            ),),
          )
        ],
      ),
    );
  }
}

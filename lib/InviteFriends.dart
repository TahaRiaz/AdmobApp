import 'package:elearn/Constant.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class InviteFriends extends StatefulWidget {

  static const id = 'InviteFriends';
  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: Text('Invite Friends',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1,
          fontSize: 20
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
          color: Colors.white),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Center(child: Image(image: AssetImage('assets/images/boy.png'))),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text('Refer a Friend',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffF4624D),
                    fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(child: Image.asset('assets/images/text.png')),
                Center(child: Image.asset('assets/images/rec.png')),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF4624D),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: FlatButton(
                      onPressed: ( ){
                        Share.share('Binate Forum');
                      },
                      child: Text('INVITE NOW',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1
                      ),)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

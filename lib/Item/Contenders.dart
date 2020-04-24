import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Contenders extends StatefulWidget {

  final username;
  final blogs;
  final coins;
  final url;
  final docId;

  Contenders({this.url,this.username,this.coins,this.blogs,this.docId});

  @override
  _ContendersState createState() => _ContendersState();
}

class _ContendersState extends State<Contenders> {

  NetworkImage _image;
  Firestore _firestore = Firestore.instance;
  int blog;

  Future test(String uid){
    Stream<QuerySnapshot> snapshot =  _firestore
        .collection('Users')
        .document('$uid').collection('MyBlogs').snapshots();
    return snapshot.length;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08)
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
              ),
              height: 60,
              width: 60,
              child: _image == null
                  ? Center(child: Image.asset('assets/images/download.jpg',
                fit: BoxFit.fill,))
                  : Image.network(widget.url,fit: BoxFit.fill,),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.username,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),
                      GestureDetector(
                        onTap: (){
                          showDialog(context: context,
                          builder: (context){
                            return AwardDialog(coins: widget.coins,uid: widget.docId,);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xffFDEEB6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                FaIcon(FontAwesomeIcons.coins,
                                color: Color(0xffC19B0F)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Award',
                                style: TextStyle(
                                  color: Color(0xffC19B0F),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.pen),
                      SizedBox(
                        width: 3,
                      ),
                      Text('${widget.blogs} Blogs',
                        style: TextStyle(
                            fontSize: 18
                        ),),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

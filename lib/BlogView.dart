import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Constant.dart';
import 'package:flutter/material.dart';

class BlogView extends StatefulWidget {

  static const id = 'BlogView';

  final String url;
  final String title;
  final String writer;
 // final Timestamp date;
  final String description;
  final String label;

  BlogView({this.url,this.writer,this.description,this.title,this.label});
  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(widget.title,
        style: TextStyle(
          color: Colors.white
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
          color: whiteColor),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(widget.url),fit: BoxFit.fill)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffC4C4C4)),
                        borderRadius: BorderRadius.circular(3)),
                    child: Row(
                      children: <Widget>[
                        Text('Title: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                          ),),
                        Text(widget.title,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900
                          ),),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffC4C4C4)),
                            borderRadius: BorderRadius.circular(3)
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(widget.label,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),),
                            SizedBox(
                              width: 5,
                            ),
                            Text(widget.writer,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
//                      Text(widget.date.toString(),
//                      style: TextStyle(
//                        fontSize: 15,
//                        fontWeight: FontWeight.bold
//                      ),)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xffC4C4C4))
                    ),
                    child: Text(widget.description,
                    style: TextStyle(
                      fontSize: 20
                    ),),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

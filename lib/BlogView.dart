import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlogView extends StatefulWidget {

  static const id = 'BlogView';

  final String url;
  final String title;
  final String writer;
 // final Timestamp date;
  final String description;

  BlogView({this.url,this.writer,this.description,this.title});
  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title,
        style: TextStyle(
          color: Colors.white
        ),),
        leading: Icon(Icons.arrow_back_ios),
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
                  child: Image.network(widget.url,fit: BoxFit.fill,),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
//                            Container(
//                              height: 50,
//                              width: 50,
//                              decoration: BoxDecoration(
//                                shape: BoxShape.circle,
//                                image: DecorationImage(image: AssetImage('assets/images/img.png'))
//                              ),
//                            ),
                            SizedBox(
                              width: 10,
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
//                      Text(widget.date.toString(),
//                      style: TextStyle(
//                        fontSize: 15,
//                        fontWeight: FontWeight.bold
//                      ),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                  ),),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(widget.description,
                  style: TextStyle(
                    fontSize: 17
                  ),),
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

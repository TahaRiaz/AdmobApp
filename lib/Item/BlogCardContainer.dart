import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/BlogView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BlogCardContainer extends StatefulWidget {

  final String url;
  final String title;
  final String writer;
//  final Timestamp date;
  final String description;

  BlogCardContainer({this.url,this.writer,this.description,this.title});
  @override
  _BlogCardContainerState createState() => _BlogCardContainerState();
}

class _BlogCardContainerState extends State<BlogCardContainer> {
  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;
    var now = DateTime.now();

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return BlogView(url: widget.url,
                    title: widget.title,
                    writer: widget.writer,
                    description: widget.description);
              }
            ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Container(
              height: 120,
              width: media.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.08)
                  )
                ]
              ),
              child:Row(
                children: <Widget>[
                  Container(
                    height: media.height * 0.20,
                    width: 100,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: Image.network(widget.url,fit: BoxFit.fill)
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.description,
                            style: TextStyle(
                              fontSize: 15,
                            ),),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(child: Row(
                                children: <Widget>[
                                  Text('Written By: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text(widget.writer),
                                ],
                              ),
                              ),
                                Text(DateFormat('dd-MM-yyy').format(now))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                    ],
                  ),
            ),
          ),
        ),
      ],
    );
  }
}






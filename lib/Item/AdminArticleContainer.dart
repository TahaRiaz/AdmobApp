import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/AdminPanel/AddArticle.dart';
import 'package:elearn/AdminPanel/ArticleEditScreen.dart';
import 'package:elearn/BlogView.dart';
import 'package:elearn/Dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constant.dart';


class AdminArticleContainer extends StatefulWidget {

  final String title;
  final String description;
  final String url;
  final String category;
  final String date;
  final String summary;
  final String docId;

  AdminArticleContainer({this.title,this.description,this.url,this.category,this.date,this.summary,this.docId});

  @override
  _AdminArticleContainerState createState() => _AdminArticleContainerState();
}

class _AdminArticleContainerState extends State<AdminArticleContainer> {

  Firestore _firestore = Firestore.instance;
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
                      description: widget.description,
                      label: 'Category: ',
                      writer: widget.category,);
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
                    height: 120,
                      width: 100,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Image.network(widget.url,
                        fit: BoxFit.fill,)
                    //Image.network(widget.url,fit: BoxFit.fill)
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(context: context,
                                        builder: (context){
                                      return Container(
                                        child: Wrap(
                                          children: <Widget>[
                                            ListTile(
                                              title: Center(
                                                child: GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder: (context){
                                                          return ArticleEditScreen(title: widget.title,description: widget.description,imageUrl: widget.url,summary: widget.summary,category: widget.category,docId: widget.docId,);
                                                        }));
                                                  },
                                                  child: Text('Edit Article',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: Colors.black,
                                            ),
                                            ListTile(
                                              title: Center(
                                                child: GestureDetector(
                                                  onTap: (){
                                                    _firestore.collection(widget.category).document(widget.docId).delete();
                                                    _firestore.collection('All').document(widget.title).delete();
//                                                    showDialog(context: context,
//                                                    builder: (context){
//                                                      return dialog(collection: widget.category,docId: widget.docId,context: context);
//                                                    });
                                                  },
                                                  child: Text('Delete Post',
                                                    style: TextStyle(
                                                        color: Color(0xffEB5757),
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                        });
                                  },
                                  child: Container(
                                    width: 50,
                                      child: Image.asset('assets/images/option.png'))),
                            ],
                          ),
                          Text(widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                          Text(widget.summary,
                            style: TextStyle(
                              fontSize: 14,
                            ),),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(widget.category,
                                style: TextStyle(
                                    color: mainColor
                                ),),
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






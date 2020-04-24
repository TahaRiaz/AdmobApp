import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/AdminPanel/AddArticle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../BlogView.dart';
import '../Constant.dart';
import '../Dialog.dart';
import '../EditBlog.dart';


class MyBlogPostContainer extends StatefulWidget {

  final String url;
  final String title;
  final String writer;
  final String date;
  final String description;
  final String summary;
  final docId;
  final uid;

  MyBlogPostContainer({this.url,this.writer,this.description,this.title,this.date,this.summary,this.docId,this.uid});
  @override
  _MyBlogPostContainerState createState() => _MyBlogPostContainerState();
}

class _MyBlogPostContainerState extends State<MyBlogPostContainer> {

  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;
    var now = DateTime.parse(widget.date);

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return BlogView(url: widget.url,
                    title: widget.title,
                    writer: widget.writer,
                    description: widget.description,
                    label: 'Written By: ',);
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
                      child: Image.network(widget.url,fit: BoxFit.fill)
                    //Image.network(widget.url,fit: BoxFit.fill)
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
                                                              return EditBlog(title: widget.title,description: widget.description,imageUrl: widget.url,summary: widget.summary,docId: widget.docId,writer: widget.writer,uid: widget.uid,);
                                                            }));
                                                      },
                                                      child: Text('Edit Blog',
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
                                                        _firestore.collection('Users').document(widget.uid).collection('MyBlogs').document(widget.docId).delete();
                                                        _firestore.collection('Blogs').document(widget.title).delete();

//                                                        showDialog(context: context,
//                                                            builder: (context){
//                                                              return dialog();
//                                                            });
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
                                      width: 40,
                                      child: Image.asset('assets/images/option.png'))),
                            ],
                          ),
                          Text(widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.summary,
                            style: TextStyle(
                              fontSize: 15,
                            ),),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(widget.writer,
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






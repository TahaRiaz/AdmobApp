import 'package:elearn/Dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constant.dart';


class AdminBlogContainer extends StatefulWidget {

  @override
  _AdminBlogContainerState createState() => _AdminBlogContainerState();
}

class _AdminBlogContainerState extends State<AdminBlogContainer> {
  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;
    var now = DateTime.now();

    return GestureDetector(
      onTap: (){
//            Navigator.push(context, MaterialPageRoute(
//                builder: (context){
//                    return BlogView(url: widget.url,
//                        title: widget.title,
//                        description: widget.description);
//                }
//            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
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
                  child: Image.asset('assets/images/pic.png',
                  fit: BoxFit.fill)
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
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context){
                                        return Container(
                                          child: Wrap(
                                            children: <Widget>[
                                              ListTile(
                                                title: Center(
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      showDialog(
                                                        context: context,
                                                      builder: (context){
                                                          return dialog();
                                                      });
                                                    },
                                                    child: Text('Delete Post',
                                              style: TextStyle(
                                                    color: Color(0xffEB5757)
                                              ),),
                                                  ),
                                                ),)
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Image.asset('assets/images/option.png')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Title',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Description',
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
                              Text('Innova8ors'),
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
    );
  }
}







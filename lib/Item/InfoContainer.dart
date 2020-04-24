import 'package:elearn/BlogView.dart';
import 'package:elearn/Description.dart';
import 'package:flutter/material.dart';
import 'package:elearn/Constant.dart';
import 'package:intl/intl.dart';

class InfoContainer extends StatefulWidget {

  final String title;
  final String description;
  final String url;
  final String category;
  final String date;
  final String summary;

  InfoContainer({this.title,this.description,this.url,this.category,this.date,this.summary});
  @override
  _InfoContainerState createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
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
                    height: media.height * 0.20,
                    width: 100,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child:
                    Image.network(widget.url,fit: BoxFit.fill)
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
                        Text(
                          widget.title,
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






import 'package:elearn/Description2.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {

  static const id = 'Description';

  final String title;
  final String description;
  final String url;

  Description({this.title,this.description,this.url});

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4FA2D2),
        centerTitle: true,
        title: Text(widget.title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white
        ),),
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30,left: 20),
                  child: Text(widget.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900
                  ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.network(widget.url,fit: BoxFit.fill,),
                  )
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(widget.description,
                  style: TextStyle(
                    fontSize: 17
                  ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
//                Center(
//                  child: Container(
//                    width: 100,
//                    height: 40,
//                    decoration: BoxDecoration(
//                      color: Color(0xff4FA2D2),
//                      borderRadius: BorderRadius.circular(5)
//                    ),
//                    child: FlatButton(
//                        onPressed: (){
//                          Navigator.pushNamed(context, Descriptionpart2.id);
//                        },
//                        child: Text('Next',
//                        style: TextStyle(
//                          fontSize: 20,
//                          color: Colors.white
//                        ),
//                        ),
//                    ),
//                  ),
//                ),
//                SizedBox(
//                  height: 20,
//                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

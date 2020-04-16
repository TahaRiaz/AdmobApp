import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Item/BlogCardContainer.dart';
import 'package:elearn/Home.dart';
import 'package:elearn/NewBlog.dart';
import 'package:flutter/material.dart';


enum Buttons {
  all,
  my
}

class Blog extends StatefulWidget {

  static const id = 'Blog';
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {

  var state = Buttons.all;
  Firestore _firestore = Firestore.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Blogs',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
        leading: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Home.id);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, NewBlog.id);
      },
      child: Icon(Icons.add),),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          state = Buttons.all;

                        });
                      },
                      child: Container(
                        height: 35,
                        width: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                          color: state == Buttons.all? Color(0xff4FA2D2): Colors.white,
                          border: Border.all(color: Color(0xff4FA2D2))
                        ),
                        child: Center(
                          child: Text('All Posts',
                          style: TextStyle(
                            fontSize: 17,
                            color: state == Buttons.all? Colors.white : Color(0xff4FA2D2),
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          state = Buttons.my;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 115,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50)),
                          color: state == Buttons.my? Color(0xff4FA2D2): Colors.white,
                          border: Border.all(color: Color(0xff4FA2D2),width: 2)
                        ),
                        child: Center(
                          child: Text('My Posts',
                            style: TextStyle(
                              fontSize: 17,
                              color: state == Buttons.my? Colors.white : Color(0xff4FA2D2),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('Blogs').snapshots(),
                    builder: (context,snapshot){
                      if(!snapshot.hasData){
                        return Text('No Blogs Availabel Right Now');
                      }
                      final blog = snapshot.data.documents;
                      List<BlogCardContainer> list = [];
                      BlogCardContainer container;

                      for(var bg in blog){
                        final url = bg.data['image'];
                        final title = bg.data['title'];
                        final writer = bg.data['writer'];
                        final description = bg.data['description'];
//                        final date = bg.data['date'];

                        container = BlogCardContainer(url: url,title: title,writer: writer,description: description);
                        list.add(container);
                      }
                      return Column(
                        children: list,
                      );
                    }
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

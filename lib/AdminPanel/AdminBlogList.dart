import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Constant.dart';
import 'package:elearn/Item/AdminBlogContainer.dart';
import 'package:flutter/material.dart';


class AdminBlogList extends StatefulWidget {

  static const id = 'AdminBlogList';
  @override
  _AdminBlogListState createState() => _AdminBlogListState();
}

class _AdminBlogListState extends State<AdminBlogList> {

  Firestore _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('Blogs',
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
        leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: whiteColor),
            onPressed: (){
              Navigator.pop(context);
            })
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('Blogs').snapshots(),
                      builder: (context,snapshot){
                        if(!snapshot.hasData){
                          return Center(child: Text('No Blogs Found'));
                        }
                        final blog = snapshot.data.documents;
                        List<AdminBlogContainer> list = [];
                        AdminBlogContainer container;

                        for(var bg in blog){

                          final url = bg.data['image'];
                          final title = bg.data['title'];
                          final writer = bg.data['writer'];
                          final description = bg.data['description'];
                          final summary = bg.data['summary'];
                          final date = bg.data['date'];
                          final docId = bg.documentID;

                          container = AdminBlogContainer(url: url,title: title,writer: writer,description: description,summary: summary,date: date,docId: docId,);
                          list.add(container);
                        }
                        return Column(
                          children: list,
                        );

                      }),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

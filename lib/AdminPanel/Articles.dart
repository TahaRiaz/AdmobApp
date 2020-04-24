import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/AdminPanel/AddArticle.dart';
import 'package:elearn/Constant.dart';
import 'package:elearn/Item/AdminArticleContainer.dart';
import 'package:elearn/Item/InfoContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Articles extends StatefulWidget {

  static const id = 'Articles';
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {


  Firestore _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8, 
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return AddArticle(heading: 'New Article');
                    }));
              },
          child: Icon(Icons.add,
          color: whiteColor,),),
          appBar: AppBar(
            backgroundColor: mainColor,
            centerTitle: true,
            title: Text('Articles',
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            leading: IconButton(
                icon: Icon(Icons.arrow_back,
                color: whiteColor,),
                onPressed: (){
                  Navigator.pop(context);
                }),
            bottom: PreferredSize(
              child: TabBar(
                labelColor: whiteColor,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),
                isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  tabs:
                [
                Text('All'),
                Text('Insurance'),
                Text('Health'),
                Text('Finance'),
                Text('Travel'),
                Text('Beauty & Fitness'),
                Text('Home & Gardens'),
                Text('Real Estate'),
              ]),
              preferredSize: Size.fromHeight(30.0),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('All').snapshots(),
                        builder: (context,snapshot){
                          if(!snapshot.hasData){
                            return Center(child: Text('No Articles Found'));
                          }
                          final article = snapshot.data.documents;
                          List<AdminArticleContainer> list = [];
                          AdminArticleContainer container;

                          for(var arr in article){

                            final title = arr.data['title'];
                            final description = arr.data['description'];
                            final url = arr.data['image'];
                            final date = arr.data['date'];
                            final summary = arr.data['summary'];
                            final category = arr.data['category'];
                            final docId = arr.documentID;

                            container = AdminArticleContainer(title: title,description: description,url: url,summary: summary,date: date,category: category,docId: docId,);
                            list.add(container);
                          }
                          return Column(
                            children: list,
                          );

                        }),

                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('Insurance').snapshots(),
                        builder: (context,snapshot){
                          if(!snapshot.hasData){
                            return Center(child: Text('No Articles Found'));
                          }
                          final article = snapshot.data.documents;
                          List<AdminArticleContainer> list = [];
                          AdminArticleContainer container;

                          for(var arr in article){

                            final title = arr.data['title'];
                            final description = arr.data['description'];
                            final url = arr.data['image'];
                            final date = arr.data['date'];
                            final summary = arr.data['summary'];
                            final category = arr.data['category'];
                            final docId = arr.documentID;

                            container = AdminArticleContainer(title: title,description: description,url: url,summary: summary,date: date,category: category,docId: docId,);
                            list.add(container);
                          }
                          return Column(
                            children: list,
                          );

                        }),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('Health').snapshots(),
                        builder: (context,snapshot){
                          if(!snapshot.hasData){
                            return Center(child: Text('No Articles Found'));
                          }
                          final article = snapshot.data.documents;
                          List<AdminArticleContainer> list = [];
                          AdminArticleContainer container;

                          for(var arr in article){

                            final title = arr.data['title'];
                            final description = arr.data['description'];
                            final url = arr.data['image'];
                            final date = arr.data['date'];
                            final summary = arr.data['summary'];
                            final category = arr.data['category'];
                            final docId = arr.documentID;

                            container = AdminArticleContainer(title: title,description: description,url: url,summary: summary,date: date,category: category,docId: docId,);
                            list.add(container);
                          }
                          return Column(
                            children: list,
                          );

                        }),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('Finance').snapshots(),
                        builder: (context,snapshot){
                          if(!snapshot.hasData){
                            return Center(child: Text('No Articles Found'));
                          }
                          final article = snapshot.data.documents;
                          List<AdminArticleContainer> list = [];
                          AdminArticleContainer container;

                          for(var arr in article){

                            final title = arr.data['title'];
                            final description = arr.data['description'];
                            final url = arr.data['image'];
                            final date = arr.data['date'];
                            final summary = arr.data['summary'];
                            final category = arr.data['category'];
                            final docId = arr.documentID;

                            container = AdminArticleContainer(title: title,description: description,url: url,summary: summary,date: date,category: category,docId: docId,);
                            list.add(container);
                          }
                          return Column(
                            children: list,
                          );

                        }),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('Travel').snapshots(),
                        builder: (context,snapshot){
                          if(!snapshot.hasData){
                            return Center(child: Text('No Articles Found'));
                          }
                          final article = snapshot.data.documents;
                          List<AdminArticleContainer> list = [];
                          AdminArticleContainer container;

                          for(var arr in article){

                            final title = arr.data['title'];
                            final description = arr.data['description'];
                            final url = arr.data['image'];
                            final date = arr.data['date'];
                            final summary = arr.data['summary'];
                            final category = arr.data['category'];
                            final docId = arr.documentID;

                            container = AdminArticleContainer(title: title,description: description,url: url,summary: summary,date: date,category: category,docId: docId,);
                            list.add(container);
                          }
                          return Column(
                            children: list,
                          );

                        }),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('Beauty & Fitness').snapshots(),
                        builder: (context,snapshot){
                          if(!snapshot.hasData){
                            return Center(child: Text('No Articles Found'));
                          }
                          final article = snapshot.data.documents;
                          List<AdminArticleContainer> list = [];
                          AdminArticleContainer container;

                          for(var arr in article){

                            final title = arr.data['title'];
                            final description = arr.data['description'];
                            final url = arr.data['image'];
                            final date = arr.data['date'];
                            final summary = arr.data['summary'];
                            final category = arr.data['category'];
                            final docId = arr.documentID;

                            container = AdminArticleContainer(title: title,description: description,url: url,summary: summary,date: date,category: category,docId: docId,);
                            list.add(container);
                          }
                          return Column(
                            children: list,
                          );

                        }),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('Home & Gardens').snapshots(),
                        builder: (context,snapshot){
                          if(!snapshot.hasData){
                            return Center(child: Text('No Articles Found'));
                          }
                          final article = snapshot.data.documents;
                          List<AdminArticleContainer> list = [];
                          AdminArticleContainer container;

                          for(var arr in article){

                            final title = arr.data['title'];
                            final description = arr.data['description'];
                            final url = arr.data['image'];
                            final date = arr.data['date'];
                            final summary = arr.data['summary'];
                            final category = arr.data['category'];
                            final docId = arr.documentID;

                            container = AdminArticleContainer(title: title,description: description,url: url,summary: summary,date: date,category: category,docId: docId,);
                            list.add(container);
                          }
                          return Column(
                            children: list,
                          );

                        }),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('Real State').snapshots(),
                        builder: (context,snapshot){
                          if(!snapshot.hasData){
                            return Center(child: Text('No Articles Found'));
                          }
                          final article = snapshot.data.documents;
                          List<AdminArticleContainer> list = [];
                          AdminArticleContainer container;

                          for(var arr in article){

                            final title = arr.data['title'];
                            final description = arr.data['description'];
                            final url = arr.data['image'];
                            final date = arr.data['date'];
                            final summary = arr.data['summary'];
                            final category = arr.data['category'];
                            final docId = arr.documentID;

                            container = AdminArticleContainer(title: title,description: description,url: url,summary: summary,date: date,category: category,docId: docId,);
                            list.add(container);
                          }
                          return Column(
                            children: list,
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

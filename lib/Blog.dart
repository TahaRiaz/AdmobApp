import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Constant.dart';
import 'package:elearn/Item/BlogCardContainer.dart';
import 'package:elearn/Home.dart';
import 'package:elearn/Item/MyBlogPostContainer.dart';
import 'package:elearn/NewBlog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';


class Blog extends StatefulWidget {

  static const id = 'Blog';
  final uid;
  final username;
  final blogs;

  Blog({this.uid,this.username,this.blogs});

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );


  BannerAd myBanner = BannerAd(
    adUnitId: "ca-app-pub-7843103597413736/3971013643",
    size: AdSize.smartBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );





  Firestore _firestore = Firestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-7843103597413736~7341135211");
    myBanner
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myBanner.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          title: Text('Blogs',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          bottom: PreferredSize(
              child: TabBar(
                labelColor: whiteColor,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                ),
                isScrollable: true,
                unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  Text('All Blogs'),
                  Text('My Blogs'),
                ],
              ), preferredSize: Size.fromHeight(30)),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return NewBlog(uid: widget.uid,username: widget.username,blogs: widget.blogs,);
              }));
        },
        child: Icon(Icons.add),),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
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
                          final summary = bg.data['summary'];
                          final date = bg.data['date'];
                          final docId = bg.documentID;

                          container = BlogCardContainer(url: url,title: title,writer: writer,description: description,summary: summary,date: date);
                          list.add(container);
                        }
                        return Column(
                          children: list,
                        );
                      }
                  )

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
                      stream: _firestore.collection('Users').document(widget.uid).collection('MyBlogs').snapshots(),
                      builder: (context,snapshot){
                        if(!snapshot.hasData){
                          return Text('No Blogs Availabel Right Now');
                        }
                        final blog = snapshot.data.documents;
                        List<MyBlogPostContainer> list = [];
                        MyBlogPostContainer container;

                        for(var bg in blog){
                          final url = bg.data['image'];
                          final title = bg.data['title'];
                          final writer = bg.data['writer'];
                          final description = bg.data['description'];
                          final summary = bg.data['summary'];
                          final date = bg.data['date'];
                          final docId = bg.documentID;

                          container = MyBlogPostContainer(url: url,title: title,writer: writer,description: description,summary: summary,date: date,docId:docId,uid: widget.uid,);
                          list.add(container);
                        }
                        return Column(
                          children: list,
                        );
                      }
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

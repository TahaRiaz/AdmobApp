import 'package:elearn/Constant.dart';
import 'package:elearn/Item/AdminBlogContainer.dart';
import 'package:flutter/material.dart';


class AdminBlogList extends StatefulWidget {

  static const id = 'AdminBlogList';
  @override
  _AdminBlogListState createState() => _AdminBlogListState();
}

class _AdminBlogListState extends State<AdminBlogList> {
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
        leading: Icon(Icons.arrow_back,
        color: whiteColor),
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
                  AdminBlogContainer(),
                  AdminBlogContainer(),
                  AdminBlogContainer(),
                  AdminBlogContainer(),
                  AdminBlogContainer(),
                  AdminBlogContainer(),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

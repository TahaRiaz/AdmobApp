import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Constant.dart';
import 'package:elearn/Item/InfoContainer.dart';
import 'package:flutter/material.dart';

class AllItem extends StatefulWidget {

  static const id = 'AllItem';
  final category;
  AllItem({this.category});
  @override
  _AllItemState createState() => _AllItemState();
}

class _AllItemState extends State<AllItem> {
  @override
  Widget build(BuildContext context) {

    Firestore _firestore = Firestore.instance;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.category,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('All Articles',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: mainColor
                  ),),
                ),
                SizedBox(
                  height: 20
                ),
                  StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('${widget.category}').snapshots(),
                      builder: (context,snapshot){
                        if(!snapshot.hasData){
                          return Center(child: Text('No Articles Found'));
                        }
                        final article = snapshot.data.documents;
                        List<InfoContainer> list = [];
                        InfoContainer container;

                        for(var arr in article){
                          final title = arr.data['title'];
                          final description = arr.data['description'];
                          final url = arr.data['image'];

                          container = InfoContainer(title: title,description: description,url: url,);
                          list.add(container);
                        }
                        return Column(
                          children: list,
                        );

                      }),
//                Column(
//                  children: card.IfCard(),
//                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

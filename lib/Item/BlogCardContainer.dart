import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/BlogView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_admob/firebase_admob.dart';

class BlogCardContainer extends StatefulWidget {

  final String url;
  final String title;
  final String writer;
  final String date;
  final String description;
  final String summary;

  BlogCardContainer({this.url,this.writer,this.description,this.title,this.date,this.summary});
  @override
  _BlogCardContainerState createState() => _BlogCardContainerState();
}

class _BlogCardContainerState extends State<BlogCardContainer> {

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );



  InterstitialAd myInterstitial = InterstitialAd(
    adUnitId: InterstitialAd.testAdUnitId,
    //  "ca-app-pub-7843103597413736/9794185963",
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAdMob.instance.initialize(
        appId: "ca-app-pub-7843103597413736~7341135211");
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();

    myInterstitial.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;
    var now = DateTime.parse(widget.date);

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            myInterstitial
              ..load()
              ..show(
                anchorType: AnchorType.bottom,
                anchorOffset: 0.0,
                horizontalCenterOffset: 0.0,
              );
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
                    height: media.height * 0.20,
                    width: 100,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: Image.network(widget.url,fit: BoxFit.fill)
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
                          Text(widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
//                          SizedBox(
//                            height: 10,
//                          ),
                          Text(widget.summary,
                            style: TextStyle(
                              fontSize: 15,
                            ),),
                          SizedBox(
                            height: 5,
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
                                  Text(widget.writer),
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
        ),
      ],
    );
  }
}






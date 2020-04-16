import 'package:elearn/Constant.dart';
import 'package:elearn/Item/Contenders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CoinsArea extends StatefulWidget {

  static const id = 'CoinsArea';
  @override
  _CoinsAreaState createState() => _CoinsAreaState();
}

class _CoinsAreaState extends State<CoinsArea> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            centerTitle: true,
            title: Text('Coins Area',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.pop(context);
                }),
            bottom: TabBar(
                tabs: [
                  Text('Daily',
                  style: TextStyle(
                    fontSize: 15
                  ),),
                  Text('Weekly',
                    style: TextStyle(
                        fontSize: 15
                    ),),
                  Text('Monthly',
                    style: TextStyle(
                        fontSize: 15
                    ),),
                  Text('Yearly',
                    style: TextStyle(
                        fontSize: 15
                    ),),
                ]),
          ),
          body: TabBarView(
              children: <Widget>[
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text('Top 5 Contributors',
                        style: TextStyle(
                          color: Color(0xffC19B0F),
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text('Top 5 Contributors',
                          style: TextStyle(
                              color: Color(0xffC19B0F),
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),),
                        SizedBox(
                          height: 20,
                        ),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text('Top 5 Contributors',
                          style: TextStyle(
                              color: Color(0xffC19B0F),
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),),
                        SizedBox(
                          height: 20,
                        ),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text('Top 5 Contributors',
                          style: TextStyle(
                              color: Color(0xffC19B0F),
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),),
                        SizedBox(
                          height: 20,
                        ),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                        Contenders(),
                      ],
                    ),
                  ),
                ),

              ]),
        ));
  }
}

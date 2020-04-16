import 'package:elearn/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elearn/Coins.dart';

class CoinsScreen extends StatefulWidget {

  static const id = 'CoinsScreen';
  @override
  _CoinsScreenState createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Earned Coins',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
        backgroundColor: mainColor,
        leading: GestureDetector(
            onTap: (){

            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Container(
                      height: 150,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.08)
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('120',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: 175,
                            height: 43,
                            decoration: BoxDecoration(
                              color: Color(0xffFBCA0C),
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5))
                            ),
                            child: Center(
                              child: Text('Points',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('History',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800
                  ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Coins(fname: 'Idrees',date: '03, April 2020',),
                Coins(fname: 'Idrees',date: '04, April, 2020',),
                Coins(fname: 'Idrees',date: '04, April, 2020',),
              ],
            ),
          )
        ],
      ),
    );
  }
}


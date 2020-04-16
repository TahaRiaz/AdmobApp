import 'package:flutter/material.dart';

class Coins extends StatelessWidget {
  final String fname;
  final String date;

  Coins({this.fname,this.date});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10,left: 10),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.08)
              ),
            ],
            borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 50,
              height: 90,
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      end: BorderSide(color: Colors.grey)
                  )
              ),
              child: Image.asset('assets/images/CCoin.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('40 Points Added!',
                    style: TextStyle(
                        color: Color(0xffFBCA0C),
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Your Friend',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(fname,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14

                            ),),
                          SizedBox(
                            width: 2,
                          ),
                          Text('just joined',
                            style: TextStyle(
                              fontSize: 14,
                            ),)
                        ],
                      ),
                      Text('using your invitation',
                        style: TextStyle(
                            fontSize: 14
                        ),)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 180),
                    child: Text(date,
                      style: TextStyle(
                          color: Colors.grey
                      ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

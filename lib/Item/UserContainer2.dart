import 'package:elearn/Dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserContainer2 extends StatefulWidget {
  @override
  _UserContainer2State createState() => _UserContainer2State();
}

class _UserContainer2State extends State<UserContainer2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08)
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/images/download.jpg'),
                    fit: BoxFit.cover,)
              ),
              height: 60,
              width: 60,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          showDialog(context: context,
                              builder: (context){
                                return dialog();
                              });
                        },
                        child: Image.asset('assets/images/option.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('User Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset('assets/images/coin1.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text('120')
                    ],
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

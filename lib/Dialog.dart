import 'package:elearn/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Dialog dialog(){
  return Dialog(
    child: Container(
      height: 150,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('Delete',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),),
          SizedBox(
            height: 10,
          ),
          Text('Are you sure you want to delete this post?',),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                hoverColor: mainColor,
                color: Colors.transparent,
                  elevation: 0.0,
                  onPressed: (){
                
              },
              child: Text('Yes',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17
              ),),),
              SizedBox(
                width: 5,
              ),
              RaisedButton(
                hoverColor: mainColor,
                color: Colors.transparent,
                elevation: 0.0,
                onPressed: (){

                },
                child: Text('No',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17
                  ),),),
            ],
          )
        ],
      ),
    ),
  );
}

class AwardDialog extends StatefulWidget {
  @override
  _AwardDialogState createState() => _AwardDialogState();
}

class _AwardDialogState extends State<AwardDialog> {

  String award = 'Award';
  Color color = Color(0xffFA9C10);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
      width: 300,
        height: 300,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/bigCoin.png'),
            SizedBox(
              height: 10,
            ),
            Text('Award Coins',
            style: TextStyle(
              fontSize: 17,
              fontWeight:
                FontWeight.bold,
              color: Color(0xffFA9C10)
            ),),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: ThemeData(
                primaryColor: Color(0xffFA9C10)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 20
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'coins'
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 60),
              color: color,
                onPressed: (){
                  setState(() {
                      color = Colors.grey.shade700;
                      award = 'Awarded';
                  });
                },
            child: Text(award,
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),),
            RaisedButton(
                color: Colors.transparent,
                elevation: 0.0,
                onPressed: (){
                  Navigator.pop(context);
            },
            child: Text('Leave',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18
            ),),)
          ],
        ),
      ),
    );
  }
}

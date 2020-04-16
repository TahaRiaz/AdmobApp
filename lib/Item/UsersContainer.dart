import 'package:flutter/material.dart';


class UsersContainer extends StatefulWidget {

  static const id = 'UsersContainer';
  @override
  _UsersContainerState createState() => _UsersContainerState();
}

class _UsersContainerState extends State<UsersContainer> {
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('User Name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(
                  height: 5,
                ),
                Text('New User Registration',
                style: TextStyle(
                  fontSize: 18
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

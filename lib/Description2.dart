import 'package:elearn/Description.dart';
import 'package:flutter/material.dart';

class Descriptionpart2 extends StatefulWidget {

  static const id = 'Description2';
  @override
  _Descriptionpart2State createState() => _Descriptionpart2State();
}

class _Descriptionpart2State extends State<Descriptionpart2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4FA2D2),
        centerTitle: true,
        title: Text('Insurance',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30,left: 20),
                  child: Text('CANCER PROTECTION',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image(
                      image: AssetImage('assets/images/Cancer.png')),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Cancer is one such critical illness that one wishes would never have. It not only causes emotional trauma and strains the entire family, but creates a potential of financial crisis as well. However, the number of cancer cases being reported is on the rise. According to a study by World Health Organization, cancer is the second leading cause of death globally and approximately 9.6 Million people died worldwide in the year 2018 due to this disease. It has also been recorded that around 70% of deaths occur in low and middle income countries.',
                    style: TextStyle(
                        fontSize: 17
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xff4FA2D2),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: FlatButton(
                      onPressed: (){

                      },
                      child: Text('Next',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                        Navigator.pushNamed(context, Description.id);
                    },
                    child: Text('Previous',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey
                    ),),
                  ),
                ),
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

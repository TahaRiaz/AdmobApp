
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Constant.dart';
import 'package:elearn/Dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {

  static const id ='Profile';
  final username;
  final email;
  final uid;
  final url;

  Profile({this.username,this.email,this.uid,this.url});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  File _image;
  String url;
  Firestore _firestore = Firestore.instance;
  final _usernameController = TextEditingController();


  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {

      _image = image;
      uploadImage();
    });
  }



  void uploadImage() async{

    final StorageReference uploadRef = FirebaseStorage.instance.ref().child('User Image');

    final StorageUploadTask uploadTask = uploadRef.child(DateTime.now().toString() + ".jpg").putFile(_image);

    var imageUrl = await(await uploadTask.onComplete).ref.getDownloadURL();

    url = imageUrl.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
          Navigator.pop(context);
        }),
        centerTitle: true,
        title: Text('Profile',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white
        ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                    ),
                    child: _image == null
                        ? ClipOval(child: Image.network(widget.url,fit: BoxFit.fill))
                        : ClipOval(child: Image.file(_image,fit: BoxFit.fill)),

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: getImage,
                  child: Text('Change Photo',
                  style: TextStyle(
                    fontSize: 14,
                    color: mainColor
                  ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        hintText: '${widget.username}'
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.08)
                          )
                        ],
                        borderRadius: BorderRadius.circular(3)
                    ),
                    child: Text(widget.email,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Builder(
                    builder:(context) => FlatButton(
                        onPressed: (){

                          String name = _usernameController.text;

                          if(_image == null){
                            url = widget.url;
                          }
                          if(_usernameController.text.isEmpty){
                            name = widget.username;
                          }
                            _firestore.collection('Users').
                            document('${widget.uid}').
                            updateData({
                              'username': name,
                              'image': url,
                            }).whenComplete((){
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('You will be able to see the change when you logIn again.'),
                                    duration: Duration(seconds: 5),
                                    behavior: SnackBarBehavior.fixed,
                                  ));
                            }).catchError((e){
                              setState(() {
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text(e.message),
                                      duration: Duration(seconds: 3),
                                      behavior: SnackBarBehavior.fixed,
                                    ));
                              });
                            });
                            
                        }, child: Text('Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

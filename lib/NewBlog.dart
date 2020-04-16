import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewBlog extends StatefulWidget {
  static const id ='NewBlog';
  @override
  _NewBlogState createState() => _NewBlogState();
}

class _NewBlogState extends State<NewBlog> {


  final _controllerTitle = TextEditingController();
  final _controllerWriter = TextEditingController();
  final _controllerDescription = TextEditingController();
  File _image;
  String url;
  Firestore _firestore = Firestore.instance;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      uploadImage();
    });
  }

  void uploadImage() async{

    final StorageReference uploadRef = FirebaseStorage.instance.ref().child('Post Image');

    final StorageUploadTask uploadTask = uploadRef.child(DateTime.now().toString() + ".jpg").putFile(_image);

    var imageUrl = await(await uploadTask.onComplete).ref.getDownloadURL();

    url = imageUrl.toString();
  }

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('New Blog',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white
        ),),
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: media.height * 0.4,
                    width: media.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff4FA2D2))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: getImage,
                            child: _image == null ? Image.asset('assets/images/Vector.png'):Image.file(_image,fit: BoxFit.fill,)),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _controllerTitle,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xff4FA2D2))
                      ),
                      hintText: 'Enter Title'
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _controllerWriter,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Color(0xff4FA2D2))
                        ),
                        hintText: 'Enter Writer'
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _controllerDescription,
                    minLines: 7,
                    maxLines: 20,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Color(0xff4FA2D2))
                        ),
                        hintText: 'Enter Description'
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff4FA2D2),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Builder(
                    builder:(context) => FlatButton(
                        onPressed: (){
                          _firestore.collection('Blogs').add({
                            'title':_controllerTitle.text,
                            'writer':_controllerWriter.text,
                            'description':_controllerDescription.text,
                            'date':DateTime.now().toString(),
                            'image':url
                          });
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Upload Succesful'),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.fixed,
                              ));
                        },
                        child: Text('Post',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),)),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

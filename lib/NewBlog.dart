import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/Constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewBlog extends StatefulWidget {
  static const id ='NewBlog';
  final uid;
  final username;
  final blogs;

  NewBlog({this.uid,this.username,this.blogs});
  @override
  _NewBlogState createState() => _NewBlogState();
}

class _NewBlogState extends State<NewBlog> {


  final _controllerTitle = TextEditingController();
  final _controllerWriter = TextEditingController();
  final _controllerDescription = TextEditingController();
  final _controllerSummary = TextEditingController();
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
        backgroundColor: mainColor,
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
                    child: GestureDetector(
                        onTap: getImage,
                        child: _image == null ?
                        Image.asset('assets/images/Vector.png')
                            :Image.file(_image,fit: BoxFit.fill,)),
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
                      labelText: 'Enter Title'
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    minLines: 1,
                    maxLines: 2,
                    maxLengthEnforced: true,
                    maxLength: 90,
                    controller: _controllerSummary,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Color(0xff4FA2D2))
                        ),
                        labelText: 'Write Summary'
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
                        labelText: 'Enter Description'
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Builder(
                  builder:(context) => RaisedButton(
                    color: mainColor,
                      onPressed: (){

                        if(_controllerSummary.text.isEmpty||_controllerTitle.text.isEmpty||_controllerDescription.text.isEmpty||_image == null){
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Please fill all the boxes'),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.fixed,
                              ));
                        }
                        else{
                          int num = widget.blogs + 1;
                          _firestore.collection('Users').document(widget.uid).updateData({
                            'blogs': num
                          });
                        _firestore.collection('Users').document(widget.uid).collection('MyBlogs').add({
                        'title':_controllerTitle.text,
                        'writer': widget.username,
                        'summary':_controllerSummary.text,
                        'description':_controllerDescription.text,
                        'date':DateTime.now().toString(),
                        'image':url
                        });

                        _firestore.collection('Blogs').document(_controllerTitle.text).setData({
                        'title':_controllerTitle.text,
                        'writer': widget.username,
                        'summary':_controllerSummary.text,
                        'description':_controllerDescription.text,
                        'date':DateTime.now().toString(),
                        'image':url
                        });
                        Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Upload Succesful'),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.fixed,
                        ));
                        }
                      },
                      child: Text('Post',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)),
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

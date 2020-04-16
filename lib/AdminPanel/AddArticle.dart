import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:elearn/Constant.dart';
import 'package:image_picker/image_picker.dart';

class AddArticle extends StatefulWidget {

  static const id = 'AddArticle';
  @override
  _AddArticleState createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {

  String _selectedValue = 'Insurance';
  File _image;
  String url;
  Firestore _firestore = Firestore.instance;
  final _controllerTitle = TextEditingController();
  final _controllerDescription = TextEditingController();

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

//  AssetImage images = AssetImage('assets/images/download.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                    Text('Select Category',
                    style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),

                    DropdownButton<String>(
                      value: _selectedValue,
                        items: [
                          DropdownMenuItem(child: Text('Insurance',),
                          value: 'Insurance',),
                          DropdownMenuItem(child: Text('Education'),
                            value: 'Education',),
                          DropdownMenuItem(child: Text('Cosmetics'),
                            value: 'Cosmetics',),
                          DropdownMenuItem(child: Text('Travel'),
                            value: 'Travel',),
                          DropdownMenuItem(child: Text('Disease Research'),
                            value: 'Disease Research',),
                          DropdownMenuItem(child: Text('Current Affairs'),
                            value: 'Current Affairs',),
                          DropdownMenuItem(child: Text('Health Care'),
                            value: 'Health Care',)
                        ],
                        onChanged: (value){
                          setState(() {
                            _selectedValue = value;
                          });
                        })
                    ],
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: mainColor,width: 2)
                      ),
                      child: GestureDetector(
                        onTap: getImage,
                        child: _image == null
                            ? Icon(Icons.add_a_photo)
                            : Image.file(_image,fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Title',
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _controllerTitle,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: mainColor)
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Description',
                    style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _controllerDescription,
                    minLines: 7,
                    maxLines: 20,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: mainColor)
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Builder(
                      builder:(context) => FlatButton(
                          onPressed: (){
                              _firestore.collection('$_selectedValue').add(
                                {
                                  'title': _controllerTitle.text,
                                  'description': _controllerDescription.text,
                                  'image': url
                                }
                              );
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Upload Succesful'),
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.fixed,
                                  ));

                          },
                          child: Text('Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),)),
                    ),
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

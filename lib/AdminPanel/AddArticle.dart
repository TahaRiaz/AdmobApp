import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:elearn/Constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddArticle extends StatefulWidget {

  static const id = 'AddArticle';

  final heading;

  AddArticle({@required this.heading});
  @override
  _AddArticleState createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {

  var _category = [
    'Insurance',
    'Travel',
    'Beauty & Fitness',
    'Finance',
    'Health',
    'Home & Gardens',
    'Real Estate',
  ];

  String _currentValue;
  File _image;
  String url;
  Firestore _firestore = Firestore.instance;
  final _controllerTitle = TextEditingController();
  final _controllerDescription = TextEditingController();
  final _controllerSummary = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(widget.heading,
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back,
            color: whiteColor,),
            onPressed: (){
          Navigator.pop(context);
        })
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                    DottedBorder(
                      dashPattern: [6,3],
                      strokeWidth: 2.0,
                      color: mainColor,
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: GestureDetector(
                            onTap: getImage,
                            child: _image == null
                                ? Center(child: FaIcon(FontAwesomeIcons.cloudUploadAlt,color: mainColor,))
                                : Image.file(_image,fit: BoxFit.fill,),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    controller: _controllerTitle,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: mainColor)
                        ),
                      labelText: 'Enter Title',
                      labelStyle: TextStyle(
                        fontSize: 18
                      )
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Theme(
                    data: ThemeData(
                        primaryColor: mainColor
                    ),
                    child: FormField(
                        builder: (FormFieldState<String> state){
                          return InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: 'Category',
                              labelStyle: TextStyle(
                                  color: mainColor
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: mainColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    isDense: true,
                                    value: _currentValue,
                                    items: _category.map((String value){
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,
                                          style: TextStyle(
                                              color: mainColor
                                          ),),
                                      );
                                    }).toList(),
                                    onChanged: (String newValue){
                                      setState(() {
                                        _currentValue = newValue;
                                        state.didChange(newValue);
                                      });
                                    })),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _controllerSummary,
                    minLines: 1,
                    maxLines: 2,
                    maxLength: 90,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: mainColor),
                        ),
                      labelText: 'Write Summary',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    controller: _controllerDescription,
                    minLines: 7,
                    maxLines: 20,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: mainColor)
                      ),
                      labelText: 'Write Description',
                      labelStyle: TextStyle(
                        fontSize: 18,
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
                              if(_controllerSummary.text.isEmpty||_controllerTitle.text.isEmpty||_controllerDescription.text.isEmpty||_currentValue == null|| _image == null){
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Please fill all the boxes'),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.fixed,
                                    ));
                              }
                              else{
                                _firestore.collection('$_currentValue').add(
                                    {
                                      'title': _controllerTitle.text,
                                      'description': _controllerDescription.text,
                                      'image': url,
                                      'summary': _controllerSummary.text,
                                      'category': _currentValue,
                                      'date': DateTime.now().toString(),
                                    }
                                );
                                _firestore.collection('All').document(_controllerTitle.text).setData(
                                    {
                                      'title': _controllerTitle.text,
                                      'description': _controllerDescription.text,
                                      'image': url,
                                      'summary': _controllerSummary.text,
                                      'category': _currentValue,
                                      'date': DateTime.now().toString(),
                                    }
                                );
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Upload Succesful'),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.fixed,
                                    ));

                              }

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
            ),
          )
        ],
      ),
    );
  }
}

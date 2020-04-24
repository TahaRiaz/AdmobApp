import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:elearn/Constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';


class ArticleEditScreen extends StatefulWidget {


  static const id = 'ArticleEditScreen';
  final imageUrl;
  final title;
  final summary;
  final category;
  final description;
  final docId;

  ArticleEditScreen({this.imageUrl,this.title,this.category,this.summary,this.description,this.docId});

  @override
  _ArticleEditScreenState createState() => _ArticleEditScreenState();
}

class _ArticleEditScreenState extends State<ArticleEditScreen> {

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
          title: Text('Edit Article',
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
                              ? Image.network(widget.imageUrl,fit: BoxFit.fill,)
                              : Image.file(_image,fit: BoxFit.fill,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                    child: Text(widget.title,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
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
                              labelText: '${widget.category}',
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
                      labelText: '${widget.summary}',
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
                      labelText: '${widget.description}',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Builder(
                      builder:(context) => RaisedButton(
                        color: mainColor,
                          onPressed: (){

                          String description = _controllerDescription.text;
                          String summary = _controllerSummary.text;
                          String category = _currentValue;
                             if(_controllerSummary.text.isEmpty){
                              summary = widget.summary;
                            }
                           if(_controllerDescription.text.isEmpty){
                              description = widget.description;
                            }
                           if(_currentValue == null){
                              category = widget.category;
                            }
                            if(_image == null){
                              url = widget.imageUrl;
                            }

                              _firestore.collection('$_currentValue').document(widget.docId).updateData(
                                  {
                                    'description': description,
                                    'image': url,
                                    'summary': summary,
                                    'category': category,
                                    'date': DateTime.now().toString(),
                                  }
                              ).then((result){
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Update Succesful'),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.fixed,
                                    ));
                              }).catchError((e){
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text(e.message),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.fixed,
                                    ));
                              });

                              _firestore.collection('All').document(widget.title).updateData(
                                  {
                                    'description': description,
                                    'image': url,
                                    'summary': summary,
                                    'category': category,
                                    'date': DateTime.now().toString(),
                                  }
                              ).then((result){
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Update Succesful'),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.fixed,
                                    ));
                              }).catchError((e){
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text(e.message),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.fixed,
                                    ));
                              });




                          },
                          child: Text('Update',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),)),
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

import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:elearn/Constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditBlog extends StatefulWidget {

  static const id = 'EditBlog';

  final imageUrl;
  final title;
  final summary;
  final description;
  final docId;
  final writer;
  final uid;

  EditBlog({this.imageUrl,this.title,this.summary,this.description,this.docId,this.writer,this.uid});

  @override
  _EditBlogState createState() => _EditBlogState();
}

class _EditBlogState extends State<EditBlog> {
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
          title: Text('Edit Blog',
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
                            print(summary);
                            if(_controllerSummary.text.isEmpty){

                              summary = widget.summary;
                              print(summary);
                            }
                            if(_controllerDescription.text.isEmpty){
                              description = widget.description;
                              print(description);
                            }
                            if(_image == null){
                              url = widget.imageUrl;
                            }
                                print(widget.uid);
                              _firestore.collection('Users').document(widget.uid).collection('MyBlogs').document(widget.docId).updateData(
                                  {

                                    'title': widget.title,
                                    'writer': widget.writer,
                                    'summary': summary,
                                    'description': description,
                                    'date':DateTime.now().toString(),
                                    'image':url
                                  }
                              ).whenComplete((){
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Successfull'),
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


                              _firestore.collection('Blogs').document(widget.title).updateData(
                                  {
                                    'title': widget.title,
                                    'writer': widget.writer,
                                    'summary': summary,
                                    'description': description,
                                    'date':DateTime.now().toString(),
                                    'image':url
                                  }
                              ).whenComplete((){
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Successfull'),
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

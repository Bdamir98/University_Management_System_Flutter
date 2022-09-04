import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class AddCourse extends StatefulWidget {
  AddCourse({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseFeeController = TextEditingController();

  XFile? _courseImage;
  String? _imageUrl;

  chooseImageFromGC() async {
    ImagePicker _picker = ImagePicker();
    _courseImage = await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  writeData() async {
    File _imageFile = File(_courseImage!.path);

    FirebaseStorage _storage = FirebaseStorage.instance;
    UploadTask _uploadTask =
        _storage.ref('cources').child(_courseImage!.name).putFile(_imageFile);

    TaskSnapshot snapshot = await _uploadTask;

    _imageUrl = await snapshot.ref.getDownloadURL();

    CollectionReference _course =
        FirebaseFirestore.instance.collection('cources');

    _course.add({
      'course_name': courseNameController.text,
      'course_fee': courseFeeController.text,
      'img': _imageUrl
    }).then((value) {
      courseNameController.text = '';
      courseFeeController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            )),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(children: [
            TextField(
              controller: courseNameController,
              decoration: InputDecoration(
                  hintText: 'Enter Course Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: courseFeeController,
              decoration: InputDecoration(
                  hintText: 'Enter Course Fee',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Center(
                  child: Container(
                      child: _courseImage == null
                          ? IconButton(
                              icon: Icon(Icons.photo),
                              onPressed: () {
                                chooseImageFromGC();
                              },
                            )
                          : Image.file(
                              File(_courseImage!.path),
                            ))),
            ),
            ElevatedButton(
                onPressed: () {
                  writeData();
                },
                child: Text('Add Course'))
          ]),
        ),
      ),
    );
  }
}

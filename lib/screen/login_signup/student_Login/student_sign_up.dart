import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_firebase/const.dart';
import 'package:my_firebase/custom_widget/text_controller.dart';
import 'package:my_firebase/custom_widget/text_field.dart';

import '../../../custom_widget/row_images.dart';

class StudentSignUp extends StatefulWidget {
  @override
  State<StudentSignUp> createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {
  XFile? _courseImage;
  String? _imageUrl;
  String placeHolderImage =
      'https://www.arabamerica.com/wp-content/themes/arabamerica/assets/img/thumbnail-default.jpg';

  chooseImageFromGC() async {
    ImagePicker _picker = ImagePicker();
    _courseImage = await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  StudentSignupFunction() async {
    File _imageFile = File(_courseImage!.path);

    FirebaseStorage _storage = FirebaseStorage.instance;
    UploadTask _uploadTask = _storage
        .ref('Student_Information')
        .child(_courseImage!.name)
        .putFile(_imageFile);

    TaskSnapshot snapshot = await _uploadTask;

    _imageUrl = await snapshot.ref.getDownloadURL();
    CollectionReference _course =
        FirebaseFirestore.instance.collection('Student_Information');
    _course.add({
      'Student_Id': TextController.studentId.text,
      'Student_Name': TextController.studentname.text,
      'Student_Session': TextController.studentSession.text,
      'Student_Email': TextController.studentemail.text,
      'Student_Number': TextController.studentmobile.text,
      'Student_Password': TextController.studentpassword.text,
      'Student_Picture': _imageUrl,
    }).then((value) {
      //TextController.studentId.text = '';
      //TextController.studentname.text = '';
      //TextController.studentSession.text = '';
      //TextController.studentemail.text = '';
      //TextController.studentmobile.text = '';
      //TextController.studentpassword.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ocolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Image.asset(
              'assets/Stamford.png',
              height: 100,
            ),
            Text(
              'Create an Account',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff0D202E),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hitext: 'Your Id',
              controllername: TextController.studentId,
            ),
            CustomTextField(
              hitext: 'Your Name',
              controllername: TextController.studentname,
            ),
            CustomTextField(
              hitext: 'Admission Session',
              controllername: TextController.studentSession,
            ),
            CustomTextField(
              hitext: 'Your Email',
              controllername: TextController.studentemail,
            ),
            CustomTextField(
              hitext: 'Mobile Number',
              controllername: TextController.studentmobile,
            ),
            CustomTextField(
              hitext: 'Password',
              controllername: TextController.studentpassword,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    chooseImageFromGC();
                  },
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      'Choose File',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _courseImage != null
                      ? Image.file(
                          height: 60.0,
                          width: 100.0,
                          File(_courseImage!.path),
                        )
                      : Image.network(placeHolderImage,
                          height: 50.0, width: 50.0),
                ),
              ],
            ),
            RowImages(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/studentLogin');
              },
              child: Text(
                "Already have an account?",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0D202E),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: InkWell(
                onTap: () {
                  StudentSignupFunction();
                },
                child: Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(170, 0, 0, 0),
                          blurRadius: 7,
                          offset: Offset(4, 4)),
                    ],
                    color: Color(0xff4676FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

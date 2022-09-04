import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirebaseDatebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  createUser(String name, String number, String img) async {
    _firestore
        .collection('names')
        .add({"CourseName": name, "CourseFee": number, "CourseImage": img})
        .then((value) => debugPrint('Success'))
        .catchError((e) => debugPrint(e.toString()));
  }
}

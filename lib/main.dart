import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_firebase/database/database.dart';

import 'package:my_firebase/home_page.dart';
import 'package:my_firebase/screen/admin_home_page/admin_home_page.dart';
import 'package:my_firebase/screen/introduction%20slider/introduction_home.dart';
import 'package:my_firebase/screen/login_signup/login.dart';
import 'package:my_firebase/screen/login_signup/student_Login/student_login.dart';
import 'package:my_firebase/screen/login_signup/student_Login/student_sign_up.dart';
import 'package:my_firebase/screen/splash_screen.dart';
import 'package:my_firebase/screen/user_home_page/student_home_page.dart';
import 'package:my_firebase/show_users%20copy.dart';
import 'package:my_firebase/update.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    routes: {
      '/': (context) => Home(),
      //'/add': (context) => const AddCourse(),
      '/showUser': (context) => AdminSearchStudent(),
      '/onboardingScreen': (context) => IntroductionSliderBody(),
      '/loginPage': (context) => LoginPage(),
      '/studentLogin': (context) => StudentLogin(),
      '/studentSignUp': (context) => StudentSignUp(),
      '/studentHomePage': (context) => StudentHomePage(),
      '/adminHomePage': (context) => AdminHomePage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 2), () {
    //   Navigator.of(context).pushNamed('/loginPage');
    // });
    return Scaffold(
      body: AdminHomePage(),
    );
  }
  //  Image.asset('assets/logo.png'),
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pushNamed('/add');
  //             },
  //             child: Text(
  //               'Add Users',
  //             ),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pushNamed('/showUser');
  //             },
  //             child: Text(
  //               'Show User',
  //             ),
  //           ),
  // Flexible(
  //           child: StreamBuilder<QuerySnapshot>(
  //             stream:
  //                 FirebaseFirestore.instance.collection('names').snapshots(),
  //             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //               if (snapshot.hasError) {
  //                 return const Center(child: Text('Error has Occurred...'));
  //               }
  //               if (snapshot.connectionState == ConnectionState.active) {
  //                 return ListView(
  //                   children: snapshot.data!.docs.map((document) {
  //                     Map<String, dynamic> data =
  //                         document.data() as Map<String, dynamic>;
  //                     return ListTile(
  //                       leading: CircleAvatar(),
  //                       title: Text(data['name'].toString()),
  //                       subtitle: Text(data['name'].toString()),
  //                       trailing: FittedBox(
  //                           child: Row(
  //                         children: [
  //                           IconButton(
  //                               onPressed: () => showDialog(
  //                                   context: context,
  //                                   builder: (context) => UpdateName(
  //                                         name: data['name'],
  //                                       )),
  //                               icon: const Icon(Icons.edit)),
  //                           IconButton(
  //                               onPressed: () {
  //                                 FirebaseFirestore.instance
  //                                     .collection('names')
  //                                     .doc()
  //                                     .delete()
  //                                     .then((value) =>
  //                                         debugPrint('Deleted Success'))
  //                                     .catchError(
  //                                         (e) => debugPrint(e.toString()));
  //                               },
  //                               icon: const Icon(Icons.delete))
  //                         ],
  //                       )),
  //                     );
  //                   }).toList(),
  //                 );
  //               }
  //               return const Text('Something is Wrong....😢😢');
  //             },
  //           ),
  //         ),
}

import 'package:flutter/material.dart';
import 'package:my_firebase/screen/user_home_page/component/student_home_appbar.dart';

class StudentHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        leading: Icon(Icons.menu),
        title: Row(
          children: [
            CircleAvatar(
              radius: 40,
              //child: ,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          StudentHomeAppbar(),
        ],
      ),
    );
  }
}

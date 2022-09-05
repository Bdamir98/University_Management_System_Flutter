import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSearchStudent extends StatefulWidget {
  const AdminSearchStudent({Key? key}) : super(key: key);

  @override
  State<AdminSearchStudent> createState() => _AdminSearchStudentState();
}

class _AdminSearchStudentState extends State<AdminSearchStudent> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff27263E),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                child: SizedBox(
                  width: 200,
                  child: Card(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search...'),
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Student_Information')
              .snapshots(),
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;

                      if (name.isEmpty) {
                        return Card(
                          color: Color(0xff27263E),
                          child: ListTile(
                            title: Text(
                              data['Student_Name'],
                              style: GoogleFonts.adamina(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data['Student_Session'],
                              style: TextStyle(
                                  color: Color.fromARGB(146, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(data['Student_Picture']),
                            ),
                          ),
                        );
                      }
                      if (data['Student_Name']
                          .toString()
                          .toLowerCase()
                          .startsWith(name.toLowerCase())) {
                        return Card(
                          color: Color(0xff27263E),
                          child: ListTile(
                            title: Text(
                              data['Student_Name'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data['Student_Session'],
                              style: TextStyle(
                                  color: Color.fromARGB(146, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(data['Student_Picture']),
                            ),
                          ),
                        );
                      }
                      return Container();
                    });
          },
        ));
  }
}

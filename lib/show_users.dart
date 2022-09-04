import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowUser extends StatefulWidget {
  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {
  Future<void> deleteUser(selectedDocumentId) {
    return FirebaseFirestore.instance
        .collection('Student_Information')
        .doc(selectedDocumentId)
        .delete();
  }

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Student_Information').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 100,
                  child: Card(
                    color: Color.fromARGB(255, 29, 28, 46),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(data['Student_Picture']),
                                    fit: BoxFit.cover),
                                color: Color.fromARGB(101, 255, 255, 255),
                                shape: BoxShape.circle),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              data['Student_Name'],
                              style: GoogleFonts.comfortaa(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              data['Student_Session'],
                              style: GoogleFonts.poiretOne(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(137, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {},
                                child: Icon(Icons.edit, color: Colors.white)),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                                onTap: () {
                                  deleteUser(document.id);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

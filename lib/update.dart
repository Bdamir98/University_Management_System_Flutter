import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_firebase/home_page.dart';

// class UpdateName extends StatelessWidget {
//   const UpdateName({required this.name});
//   final String name;
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController nameController = TextEditingController(text: name);
//     return Container(
//         margin: const EdgeInsets.symmetric(horizontal: 6.0),
//         child: AlertDialog(
//           content: Column(mainAxisSize: MainAxisSize.min, children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(hintText: 'Update Name'),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   FirebaseFirestore.instance
//                       .collection('names')
//                       .doc()
//                       .update({
//                         "name": nameController.text,
//                       })
//                       .then((value) => debugPrint('Deleted Success'))
//                       .catchError((e) => debugPrint(e.toString()));
//                 },
//                 child: const Text('Update'))
//           ]),
//         ));
//   }
// }
class UpdateUsers extends StatefulWidget {
  UpdateUsers({Key? key}) : super(key: key);

  @override
  State<UpdateUsers> createState() => _UpdateUsersState();
}

class _UpdateUsersState extends State<UpdateUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}

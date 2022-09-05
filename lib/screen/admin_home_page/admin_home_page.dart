import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_firebase/show_users%20copy.dart';

class AdminHomePage extends StatefulWidget {
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Color(0xff27263E),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {
                  setState(() {
                    AdminSearchStudent();
                  });
                },
                child: Icon(Icons.notifications)),
          ),
        ],
      ),
      sideBar: SideBar(
        activeTextStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        activeIconColor: Color.fromARGB(17, 255, 255, 255),
        borderColor: Color.fromARGB(12, 255, 255, 255),
        textStyle: TextStyle(
          color: Color.fromARGB(255, 197, 195, 195),
        ),
        iconColor: Colors.white,
        backgroundColor: Color(0xff27263E),
        activeBackgroundColor: Color.fromARGB(83, 255, 255, 255),
        items: [
          AdminMenuItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            children: [
              AdminMenuItem(title: 'Admin'),
              AdminMenuItem(title: 'Students'),
              AdminMenuItem(title: 'Faculty'),
            ],
          ),
          AdminMenuItem(
            title: 'Students',
            icon: Icons.person,
            children: [
              AdminMenuItem(title: 'All Students', route: '/showUser'),
              AdminMenuItem(title: 'Student Details'),
              AdminMenuItem(title: 'Admission Form'),
            ],
          ),
          AdminMenuItem(
            title: 'Teachers',
            icon: Icons.person,
            children: [
              AdminMenuItem(title: 'All Faculty'),
              AdminMenuItem(title: 'Faculty Details'),
              AdminMenuItem(title: 'Add Faculty'),
              AdminMenuItem(title: 'Payment'),
            ],
          ),
          AdminMenuItem(
            title: 'Library',
            icon: Icons.local_library,
            children: [
              AdminMenuItem(title: 'All Book'),
              AdminMenuItem(title: 'Add New Book'),
            ],
          ),
          AdminMenuItem(
            title: 'Account',
            icon: Icons.account_balance,
            children: [
              AdminMenuItem(title: 'All Fees Collection'),
              AdminMenuItem(title: 'Expenses'),
              AdminMenuItem(title: 'Add Expenses'),
            ],
          ),
          AdminMenuItem(
            title: 'Class',
            icon: Icons.event_note,
            children: [
              AdminMenuItem(title: 'All Classes'),
              AdminMenuItem(title: 'Add New Class'),
            ],
          ),
          AdminMenuItem(
            title: 'Subject',
            icon: Icons.library_books,
          ),
          AdminMenuItem(
            title: 'Attendence',
            icon: Icons.accessibility,
          ),
          AdminMenuItem(
            title: 'Exam',
            icon: Icons.call_to_action,
            children: [
              AdminMenuItem(title: 'Exam Schedule'),
              AdminMenuItem(title: 'Exam Grades'),
            ],
          ),
          AdminMenuItem(
            title: 'Notice',
            icon: Icons.featured_play_list,
          ),
          AdminMenuItem(
            title: 'Account',
            icon: Icons.supervisor_account,
          ),
          AdminMenuItem(
            title: 'Log Out',
            icon: Icons.label_outlined,
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          if (item.route != null) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
        header: Container(
          padding: EdgeInsets.only(top: 10),
          height: 110,
          width: double.infinity,
          color: Color(0xff221E22),
          child: Center(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Center(child: Text('A')),
                      radius: 25,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Amir Hossain',
                      style: GoogleFonts.comfortaa(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffE84E12),
                      ),
                    ),
                    Text(
                      'Admin',
                      style: GoogleFonts.comfortaa(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome To Admin Panel',
          style: GoogleFonts.comfortaa(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

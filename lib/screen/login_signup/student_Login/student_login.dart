import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_firebase/const.dart';
import 'package:my_firebase/custom_widget/text_field.dart';
import 'package:my_firebase/screen/user_home_page/student_home_page.dart';

class StudentLogin extends StatelessWidget {
  TextEditingController stdLoginId = TextEditingController();
  TextEditingController stdLoginpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ocolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          children: [
            Image.asset(
              'assets/Stamford.png',
              height: 150,
            ),
            Text(
              'Student Login',
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff0D202E),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Spacer(),
            CustomTextField(
              hitext: 'Your Username/Id',
              controllername: stdLoginId,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hitext: 'Your Password',
              controllername: stdLoginpassword,
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'Forgot your password?',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0D202E),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/google.png',
                  height: 50,
                ),
                SizedBox(
                  width: 30,
                ),
                Image.asset(
                  'assets/facebook.png',
                  height: 50,
                ),
                SizedBox(
                  width: 30,
                ),
                Image.asset(
                  'assets/github.png',
                  height: 50,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/studentSignUp');
              },
              child: Text(
                "Don't have an account?",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0D202E),
                ),
              ),
            ),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/studentHomePage');
                },
                child: Container(
                  height: 50,
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
                  child: Center(
                    child: Text(
                      "Login",
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

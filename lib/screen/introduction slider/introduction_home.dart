import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:my_firebase/screen/login_signup/admin_login.dart';
import 'package:my_firebase/screen/login_signup/login.dart';

class IntroductionSliderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionSlider(
        titleTextStyle: GoogleFonts.carterOne(
          fontSize: 25,
        ),
        descriptionTextStyle: GoogleFonts.comfortaa(
          fontSize: 18,
        ),
        isScrollable: true,
        onDone: LoginPage(),
        items: [
          IntroductionSliderItem(
            image: Image.asset(
              'assets/splash screen/splash1.png',
              fit: BoxFit.cover,
            ),
            title: "Welcome Stamfordian",
            description: "Discover New Things Everyday",
          ),
          IntroductionSliderItem(
            image: Image.asset('assets/splash screen/splash3.jpg'),
            title: "Anytime Anywhere",
            description: "You can get your infromation anytime",
          ),
          IntroductionSliderItem(
            image: Image.asset('assets/splash screen/splash2.png'),
            title: "Explore the world",
            description: "Ready to explore the unique world",
          ),
        ],
      ),
    );
  }
}

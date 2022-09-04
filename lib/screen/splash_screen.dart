import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/Stamford.png',
            height: 150,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Stamford University Bangladesh',
                style: GoogleFonts.lalezar(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3F4099),
                ),
              ),
              Text(
                'We Bring out the Best in You',
                style: GoogleFonts.baloo2(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff4C95CC),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

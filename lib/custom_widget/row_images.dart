import 'package:flutter/material.dart';
import 'package:my_firebase/custom_widget/images_list.dart';

class RowImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        images.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Image.asset(images[index], height: 40.0, width: 40.0),
        ),
      ),
    );
  }
}

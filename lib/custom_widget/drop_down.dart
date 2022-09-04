import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? chosenValue;
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(129, 0, 0, 0),
                  blurRadius: 7,
                  offset: Offset(4, 4)),
            ],
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: DropdownButton<String>(
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down_outlined),
            underline: SizedBox(),
            value: chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.black),

            items: <String>[
              'Summer 2022',
              'Spring 2022',
              'Fall 2022',
            ].map<DropdownMenuItem<String>>((String dropValue) {
              return DropdownMenuItem<String>(
                value: dropValue,
                child: Text(dropValue),
              );
            }).toList(),
            hint: Text(
              "Select One",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onChanged: (value) {
              setState(() {
                chosenValue = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

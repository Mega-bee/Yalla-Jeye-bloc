import 'package:flutter/material.dart';
import 'package:untitled1/utils/Colors/colors.dart';

class CustomRedButton extends StatelessWidget {
  final Function oPres;
  final String title;
  const CustomRedButton({  required this.oPres, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(
              left: 120, right: 120, top: 16, bottom: 16),
          backgroundColor: redColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          )),
      onPressed: () {
       oPres();
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}

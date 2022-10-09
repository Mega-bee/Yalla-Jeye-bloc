import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleHome extends StatelessWidget {
  final String title;
  final String body;
  const TitleHome({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const SizedBox(height: 15,),
        ListTile(
          minVerticalPadding: 0,
          contentPadding: EdgeInsetsDirectional.all(0),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            body,
            style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal, fontSize: 14, color: Colors.grey),
          ),
          trailing: Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor),
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}

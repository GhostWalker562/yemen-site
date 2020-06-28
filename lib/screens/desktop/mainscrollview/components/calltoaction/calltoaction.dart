import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemen/core/SizeConfig.dart';

class CalltoAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Text(
                  "Call Congress.",
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.oswald(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Donate.",
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.oswald(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )));
  }
}

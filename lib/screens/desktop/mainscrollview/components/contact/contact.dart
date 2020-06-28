import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemen/core/SizeConfig.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle main = GoogleFonts.oswald(color: Colors.white, fontSize: 16);
    return Container(
      alignment: Alignment.center,
      height: SizeConfig.blockSizeVertical * 15,
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              FlatButton(
                child: Text("Lead Developer", style: main),
                onPressed: () => launch("https://github.com/GhostWalker562"),
              ),
              FlatButton(
                child: Text("Researcher", style: main),
                onPressed: () => launch("https://github.com/kathiehuang"),
              ),
              FlatButton(
                child: Text("QOL Developer", style: main),
                onPressed: () => launch("https://github.com/Vivekmad000"),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          AutoSizeText("HACKMANN SUBMISSION 2020",
              style: GoogleFonts.oswald(color: Colors.red, fontSize: 16))
        ],
      ),
    );
  }
}

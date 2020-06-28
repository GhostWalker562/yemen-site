import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemen/core/SizeConfig.dart';

class CalltoAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            height: SizeConfig.blockSizeVertical * 115,
            color: Colors.black,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Text(
                        "Take Action.",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.oswald(
                            fontSize: 72,
                            color: Colors.red,
                            fontWeight: FontWeight.w300),
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: FlatButton(
                      child: Text(
                        "Call Congress.",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.oswald(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      onPressed: () => launch("tel://2022243121"),
                    )),
                    Expanded(
                        child: FlatButton(
                      child: Text(
                        "Donate.",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.oswald(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      onPressed: () => launch(
                          "https://help.rescue.org/donate/yemen-crisis?ms=ws_country_yemen"),
                    )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          "Insist that the U.S. end its military support and instead use its leverage to push for an inclusive peace agreement to end the civil war. Currently, U.S. military support is using up money and resources along with fueling the Yemen conflict and increasing civilian suffering.",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.ltr,
                          style: GoogleFonts.oswald(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          "Donate to the IRC, which is currently providing clean water, medicine, nutrition services, and other urgent aid to as many people in Yemen as possible. Help others work to save lives.",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.ltr,
                          style: GoogleFonts.oswald(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            )));
  }
}

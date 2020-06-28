import 'dart:async';
import 'dart:convert';

import 'package:auto_animated/auto_animated.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemen/core/SizeConfig.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  List children;

  String cases = "...";

  Timer _callback;

  final options = LiveOptions(
    delay: Duration(milliseconds: 0),
    showItemInterval: Duration(milliseconds: 0),
    showItemDuration: Duration(seconds: 1),
    visibleFraction: 0.5,
    reAnimateOnVisibility: true,
  );

  @override
  void initState() {
    getCases();

    _callback = Timer.periodic(Duration(minutes: 1), (t) async => getCases());

    super.initState();
  }

  void getCases() async {
    var response = await http.post("https://covid-19.dataflowkit.com/v1/Yemen");
    setState(() {
      Map temp = jsonDecode(response.body);
      cases = temp["Total Cases_text"];
    });
  }

  @override
  Widget build(BuildContext context) {
    children = returnChildren(context);

    return Container(
      height: SizeConfig.blockSizeVertical * 125,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
              height: SizeConfig.blockSizeVertical * 200,
              width: SizeConfig.blockSizeHorizontal * 100,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Opacity(
                    opacity: 0.25,
                    child: Image(
                      image: NetworkImage(
                          "https://www.aljazeera.com/mritems/imagecache/mbdxxlarge/mritems/Images/2020/4/10/3e5a6ca65c8b4e49b0c47f6dcaaefee8_18.jpg"),
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: LiveList.options(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index, animation) =>
                      buildAnimatedItem(context, index, animation, children),
                  itemCount: children.length,
                  options: options)),
        ],
      ),
    );
  }

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
    List children,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
            CurvedAnimation(curve: Curves.easeInOutCubic, parent: animation)),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: (index == 0) ? Offset(-0.1, 0) : Offset(00, -0.1),
            end: Offset.zero,
          ).animate(
              CurvedAnimation(curve: Curves.easeInOutCubic, parent: animation)),
          child: children[index],
        ),
      );

  List<Widget> returnChildren(context) {
    return [
      Container(
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical,
            horizontal: SizeConfig.blockSizeHorizontal * 5),
        alignment: Alignment.center,
        height: SizeConfig.blockSizeVertical * 50,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Stack(
            children: [
              Text(
                "COVID",
                style: GoogleFonts.oswald(
                    fontSize: 256,
                    color: Colors.black12,
                    fontWeight: FontWeight.w300),
              ),
              Positioned(
                top: 134,
                child: Text(
                  "COVID",
                  style: GoogleFonts.oswald(
                      fontSize: 144,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: SizeConfig.blockSizeHorizontal * 5,
        height: SizeConfig.blockSizeVertical * 15,
        alignment: Alignment.center,
        child: Container(
          height: double.infinity,
          width: SizeConfig.blockSizeHorizontal * 85,
          child: AutoSizeText(
            "After facing disease and hunger for six years, COVID-19 is pushing a devastated health infrastructure to the brink of collapse. As of May 30, 2020, only 2,678 people had been tested out of 28 million Yemenis. Out of those 2,678 people, there have been 400 COVID-19 cases and 87 deaths. With 500 ventilators, 700 intensive care units, and a population of 29 million people, these numbers are bound to rise.",
            style: Theme.of(context).accentTextTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        width: SizeConfig.blockSizeHorizontal * 5,
        height: SizeConfig.blockSizeVertical * 15,
        alignment: Alignment.center,
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 85,
          child: AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Your attention is",
                  style: Theme.of(context).accentTextTheme.bodyText1,
                ),
                TextSpan(
                    text: " urgent.",
                    style: Theme.of(context).primaryTextTheme.bodyText2)
              ],
            ),
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        width: SizeConfig.blockSizeHorizontal * 5,
        height: SizeConfig.blockSizeVertical * 15,
        alignment: Alignment.center,
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 85,
          child: AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Live COVID case count: ",
                  style: Theme.of(context).accentTextTheme.bodyText1,
                ),
                TextSpan(
                    text: cases,
                    style: Theme.of(context).primaryTextTheme.bodyText2)
              ],
            ),
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ];
  }
}

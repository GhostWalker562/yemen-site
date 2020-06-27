import 'package:auto_animated/auto_animated.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemen/core/SizeConfig.dart';

import 'components/marker.dart';

// ignore: must_be_immutable
class Timeline extends StatelessWidget {
  List children;

  final options = LiveOptions(
    delay: Duration(milliseconds: 0),
    showItemInterval: Duration(milliseconds: 250),
    showItemDuration: Duration(seconds: 1),
    visibleFraction: 0.5,
    reAnimateOnVisibility: true,
  );

  @override
  Widget build(BuildContext context) {
    children = returnChildren(context);

    return Container(
      height: SizeConfig.blockSizeVertical * 250,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 25),
            child: Container(
              height: SizeConfig.blockSizeVertical * 200,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.black12,
                  width: 2,
                ),
              ),
            ),
          ),
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
          begin: (index == 0 )
              ? Offset(-0.1, 0)
              : Offset(00, -0.1),
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
          vertical: SizeConfig.blockSizeVertical * 5,
          horizontal: SizeConfig.blockSizeHorizontal * 5),
      alignment: Alignment.center,
      child: Text(
        "YEARS BEFORE",
        style: GoogleFonts.oswald(
            fontSize: 72, color: Colors.black, fontWeight: FontWeight.w300),
      ),
    ),
    Marker(year: "2011",desc: "November - Ali Abdullah Saleh, president of Yemen for 22 years, hands over his position to Abdrabbuh Mansour Hadi.",),
    Marker(year: "2014",desc:"September - The Houthi rebels take over the capital of Yemen, Sana’a.", flip: true),
    Marker(year: "2015",desc:"February - Hadi flees to his hometown, Aden, and then to Saudi Arabia. March - Saudi-led coalition of mainly Gulf Arab states start launching air strikes against the Houthi rebels."),
    Marker(year: "2016",desc:"July - The Houthis and the government of Saleh (former president) announces the formation of a “political council” to govern Sana’a and much of northern Yemen.", flip: true),
    Marker(year: "2017",desc:"December - Saleh breaks with the Houthis and calls up his followers to fight the rebels. His forces are defeated within two days, and he is killed. The United States has launched over 130 airstrikes, targeted at the Houthis, at this point in the year."),
    Marker(year: "2020",desc:"April - A two-week ceasefire is announced in response to the COVID-19 pandemic.", flip: true),
  ];
}

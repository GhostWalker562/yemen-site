
import 'package:auto_animated/auto_animated.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemen/core/SizeConfig.dart';
import './components/textimage.dart';
import './components/textimageleft.dart';

// ignore: must_be_immutable
class Influential extends StatelessWidget {
  List children;

  final options = LiveOptions(
    delay: Duration(milliseconds: 0),
    showItemInterval: Duration(milliseconds: 0),
    showItemDuration: Duration(seconds: 1),
    visibleFraction: 0.5,
    reAnimateOnVisibility: true,
  );

  @override
  Widget build(BuildContext context) {
    children = returnChildren(context);

    return Container(
      height: SizeConfig.blockSizeVertical * 400,
      color: Color(0xFFbb0a1e),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: LiveList.options(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index, animation) =>
                  buildAnimatedItem(context, index, animation, children),
              itemCount: children.length,
              options: options)),
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
      child: Text(
        "TODAY",
        style: GoogleFonts.oswald(
            fontSize: 72, color: Colors.white, fontWeight: FontWeight.w300),
      ),
    ),
    TextImage(
        image:
            "https://media1.s-nbcnews.com/j/newscms/2018_43/2616706/181024-yemen-famine-mc-1005_87d5a3104d18f3bbceafa31cc8a219bd.fit-1240w.JPG",
            text:"'Every day, in Yemen's southern city of Aden, they're digging more fresh graves, struggling to keep up with the rising body count, rows of deep mud holes ready to accept the dead, as families bury their loved ones quickly, with little ceremony'",
            person: "— Jane Ferguson, special correspondent",),
    TextImageLeft(
        image:
            "https://youngglobalinitiative.files.wordpress.com/2015/08/unicef-yemen-humanitarian-crisis-593x405.jpg",
            text:"About 70% of the population does not have access to drinking water.",
            person: "",),
    TextImage(
        image:
            "https://ichef.bbci.co.uk/news/1024/cpsprodpb/16479/production/_108575219_mediaitem108575215.jpg",
            text:"'More than 100 people have died in Yemen after the Saudi-led coalition launched a series of air strikes on a detention centre'",
            person: "— International Committee of the Red Cross",),
  ];
}

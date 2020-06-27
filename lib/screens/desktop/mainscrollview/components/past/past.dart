import 'package:auto_animated/auto_animated.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemen/core/SizeConfig.dart';

import 'components/animatedimage.dart';
import 'components/dash.dart';

// ignore: must_be_immutable
class Past extends StatelessWidget {
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
      height: SizeConfig.blockSizeVertical * 450,
      color: Colors.black,
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
          begin: (index == 0 || index == 9 || index == 12 || index == 15)
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
        "THE PAST",
        style: GoogleFonts.oswald(
            fontSize: 72, color: Colors.white, fontWeight: FontWeight.w300),
      ),
    ),
    VDash(),
    VDash(),
    VDash(),
    VDash(),
    VDash(),
    VDash(),
    VDash(),
    VDash(),
    BackgroundAnimatedImage(
        image:
            "https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1439,w_2560,x_0,y_0/dpr_1.5/c_limit,w_1044/fl_lossy,q_auto/v1492176512/articles/2015/09/27/the-sad-decline-of-yemen-the-best-country-you-ll-never-get-to-see/150926-pell-yemen-tease_kz1rvq",
        text: "SKIES"),
    VDash(),
    VDash(),
    BackgroundAnimatedImage(
        image:
            "https://i.pinimg.com/originals/8a/d6/5b/8ad65bda3e46aa97fede64f8272acd3f.jpg",
        text: "LIGHTS"),
    VDash(),
    VDash(),
    BackgroundAnimatedImage(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/f/f7/Sa%27dah_05.jpg",
        text: "CULTURE"),
    VDash(),
    VDash(),
    Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
          vertical: SizeConfig.blockSizeVertical * 5,
        ),
        child: AutoSizeText(
          "In 2011, Abdrabbuh Mansour Hadi became the president of Yemen. He struggled at first, and the Houthi movement, made up of Yemen’s Zaidi Shia Muslim minority, took advantage of this to take control of the Saada province and its neighboring areas. Many Yemenis supported this because they didn’t like the transition of presidential power, which gave the Houthi rebels the power to take over the capital, Sana’a, in 2014. Soon, they tried to take over the entire country, forcing Hadi to flee abroad. Many Sunni countries (ie. Saudi Arabia) began an air campaign to try to defeat the Houthis, leading to years of military stalemate and tragedy in Yemen since then.",
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        )),
  ];
}

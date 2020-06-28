import 'package:auto_animated/auto_animated.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yemen/core/SizeConfig.dart';

class TextImage extends StatelessWidget {
  const TextImage({Key key, @required this.image, @required this.text, @required this.person}) : super(key: key);

  final String image;
  final String text;
  final String person;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: SizeConfig.blockSizeHorizontal * 100,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 5,
            vertical: SizeConfig.blockSizeHorizontal * 5),
        child: Stack(
          children: [
            AnimateIfVisible(
                reAnimateOnVisibility: true,
                visibleFraction: 0.5,
                delay: Duration(milliseconds: 500),
                duration: Duration(milliseconds: 750),
                key: Key(text),
                builder: (context, animation) {
                  return ScaleTransition(
                    scale: Tween<double>(
                      begin: 1,
                      end: 0.8,
                    ).animate(CurvedAnimation(
                        curve: Curves.easeInOutCubic, parent: animation)),
                    child: Opacity(
                      opacity: Tween<double>(
                        begin: 1,
                        end: 0.2,
                      )
                          .animate(CurvedAnimation(
                              curve: Curves.easeInOutCubic, parent: animation))
                          .value,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 1,
                            vertical: SizeConfig.blockSizeHorizontal * 3),
                        height: SizeConfig.blockSizeVertical * 90,
                        width: SizeConfig.blockSizeHorizontal * 80,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image(
                              image: NetworkImage(
                                  image)),
                        ),
                      ),
                    ),
                  );
                }),
            Positioned(
              right: SizeConfig.blockSizeHorizontal * 3,
              top: SizeConfig.blockSizeVertical * 20,
              child: AnimateIfVisible(
                reAnimateOnVisibility: true,
                delay: Duration(milliseconds: 500),
                duration: Duration(milliseconds:750),
                key: Key(person),
                builder: (context, animation) => SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, 1),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                      curve: Curves.easeInOutCubic, parent: animation)),
                  child: Opacity(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    )
                        .animate(CurvedAnimation(
                            curve: Curves.easeInOutCubic, parent: animation))
                        .value,
                    child: Container(
                      width: SizeConfig.blockSizeVertical * 70 ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                              text, overflow: TextOverflow.visible,
                              style: Theme.of(context).textTheme.headline2),
                          AutoSizeText(person.toUpperCase(),
                              textAlign: TextAlign.left,overflow: TextOverflow.visible,
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

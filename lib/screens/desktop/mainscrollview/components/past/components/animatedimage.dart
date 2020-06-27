import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:yemen/core/SizeConfig.dart';

class BackgroundAnimatedImage extends StatelessWidget {
  final String text;
  final String image;

  const BackgroundAnimatedImage({Key key, this.text, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 10,
                vertical: SizeConfig.blockSizeHorizontal * 5),
            child: Container(
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.white, width: 1),
              ),
              height: SizeConfig.blockSizeVertical * 80,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image(image: NetworkImage(image)),
              ),
            ),
          ),
        ),
        Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 5,
                vertical: SizeConfig.blockSizeHorizontal * 5),
            child: Container(
              alignment: Alignment.center,
              height: SizeConfig.blockSizeVertical * 80,
              child: AnimateIfVisible(
                reAnimateOnVisibility: true,
                duration: Duration(milliseconds: 750),
                builder: (context, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, -0.1),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                          parent: animation, curve: Curves.easeInOutCubic),
                    ),
                    child: FadeTransition(
                      opacity: animation,
                      child: Text(text,
                          style: Theme.of(context).textTheme.headline1),
                    ),
                  );
                },
                key: Key(text),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

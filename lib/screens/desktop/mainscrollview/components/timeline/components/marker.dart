import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yemen/core/SizeConfig.dart';

class Marker extends StatelessWidget {
  const Marker({Key key, this.year, this.desc, this.flip = false})
      : super(key: key);

  final String year;
  final String desc;
  final bool flip;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 5,
          horizontal: SizeConfig.blockSizeHorizontal * 0),
      height: SizeConfig.blockSizeVertical * 20,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: AutoSizeText(
              
              flip ? desc ?? "1999" : year ?? "1999",
              textAlign: TextAlign.right,
              style: flip ? Theme.of(context).accentTextTheme.bodyText1 : Theme.of(context).accentTextTheme.headline1, overflow: TextOverflow.visible,
            ),
          )),
          Container(
            width: SizeConfig.blockSizeHorizontal * 1,
            height: SizeConfig.blockSizeHorizontal * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: AutoSizeText(
              flip
                  ? year ??
                      "Nostrud consectetur consectetur fugiat sunt in incididunt duis Lorem occaecat exercitation. Excepteur nostrud elit laboris cupidatat adipisicing reprehenderit. Aliqua ea eu anim proident."
                  : desc ??
                      "Nostrud consectetur consectetur fugiat sunt in incididunt duis Lorem occaecat exercitation. Excepteur nostrud elit laboris cupidatat adipisicing reprehenderit. Aliqua ea eu anim proident.",
              style: flip ? Theme.of(context).accentTextTheme.headline1 : Theme.of(context).accentTextTheme.bodyText1,overflow: TextOverflow.visible,
            ),
          )),
        ],
      ),
    );
  }
}

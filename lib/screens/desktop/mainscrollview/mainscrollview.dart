import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemen/core/Physics.dart';
import 'package:yemen/core/SizeConfig.dart';
import 'package:yemen/screens/desktop/mainscrollview/components/timeline/timeline.dart';
import 'package:yemen/screens/desktop/mainscrollview/components/influential/influential.dart';
import 'package:yemen/screens/desktop/mainscrollview/components/covid/covid.dart';
import 'package:yemen/screens/desktop/mainscrollview/components/contact/contact.dart';
import 'components/past/past.dart';

class MainScrollView extends StatefulWidget {
  final bool mobile;

  const MainScrollView({Key key, this.mobile = false}) : super(key: key);

  @override
  _MainScrollViewState createState() => _MainScrollViewState();
}

class _MainScrollViewState extends State<MainScrollView> {
  double rateZero = -150;
  double rateOne = 0;
  bool rateBool = true;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ev) {
        if (ev is OverscrollNotification) {
          return;
        }
        if (ev is ScrollUpdateNotification) {
          setState(() {
            rateZero += -(ev.scrollDelta / 1);
            rateZero += -(ev.scrollDelta / 1.5);

            if (rateZero > -150) {
              rateZero = -150;
            }

            if (rateZero < -2000) {
              rateBool = false;
            } else {
              rateBool = true;
            }
          });
        }
      },
      child: Stack(
        children: [
          Positioned(
            top: rateOne,
            child: Container(
                width: SizeConfig.blockSizeHorizontal * 100,
                height: SizeConfig.blockSizeVertical * 100,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://sanaacenter.org/wp-content/uploads/2017/11/Yemenmentalhealth-1140x532.png"),
                )),
          ),
          Visibility(
            visible: rateBool,
            child: Positioned(
              top: rateOne,
              child: Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  height: SizeConfig.blockSizeVertical * 100,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.squarespace-cdn.com/content/v1/58e73e31be659415d07a4a59/1547202205200-9N0RGH0V9U67X1BFGQIW/ke17ZwdGBToddI8pDm48kF9aEDQaTpZHfWEO2zppK7Z7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UX7HUUwySjcPdRBGehEKrDf5zebfiuf9u6oCHzr2lsfYZD7bBzAwq_2wCJyqgJebgg/sanaa-yemen-65-2.jpg?format=2500w"),
                  )),
            ),
          ),
          Positioned(
            top: rateZero,
            child: Container(
              padding: EdgeInsets.all(
                  SizeConfig.blockSizeHorizontal * (!widget.mobile ? 20 : 1)),
              width: SizeConfig.blockSizeHorizontal * 100,
              height: SizeConfig.blockSizeVertical * 100,
              child: Center(
                  child: AutoSizeText(
                "The conflict in Yemen is the largest humanitarian crisis in the world. Over 24 million people—80% of the population—are in need of humanitarian assistance, including more than 12 million children. One of the Arab world’s poorest countries, Yemen has been devastated by a civil war since 2015, becoming a living hell for its citizens. This is a national crisis—and it demands our attention.",
                textAlign: TextAlign.center,
                style: !widget.mobile
                    ? Theme.of(context).accentTextTheme.bodyText1
                    : Theme.of(context).primaryTextTheme.bodyText1,
              )),
            ),
          ),
          ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              children: [
                
                Container(
                  height: SizeConfig.blockSizeVertical * 100,
                ),
               
                Past(),
                Container(
                  height: SizeConfig.blockSizeVertical * 100,
                ),
                Timeline(),
                Influential(),
                Covid(),
                Contact(),
              ],
            ),
          )
        ],
      ),
    );
  }
}


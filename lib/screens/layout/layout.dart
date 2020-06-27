import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:yemen/core/SizeConfig.dart';
import 'package:yemen/screens/desktop/landingpage/landingpage.dart';
import 'package:yemen/screens/desktop/mainscrollview/mainscrollview.dart';

class Wrapper extends StatelessWidget {
  final debug = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: Text("TO BE DONE"),
        desktop: debug ? MainScrollView() : LandingPage(debug:debug),
      ),
    );
  }
}

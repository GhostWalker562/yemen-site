import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:yemen/screens/desktop/landingpage/landingpage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Text("TO BE DONE"),
      desktop: LandingPage(),
    );
  }
}
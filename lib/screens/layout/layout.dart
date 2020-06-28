import 'package:flutter/material.dart';
import 'package:yemen/core/SizeConfig.dart';
import 'package:yemen/screens/desktop/landingpage/landingpage.dart';

class Wrapper extends StatelessWidget {
  final debug = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      
      body: LandingPage(debug:debug)
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yemen/screens/layout/layout.dart';
import 'package:yemen/theme/original.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yemen',
      theme: CustomThemes.original,
      home: Wrapper(),
    );
  }
}


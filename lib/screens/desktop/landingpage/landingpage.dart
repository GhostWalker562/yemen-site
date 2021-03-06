import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:yemen/screens/desktop/intro/intro.dart';
import 'package:yemen/screens/desktop/mainscrollview/mainscrollview.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.debug}) : super(key: key);
  final bool debug;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentChild;

  void changeChild(int child) {
    currentChild = child;
  }

  List children;

  @override
  void initState() {
    currentChild = widget.debug ? 1 : 0;
    children = [
      Intro(
        onPressed: () => setState(() => changeChild(1)),
      ),
      ScreenTypeLayout(
        mobile: MainScrollView(mobile : true),
        desktop: widget.debug ? MainScrollView() : MainScrollView(),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 3),
      switchInCurve: Curves.easeInOutCubic,
      switchOutCurve: Curves.easeInOutCubic,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: children[currentChild],
    );
  }
}

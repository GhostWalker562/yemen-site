
import 'package:flutter/material.dart';
import 'package:yemen/core/SizeConfig.dart';

class VDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 5,
      child: Align(
        alignment: Alignment.center,
              child: Container(
          color: Colors.white,
          width: 1,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:yemen/core/SizeConfig.dart';

class Intro extends StatelessWidget {

  final Function onPressed;

  const Intro({Key key, @required this.onPressed}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        height: SizeConfig.blockSizeVertical * 100,
        width: SizeConfig.blockSizeHorizontal * 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Text("Yemen",style: TextStyle(color: Colors.white),),
            FlatButton(child:Text("BEGIN",style: TextStyle(color: Colors.white)), onPressed:onPressed)
          ],
        ),
      );
  }
}
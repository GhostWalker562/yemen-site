import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Yemen",
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 2, vertical: SizeConfig.blockSizeVertical * 2),
                decoration: BoxDecoration(border: Border.all(color:Colors.white54,width:1)),
                child: FlatButton(
                    child: Text("BEGIN", style: GoogleFonts.oswald(color:Colors.white,fontSize:24)),
                    onPressed: onPressed),
              )
            ],

          ),

          Text("ADVISORY WARNING",style: Theme.of(context).primaryTextTheme.bodyText2,)
        ],
      ),
    );
  }
}

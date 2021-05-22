import 'package:flutter/cupertino.dart';
import 'package:terralife/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    double margin: 80,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        assert(assetName != null),
        super(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(assetName),
                SizedBox(width: margin),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 15.0),
                ),
              ]),
          color: color,
          height: 50.0,
          onPressed: onPressed,
        );
}

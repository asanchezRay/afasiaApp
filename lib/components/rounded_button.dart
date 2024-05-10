import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double width;
  final Function press;
  final Color color, textColor;
  final double textSize;
  const RoundedButton({
    Key key,
    this.text,
    @required this.width,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.size,
    this.textSize,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: this.textSize),
          ),
        ),
      ),
    );
  }
}

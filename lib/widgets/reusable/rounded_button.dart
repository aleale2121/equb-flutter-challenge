import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double width, height, borderRadius, textSize, elevation, borderThicknes;
  final Color color, textColor, borderColor;
  final Function onPressed;
  final FontWeight textWeight;
  RoundedButton({
    required this.text,
    required this.width,
    required this.height,
    required this.color,
    required this.textColor,
    required this.onPressed,
    required this.borderRadius,
    required this.textSize,
    required this.elevation,
    required this.textWeight,
    required this.borderColor,
    required this.borderThicknes,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: InkWell(
        splashColor: Colors.white54,
        onTap:()=>this.onPressed(),
        child: Material(
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                width: borderThicknes,
                color: borderColor,
              )),
          elevation: elevation,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius)),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize,
                  fontWeight: textWeight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

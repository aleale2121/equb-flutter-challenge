import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  final Color textColor, iconColor;
  final IconData icon;
  final String text;
  final double textSize, iconSize;
  final FontWeight weight;
  const TextWithIcon({
    Key? key,
    required this.icon,
    required this.text,
    required this.textSize,
    required this.iconSize,
    required this.textColor,
    required this.iconColor,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
        children: [
          WidgetSpan(
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
          TextSpan(
            text: " " + text,
          ),
        ],
      ),
    );
  }
}

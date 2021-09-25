import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int index;
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;
  final int selectedIndex;
  // final Function onTap;
  Indicator({
    Key? key,
    required this.index,
    required this.color,
    required this.text,
    required this.isSquare,
    required this.selectedIndex,
    // required this.onTap,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.37,
      // height: 20,
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color:
                    this.index == this.selectedIndex ? textColor : Colors.grey[350],
              ),
            ),
          )
        ],
      ),
    );
  }
}

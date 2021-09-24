import 'package:equb_flutter_challenge/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double value;
  final Color color;
  final Widget child;
  final double radius;
  const CustomProgressIndicator({
    Key? key,
    required this.value,
    required this.color,
    required this.child,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius*2,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: radius*2,
              height: radius*2,
              child: new CircularProgressIndicator(
                strokeWidth: 2,
                value: this.value,
                color: kRed,
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}

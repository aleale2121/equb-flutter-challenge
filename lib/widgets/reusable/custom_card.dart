import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  const CustomCard({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: width,
        height: height,
        child: Card(
          semanticContainer: true,
          elevation: 0.6,
          // borderOnForeground: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.grey.shade200,
              width: 0.6,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

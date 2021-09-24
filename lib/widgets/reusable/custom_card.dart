import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double width;
  const CustomCard({
    Key? key,
    required this.child,
    required this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Card(
        elevation: 0.6,
        borderOnForeground: true,
        clipBehavior: Clip.hardEdge,
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
    );
  }
}

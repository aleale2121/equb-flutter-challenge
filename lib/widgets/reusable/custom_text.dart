import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  final String data;
  final Color color;
  final double size;
  final FontWeight weight;
  const CustomeText({
    Key? key,
    required this.data,
    required this.color,
    required this.size,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.data,
      style: TextStyle(
        color: this.color,
        fontSize: this.size,
        fontWeight: this.weight,
      ),
    );
  }
}

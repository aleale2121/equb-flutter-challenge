
import 'package:equb_flutter_challenge/widgets/chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'header.dart';

class DebtContainer extends StatelessWidget {
  const DebtContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          DebtHeader(),
          SizedBox(
            height: 10,
          ),

          DebtChart()
        ],
      ),
    );
  }
}

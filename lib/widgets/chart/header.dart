import 'package:equb_flutter_challenge/widgets/chart/toggler.dart';
import 'package:flutter/foundation.dart';
import 'package:equb_flutter_challenge/constants/constants.dart';
import 'package:equb_flutter_challenge/providers/debts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DebtHeader extends StatelessWidget {
  const DebtHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: (MediaQuery.of(context).size.width - 64) / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Hi, ',
                    ),
                    TextSpan(
                      text: 'Alem ',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: 'have '),
                    TextSpan(
                      text: 'ETB ${context.watch<Debts>().total.round()}\n',
                      style: TextStyle(
                        color: kLightGreen,
                      ),
                    ),
                    TextSpan(text: 'unpaid debt.')
                  ],
                ),
              ),
            ],
          ),
          Toggler(),
        ],
      ),
    );
  }
}

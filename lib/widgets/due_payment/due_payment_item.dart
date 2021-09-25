import 'package:equb_flutter_challenge/constants/constants.dart';
import 'package:equb_flutter_challenge/models/due_payment.dart';
import 'package:equb_flutter_challenge/logics/logic.dart';
import 'package:equb_flutter_challenge/widgets/reusable/custom_card.dart';
import 'package:equb_flutter_challenge/widgets/reusable/custom_progres_indicator.dart';
import 'package:equb_flutter_challenge/widgets/reusable/custom_text.dart';
import 'package:equb_flutter_challenge/widgets/reusable/rounded_button.dart';
import 'package:equb_flutter_challenge/widgets/reusable/text_with_icon.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final DuePayment duePayment;
  const PaymentItem({
    Key? key,
    required this.duePayment,
  }) : super(key: key);

  void showSnackbar(BuildContext context, String data) {
    final snackBar = SnackBar(content: Text(data));
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  int calculateRemainingDay() {
    DateTime dueDate = DateTime.parse(duePayment.dueDate);
    DateTime now = DateTime.now();
    return daysBetween(dueDate, now).toInt();
  }

  double calculateRounds() {
    return (duePayment.paidRounds) / duePayment.totalRounds;
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: 125,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          CustomProgressIndicator(
            value: calculateRounds(),
            color: kRed,
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  duePayment.imagePath,
                ),
              ),
            ),
            radius: 25,
            strokeColor: kRed,
          ),
          SizedBox(
            height: 5,
          ),
          CustomeText(
            data: duePayment.name,
            color: Colors.black,
            size: 14,
            weight: FontWeight.bold,
          ),
          SizedBox(
            height: 10,
          ),
          TextWithIcon(
            icon: Icons.monetization_on,
            text: "ETB, ${double.parse(duePayment.owedAmount).toInt()}",
            textSize: 12,
            iconSize: 12,
            textColor: kRed,
            iconColor: kRed,
            weight: FontWeight.normal,
          ),
          TextWithIcon(
            icon: Icons.access_time_filled,
            text: "${calculateRemainingDay()} Days left",
            textSize: 12,
            iconSize: 12,
            textColor: kGreyLight,
            iconColor: Colors.grey,
            weight: FontWeight.w100,
          ),
          SizedBox(
            height: 10,
          ),
          RoundedButton(
            text: "Pay",
            width: 100,
            height: 25,
            color: Colors.white,
            textColor: kRed,
            onPressed: () => showSnackbar(
              context,
              "Paid ${duePayment.owedAmount}ETB to ${duePayment.name}",
            ),
            borderRadius: 12,
            textSize: 12,
            elevation: 0.0,
            textWeight: FontWeight.bold,
            borderColor: kRed,
            borderThicknes: 1.0,
          )
        ],
      ),
    );
  }
}

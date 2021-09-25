import 'package:equb_flutter_challenge/constants/constants.dart';
import 'package:equb_flutter_challenge/models/collected_payment.dart';
import 'package:equb_flutter_challenge/models/debt.dart';
import 'package:equb_flutter_challenge/models/due_payment.dart';
import 'package:equb_flutter_challenge/providers/collected_payments.dart';
import 'package:equb_flutter_challenge/widgets/collected_payment/collected_payment_container.dart';
import 'package:equb_flutter_challenge/widgets/reusable/custom_card.dart';
import 'package:equb_flutter_challenge/widgets/reusable/custom_progres_indicator.dart';
import 'package:equb_flutter_challenge/widgets/reusable/custom_text.dart';
import 'package:equb_flutter_challenge/widgets/reusable/text_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectedPaymentItem extends StatelessWidget {
  CollectedPaymentItem({
    Key? key,
  }) : super(key: key);

  void showSnackbar(BuildContext context, String data) {
    final snackBar = SnackBar(content: Text(data));
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  String getPeriod(int frequency) {
    if (frequency % 2 == 0) {
      return "Monthly";
    } else if (frequency % 3 == 0) {
      return "Weekly";
    }
    return "Annual";
  }

  @override
  Widget build(BuildContext context) {
    final collectedPayment =
        Provider.of<CollectedPayment>(context, listen: false);
    return CustomCard(
      width: 180,
      height: 170,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomProgressIndicator(
                      value: 0.7,
                      color: kLightGreen,
                      child: Center(
                        child: Icon(
                          Icons.monetization_on_outlined,
                          color: kLightGreen,
                          size: 32,
                        ),
                      ),
                      radius: 25,
                      strokeColor: kLightGreen,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomeText(
                          data: collectedPayment.title,
                          color: Colors.black,
                          size: 16,
                          weight: FontWeight.bold,
                        ),
                        TextWithIcon(
                          icon: Icons.access_time_filled,
                          text: "${getPeriod(collectedPayment.frequency)}",
                          textSize: 14,
                          iconSize: 14,
                          textColor: kGreyLight,
                          iconColor: Colors.grey,
                          weight: FontWeight.w100,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextWithIcon(
                  icon: Icons.history,
                  text: "${collectedPayment.frequency} Cycles",
                  textSize: 14,
                  iconSize: 16,
                  textColor: kGreyLight,
                  iconColor: Colors.grey,
                ),
                SizedBox(
                  height: 2.0,
                ),
                TextWithIcon(
                  icon: Icons.monetization_on,
                  text: "ETB ${double.parse(collectedPayment.amount).toInt()}",
                  textSize: 14,
                  iconSize: 16,
                  textColor: kGreyLight,
                  iconColor: Colors.grey,
                ),
                SizedBox(
                  height: 2.0,
                ),
                TextWithIcon(
                  icon: Icons.people,
                  text: "${collectedPayment.membersCount} Members",
                  textSize: 14,
                  iconSize: 16,
                  textColor: kGreyLight,
                  iconColor: Colors.grey,
                ),
              ],
            ),
            Positioned(
              bottom: 0.0,
              right: 5.0,
              child: Consumer<CollectedPayment>(
                builder: (ctx, collectedPayment, _) => IconButton(
                  icon: Icon(
                    collectedPayment.isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                  ),
                  onPressed: () {
                    collectedPayment.toggleBookmarkStatus();
                    showSnackbar(
                      context,
                      "Bookmarked ${collectedPayment.amount} payment",
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

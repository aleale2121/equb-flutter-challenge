import 'package:equb_flutter_challenge/providers/due_payments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'due_payment_item.dart';

class DuePaymentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DuePayments>(
      builder: (context, provider, child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10.0),
            itemCount: provider.duePayments.length,
            itemBuilder: (ctx, i) => PaymentItem(
              duePayment: provider.duePayments[i],
            ),
          ),
        );
      },
    );
  }
}

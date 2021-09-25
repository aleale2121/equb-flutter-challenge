import 'package:equb_flutter_challenge/providers/collected_payments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'collected_payment_item.dart';

class CollectedPaymentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CollectedPayments>(
      builder: (context, provider, child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            itemCount: provider.collectedPayments.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider(
              create: (c)=> provider.collectedPayments[i],
              builder: (c,_)=> CollectedPaymentItem(),
              // child: CollectedPaymentItem(
              //   collectedPayment: provider.collectedPayments[i],
              //   index: i,
              // ),
            ),
            // itemBuilder: (ctx, i) =>CollectedPaymentItem(
            //     collectedPayment: provider.collectedPayments[i],
            //     index: i,
            // ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,

            ),
          ),
        );
      },
    );
  }
}

import 'package:equb_flutter_challenge/providers/debts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class Toggler extends StatelessWidget {
  const Toggler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Debts>(
      builder: (context, provider, child) {
       return IconButton(
         onPressed: () {
           context.read<Debts>().toggleShowDebt();
         },
         icon: Icon(
          //  Icons.arrow_drop_up
           provider.showDebt ? Icons.arrow_drop_up : Icons.arrow_drop_down,
         ),
       );
      },
    );
  }
}

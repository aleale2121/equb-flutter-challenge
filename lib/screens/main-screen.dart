import 'package:equb_flutter_challenge/widgets/chart/debt_container.dart';
import 'package:equb_flutter_challenge/widgets/collected_payment/collected_payment_container.dart';
import 'package:equb_flutter_challenge/widgets/due_payment/due_payment_container.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 24.0),
          child: CircleAvatar(
            backgroundColor: Colors.deepPurple,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.bookmark, color: Colors.black))
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              DebtContainer(),
              SizedBox(height: 5,),
              DuePaymentContainer(),
              CollectedPaymentContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

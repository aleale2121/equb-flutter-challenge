import 'package:equb_flutter_challenge/constants/constants.dart';
import 'package:equb_flutter_challenge/providers/collected_payments.dart';
import 'package:equb_flutter_challenge/providers/due_payments.dart';
import 'package:equb_flutter_challenge/widgets/collected_payment/collected_payments_list.dart';
import 'package:equb_flutter_challenge/widgets/reusable/custom_text.dart';
import 'package:equb_flutter_challenge/widgets/reusable/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectedPaymentContainer extends StatefulWidget {
  const CollectedPaymentContainer({Key? key}) : super(key: key);

  @override
  _CollectedPaymentContainerState createState() =>
      _CollectedPaymentContainerState();
}

class _CollectedPaymentContainerState extends State<CollectedPaymentContainer> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<CollectedPayments>(context)
          .fetchAndSetCollectedPayments()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 4.0,
            ),
            margin: EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                RoundedButton(
                  text: "Money collected",
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  color: kLightGreen,
                  textColor: Colors.white70,
                  onPressed: () {},
                  borderRadius: 20,
                  textSize: 15,
                  elevation: 1.0,
                  textWeight: FontWeight.bold,
                  borderColor: kLightGreen,
                  borderThicknes: 1.0,
                ),
                SizedBox(
                  width: 20,
                ),
                RoundedButton(
                  text: "Money Due",
                  width: MediaQuery.of(context).size.width / 3,
                  height: 35,
                  color: Colors.white,
                  textColor: kGreyDeep,
                  onPressed: () {},
                  borderRadius: 20,
                  textSize: 15,
                  elevation: 0.0,
                  textWeight: FontWeight.bold,
                  borderColor: kGreyLight,
                  borderThicknes: 0.5,
                ),
              ],
            ),
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CollectedPaymentsList(),
        ],
      ),
    );
  }
}

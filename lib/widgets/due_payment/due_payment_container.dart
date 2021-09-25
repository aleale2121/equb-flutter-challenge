import 'package:equb_flutter_challenge/providers/due_payments.dart';
import 'package:equb_flutter_challenge/widgets/due_payment/due_payments_list.dart';
import 'package:equb_flutter_challenge/widgets/reusable/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DuePaymentContainer extends StatefulWidget {
  const DuePaymentContainer({Key? key}) : super(key: key);

  @override
  _DuePaymentContainerState createState() => _DuePaymentContainerState();
}

class _DuePaymentContainerState extends State<DuePaymentContainer> {
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
      Provider.of<DuePayments>(context).fetchAndSetDuePayments().then((_) {
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
            margin: EdgeInsets.only(left: 12.0),
            child: CustomeText(
              data: "Due Payments",
              color: Colors.black,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : DuePaymentsList(),
        ],
      ),
    );
  }
}

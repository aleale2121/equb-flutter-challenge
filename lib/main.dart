import 'package:equb_flutter_challenge/models/collected_payment.dart';
import 'package:equb_flutter_challenge/providers/collected_payments.dart';
import 'package:equb_flutter_challenge/providers/due_payments.dart';
import 'package:equb_flutter_challenge/route/route.dart';
import 'package:equb_flutter_challenge/screens/main-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:equb_flutter_challenge/providers/debts.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Debts()),
        ChangeNotifierProvider(create: (_) => DuePayments()),
        ChangeNotifierProvider(create: (_) => CollectedPayments()),
      ],
      child: MaterialApp(
        title: 'APP',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: AppRoutes.generateRoute,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => MainScreen());
        },
      ),
    );
  }
}

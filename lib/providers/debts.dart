import 'package:equb_flutter_challenge/models/debt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Depts with ChangeNotifier {
  List<Dept> _depts = [
    Dept(
      bankName: "Abysinia Bank",
      deptAmount: 4000,
      color: Colors.redAccent.shade100,
    ),
    Dept(
      bankName: "Dashen Bank",
      deptAmount: 8000,
      color: Colors.redAccent,
    ),
    Dept(
      bankName: "Commercial Bank of Ethiopia",
      deptAmount: 10000,
      color: Colors.deepPurple,
    ),
    Dept(
      bankName: "Berhan Bank",
      deptAmount: 3200,
      color: Colors.lightBlue,
    ),
    Dept(
      bankName: "Enat Bank",
      deptAmount: 4800,
     color: Colors.lightGreen,
    ),
    Dept(
      bankName: "Wegagen Bank",
      deptAmount: 9200,
      color: Colors.amber,
    ),
  ];

  List<Dept> get depts {
    return [..._depts];
  }
}

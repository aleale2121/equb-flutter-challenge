import 'package:equb_flutter_challenge/models/debt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Debts with ChangeNotifier, DiagnosticableTreeMixin {
  List<Debt> _depts = [
    Debt(
      bankName: "Abysinia Bank",
      deptAmount: 4000,
      color: Colors.redAccent.shade100,
    ),
    Debt(
      bankName: "Dashen Bank",
      deptAmount: 8000,
      color: Colors.redAccent,
    ),
    Debt(
      bankName: "Commercial Bank of Ethiopia",
      deptAmount: 10000,
      color: Colors.deepPurple,
    ),
    Debt(
      bankName: "Berhan Bank",
      deptAmount: 3200,
      color: Colors.lightBlue,
    ),
    Debt(
      bankName: "Enat Bank",
      deptAmount: 4800,
      color: Colors.lightGreen,
    ),
    Debt(
      bankName: "Wegagen Bank",
      deptAmount: 10000,
      color: Colors.amber,
    ),
  ];
  int _selectedIndex = 0;

  bool _showDebts = true;

  List<Debt> get depts {
    return [..._depts];
  }

  int get selectedIndex {
    return _selectedIndex;
  }

  double get total {
    double total = 0;
    for (var dept in depts) {
      total += dept.deptAmount;
    }
    return total;
  }

  bool get showDebt=>_showDebts;

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void toggleShowDebt() {
    _showDebts = !_showDebts;
    notifyListeners();

  }

  double percentValue(double amount) {
    double total = 0;
    for (var dept in depts) {
      total += dept.deptAmount;
    }
    return total == 0 ? total : (amount / total) * 100;
  }
}

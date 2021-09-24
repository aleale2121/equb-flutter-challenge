import 'dart:convert';

import 'package:equb_flutter_challenge/models/due_payment.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DuePayments with ChangeNotifier, DiagnosticableTreeMixin {
  List<DuePayment> _duePayments = [];

  List<DuePayment> get duePayments {
    return [..._duePayments];
  }

  Future<void> fetchAndSetDuePayments() async {
    final url = 'https://610e396448beae001747ba80.mockapi.io/duePayments';
    final response = await http.get(Uri.parse(url));
    try {
      final extractedData = json.decode(response.body) as List<dynamic>;
      List<DuePayment> _loadeduePayments = [];
      List<String> pathes = [
        "assets/images/dashen.png",
        "assets/images/abysinia.png",
        "assets/images/enat.png",
      ];
      List<String> bankNames = [
        "Dashen Bank",
        "Abysinia Bank",
        "Enat bank",
      ];
      int i = 0;
      extractedData.forEach((json) {
        _loadeduePayments.add(DuePayment.fromJson(json));
        _loadeduePayments[i].name = bankNames[i];
        _loadeduePayments[i].imagePath = pathes[i];
        i++;
      });
      _duePayments = _loadeduePayments.toList();
      notifyListeners();
    } catch (e) {
      print("exception");
      print(e);
    }
  }
}

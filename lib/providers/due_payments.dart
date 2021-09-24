import 'dart:convert';

import 'package:equb_flutter_challenge/models/due_payment.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DuePayments with ChangeNotifier, DiagnosticableTreeMixin {
  List<DuePayment> _duePayments = [];

  List<DuePayment> get duePayments {
    return [..._duePayments];
  }

  Future<void> fetchAndSetOrders() async {
    final url = 'https://610e396448beae001747ba80.mockapi.io/collectedPayments';
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    List<DuePayment> _loadeduePayments = [];
    List<String> pathes = [
      "/assets/images/dashen.png",
      "/assets/images/abysinia.png",
      "/assets/images/enat.png",
    ];
    List<String> bankNames = [
      "Dashen Bank",
      "Abysinia Bank",
      "Enat bank",
    ];
    int i = 0;
    extractedData.forEach((id, json) {
      _loadeduePayments.add(DuePayment.fromJson(json));
      _loadeduePayments[i].name = bankNames[i];
      _loadeduePayments[i].imagePath = pathes[i];

    });
    _duePayments = _loadeduePayments.reversed.toList();
    notifyListeners();
  }
}

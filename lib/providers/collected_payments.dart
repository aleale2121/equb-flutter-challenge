import 'dart:convert';

import '../models/collected_payment.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CollectedPayments with ChangeNotifier, DiagnosticableTreeMixin {
  List<CollectedPayment> _collectedPayments = [];

  List<CollectedPayment> get duePayments {
    return [..._collectedPayments];
  }

  Future<void> fetchAndSetCollectedPayments() async {
    final url = 'https://610e396448beae001747ba80.mockapi.io/collectedPayments';
    final response = await http.get(Uri.parse(url));
    try {
      final extractedData = json.decode(response.body) as List<dynamic>;
      List<CollectedPayment> _loadeduePayments = [];
      extractedData.forEach((json) {
        _loadeduePayments.add(CollectedPayment.fromJson(json));
      });
      _collectedPayments = _loadeduePayments.toList();
      notifyListeners();
    } catch (e) {
      print("exception");
      print(e);
    }
  }
}

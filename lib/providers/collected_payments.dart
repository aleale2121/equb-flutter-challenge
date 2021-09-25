import 'dart:convert';

import '../models/collected_payment.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CollectedPayments with ChangeNotifier, DiagnosticableTreeMixin {
  List<CollectedPayment> _collectedPayments = [];

  List<CollectedPayment> get collectedPayments {
    return [..._collectedPayments];
  }

  Future<void> fetchAndSetCollectedPayments() async {
    final url = 'https://610e396448beae001747ba80.mockapi.io/collectedPayments';
    final response = await http.get(Uri.parse(url));
    // print(response.body);
    try {
      final extractedData = json.decode(response.body) as List<dynamic>;
      List<CollectedPayment> _loadeduePayments = [];
      List<String> names = [
        "Salery",
        "Travel Stipend",
        "Rent Contract",
        "Equb",
        "Profit Shares",
        "Freelance",
        "Salery",
        "Travel Stipend",
        "Rent Contract",
        "Equb",
        "Profit Shares",
        "Freelance",
      ];
      int i = 0;
      extractedData.forEach((json) {
        _loadeduePayments.add(CollectedPayment.fromJson(json));
        _loadeduePayments[i].title = names[i];
        _loadeduePayments[i].isBookmarked = false;
        i++;
      });
      _collectedPayments = _loadeduePayments.toList();
      notifyListeners();
    } catch (e) {
      print("exception");
      print(e);
    }
  }
}

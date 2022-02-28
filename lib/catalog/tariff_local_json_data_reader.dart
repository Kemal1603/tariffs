import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_task2/catalog/models/tariff.dart';
import 'package:test_task2/utils/app_json.dart';

class TariffLocalJsonDataReader {
  Future<List<Tariff>> getAllTariff() async {
    final String response = await rootBundle.loadString(AppJson.data);
    final List<dynamic> data = await json.decode(response);
    return List.from(data.map((dynamic json) => Tariff.fromJson(json)));
  }
}

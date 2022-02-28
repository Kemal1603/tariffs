import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_task2/catalog/catalog.dart';
import 'package:test_task2/utils/app_json.dart';
import 'package:test_task2/utils/app_strings.dart';

const _delay = Duration(milliseconds: 10);

class TariffRepository {
  final _items = <Tariff>[];

  Future<List<Tariff>> loadCatalog() async {
    final String response = await rootBundle.loadString(AppJson.data);
    final List<dynamic> data = await json.decode(response);
    return List.from(data.map((dynamic json) => Tariff.fromJson(json)));
  }

  Future<List<Tariff>> loadCalculatorItems() => Future.delayed(_delay, () => _items);

  Future<bool> isGrownOnBoard() {
    if (_items.isEmpty) return Future.delayed(_delay, () => false);
    return Future.delayed(
      _delay,
      () => _items.any((element) => (element.ageCondition.contains(AppStrings.grown))),
    );
  }

  void addItemToCalculator(Tariff item) => _items.add(item);

  void removeItemFromCalculator(Tariff item) => _items.remove(item);
}

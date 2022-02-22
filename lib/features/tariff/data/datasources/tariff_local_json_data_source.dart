import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_task2/features/tariff/data/models/tariff_model.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_json.dart';

abstract class TariffLocalJsonDataSource {
  Future<List<TariffModel>>getAllTariff();
}

class TariffLocalJsonDataSourceImpl implements TariffLocalJsonDataSource{
  @override
  Future<List<TariffModel>> getAllTariff() async {
    final String response = await rootBundle.loadString(AppJson.data);
    final List<dynamic> data = await json.decode(response);
    return List.from(data.map((dynamic json) => TariffModel.fromJson(json)));
  }

}
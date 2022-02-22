import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task2/features/tariff/data/datasources/tariff_local_json_data_source.dart';
import 'package:test_task2/features/tariff/data/models/tariff_model.dart';

void main()  async{
  TariffLocalJsonDataSourceImpl dataSourceImpl = TariffLocalJsonDataSourceImpl();
  TestWidgetsFlutterBinding.ensureInitialized();
  final dynamic response = await rootBundle.loadString('test/fixtures/data_test.json');
  final TariffModel tariffModel = TariffModel.fromJson(jsonDecode(response));

  test(
    'should read JSON from data_test.json and compare with actual list',
    () async {
      //act
      final result = await dataSourceImpl.getAllTariff();
      //assert
      expect(result[1], tariffModel);
    },
  );
}
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_task2/features/tariff/data/models/tariff_model.dart';
import 'package:test_task2/features/tariff/domain/entities/tariff_entity.dart';

void main() {
  const tTariffModel = TariffModel(
    ageCondition: 'Взрослый',
    additionalInfo: 'с пропиской в Камчатском крае',
    price: 18000,
  );

  test(
    'should be a subclass of tariff entity',
    () async {
      //assert
      expect(tTariffModel, isA<TariffEntity>());
    },
  );

  group('Json Tests', () {
    test(
      'should return valid model with a  a price from Json',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap = json.decode(File('test/fixtures/data_test.json').readAsStringSync());
        //act
        final result = TariffModel.fromJson(jsonMap);
        //assert
        expect(result.price, isA<int>());
      },
    );

    test(
      'should return JSON map (toJson method)',
      () async {
        //act
        final result = tTariffModel.toJson();
        //assert
        expect(result, {
          "ageCondition": "Взрослый",
          "additionalInfo": "с пропиской в Камчатском крае",
          "price": 18000,
        });
      },
    );
  });
}

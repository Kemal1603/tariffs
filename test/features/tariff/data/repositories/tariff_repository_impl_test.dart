
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_task2/features/tariff/data/datasources/tariff_local_json_data_source.dart';
import 'package:test_task2/features/tariff/data/models/tariff_model.dart';
import 'package:test_task2/features/tariff/data/repositories/tariff_repository_impl.dart';

import 'tariff_repository_impl_test.mocks.dart';

@GenerateMocks([TariffLocalJsonDataSource])
void main() {
  TariffLocalJsonDataSource mockLocalJsonDataSource = MockTariffLocalJsonDataSource();
  TariffRepositoryImpl repositoryImpl = TariffRepositoryImpl(
    localJsonDataSource: mockLocalJsonDataSource,
  );

  const List<TariffModel> tTariffs = [
    TariffModel(
      ageCondition: 'Взрослый',
      additionalInfo: 'test',
      price: 64386,
    ),
    TariffModel(
      ageCondition: 'test',
      additionalInfo: 'с пропиской в Камчатском крае',
      price: 18000,
    ),
    TariffModel(
      ageCondition: 'Ребенок 2-12 лет',
      additionalInfo: 'test',
      price: 9000,
    ),
  ];

  group('TariffLocalJsonDataSource check', (){
    test(
      'should return local data when call to the mockLocalJsonDataSource is success',
      () async {
        //arrange
        when(mockLocalJsonDataSource.getAllTariff())
            .thenAnswer((_) async => tTariffs);
        //act
        final result = await repositoryImpl.getAllTariffs();
        //assert
        verify(mockLocalJsonDataSource.getAllTariff());
        expect(result, const Right(tTariffs));
      },
    );
  }
  );

}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_task2/core/usecases/usecase.dart';
import 'package:test_task2/features/tariff/domain/entities/tariff_entity.dart';
import 'package:test_task2/features/tariff/domain/repositories/tariff_repository.dart';
import 'package:test_task2/features/tariff/domain/usecases/get_all_tariffs.dart';

import 'get_all_tariffs_test.mocks.dart';

@GenerateMocks([TariffRepository])
void main() {
  TariffRepository tariffRepository = MockTariffRepository();
  GetAllTariffs usecase = GetAllTariffs(tariffRepository);

  const List<TariffEntity> tTariffs = [
    TariffEntity(
      ageCondition: 'Взрослый',
      additionalInfo: 'test',
      price: 64386,
    ),
    TariffEntity(
      ageCondition: 'test',
      additionalInfo: 'с пропиской в Камчатском крае',
      price: 18000,
    ),
    TariffEntity(
      ageCondition: 'Ребенок 2-12 лет',
      additionalInfo: 'test',
      price: 9000,
    ),
  ];

  test(
    'should get all tariffs from repository',
    () async {
      //arrange
      when(tariffRepository
          .getAllTariffs())
          .thenAnswer((_) async => const Right(tTariffs));
      //act
      final result = await usecase(NoParams());
      //assert
      expect(result, const Right(tTariffs));
      verify(tariffRepository.getAllTariffs());
      verifyNoMoreInteractions(tariffRepository);
    },
  );
}

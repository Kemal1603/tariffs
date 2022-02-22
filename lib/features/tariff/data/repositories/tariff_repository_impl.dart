import 'package:dartz/dartz.dart';
import 'package:test_task2/core/error/failure.dart';
import 'package:test_task2/features/tariff/data/datasources/tariff_local_json_data_source.dart';
import 'package:test_task2/features/tariff/domain/entities/tariff_entity.dart';
import 'package:test_task2/features/tariff/domain/repositories/tariff_repository.dart';

class TariffRepositoryImpl implements TariffRepository {
  final TariffLocalJsonDataSource localJsonDataSource;

  TariffRepositoryImpl({required this.localJsonDataSource});



  @override
  Future<Either<Failure, List<TariffEntity>>> getAllTariffs() async {
    return Right(await localJsonDataSource.getAllTariff());
  }
}
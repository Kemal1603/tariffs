import 'package:dartz/dartz.dart';
import 'package:test_task2/core/error/failure.dart';
import 'package:test_task2/features/tariff/domain/entities/tariff_entity.dart';

abstract class TariffRepository {
 Future<Either<Failure, List<TariffEntity>>> getAllTariffs();
}
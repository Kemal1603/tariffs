import 'package:dartz/dartz.dart';
import 'package:test_task2/core/error/failure.dart';
import 'package:test_task2/core/usecases/usecase.dart';
import 'package:test_task2/features/tariff/domain/entities/tariff_entity.dart';
import 'package:test_task2/features/tariff/domain/repositories/tariff_repository.dart';

class GetAllTariffs implements UseCase<List<TariffEntity>, NoParams>{
  final TariffRepository repository;

  GetAllTariffs(this.repository);

  @override
  Future<Either<Failure, List<TariffEntity>>> call(NoParams params) async {
    return await repository.getAllTariffs();
  }
}

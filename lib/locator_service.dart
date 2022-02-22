import 'package:get_it/get_it.dart';
import 'package:test_task2/features/tariff/data/datasources/tariff_local_json_data_source.dart';
import 'package:test_task2/features/tariff/data/repositories/tariff_repository_impl.dart';
import 'package:test_task2/features/tariff/domain/repositories/tariff_repository.dart';
import 'package:test_task2/features/tariff/domain/usecases/get_all_tariffs.dart';
import 'package:test_task2/features/tariff/presentation/cubit/tariff_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerFactory(() => TariffCubit(getAllTariffs: serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetAllTariffs(serviceLocator()));
  serviceLocator.registerLazySingleton<TariffRepository>(() => TariffRepositoryImpl(
        localJsonDataSource: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton<TariffLocalJsonDataSource>(
    () => TariffLocalJsonDataSourceImpl(),
  );
}

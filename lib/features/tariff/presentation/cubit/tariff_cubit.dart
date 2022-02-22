import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task2/core/error/failure.dart';
import 'package:test_task2/core/usecases/usecase.dart';
import 'package:test_task2/features/tariff/data/models/tariff_model.dart';
import 'package:test_task2/features/tariff/domain/entities/tariff_entity.dart';
import 'package:test_task2/features/tariff/domain/usecases/get_all_tariffs.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_strings.dart';

part 'tariff_state.dart';

class TariffCubit extends Cubit<TariffState> {
  final GetAllTariffs getAllTariffs;

  TariffCubit({required this.getAllTariffs}) : super(TariffInitialState());

  Future<void> fetchTariffs() async {
    emit(TariffLoadingState());
    Either<Failure, List<TariffEntity>> _failureOrLoaded = await getAllTariffs(NoParams());
    _failureOrLoaded.fold(
      (error) => emit(const TariffErrorState(errorMessage: AppStrings.cubitErrorMessage)),
      (tariffList) => emit(TariffLoadedState(tariffList: tariffList)),
    );
  }

  Future<void> quantityCalculation(int index, String operation) async {
    final List<TariffModel> _temporary = [];
    bool _grownOnBoard = (state.props as List<TariffModel>)
        .any((element) => (element.ageCondition.contains(AppStrings.grown) && element.quantity > 0));
    for (TariffModel model in (state.props as List<TariffModel>)) {
      if (state.props[index] == model) {
        if ((model.ageCondition == AppStrings.babyUnder2YearsOld && _grownOnBoard)
            || model.ageCondition != AppStrings.babyUnder2YearsOld) {
          _temporary.add(TariffModel(
              price: model.price,
              additionalInfo: model.additionalInfo,
              ageCondition: model.ageCondition,
              quantity: operation == AppStrings.increment ? model.quantity + 1 : model.quantity - 1));
        } else {
          _temporary.add(model);
        }
      } else {
        _temporary.add(model);
      }
    }

    emit(TariffLoadedState(tariffList: _temporary));
  }

}

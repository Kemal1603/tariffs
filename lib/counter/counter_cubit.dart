import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task2/catalog/catalog.dart';
import 'package:test_task2/utils/app_strings.dart';

class CounterCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void increment({required Tariff item, required bool grownOnBoard}) async {
    if (grownOnBoard || item.ageCondition != AppStrings.babyUnder2YearsOld) {
      emit(state + 1);
    }
  }

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task2/features/tariff/presentation/cubit/tariff_cubit.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_calculations.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_strings.dart';
import 'package:test_task2/features/tariff/presentation/widgets/tariff_list_item.dart';
import 'package:test_task2/features/tariff/presentation/widgets/total_cost.dart';

class TariffList extends StatelessWidget {
  const TariffList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TariffCubit, TariffState>(builder: (
      BuildContext context,
      TariffState state,
    ) {
      if (state is TariffEmptyState) {
        return const Center(
          child: Text(AppStrings.tariffEmptyState),
        );
      }

      if (state is TariffLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is TariffLoadedState) {
        return ListView.builder(
          itemCount: state.tariffList.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < state.tariffList.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TariffListItem(
                  model: state.tariffList[index],
                  index: index,
                ),
              );
            } else {
                int _totalPassengersQuantity = AppCalculations.totalPassengersQuantity(state.tariffList);
                if(_totalPassengersQuantity > 0){
                  return TotalCost(
                    totalPassengersQuantity: _totalPassengersQuantity,
                    totalAmount: AppCalculations.totalAmount(state.tariffList),
                  );
                }else{
                  return Container();
                }
            }
          },
        );
      }
      if (state is TariffErrorState) {
        return Center(
          child: Text(
            state.errorMessage,
            style: const TextStyle(fontSize: 20.0),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}

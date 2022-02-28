import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task2/calculator/bloc/calculator_bloc.dart';
import 'package:test_task2/catalog/models/tariff.dart';
import 'package:test_task2/catalog/view/warning_row.dart';
import 'package:test_task2/counter/counter_cubit.dart';
import 'package:test_task2/utils/app_colors.dart';
import 'package:test_task2/utils/app_icons.dart';
import 'package:test_task2/utils/app_strings.dart';

class CatalogListItem extends StatelessWidget {
  final Tariff item;

  const CatalogListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (BuildContext context, int state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.mainContainerBackgroundColor,
            border: Border.all(color: AppColors.mainContainerBorder(state)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.ageCondition,
                style: const TextStyle(
                  color: AppColors.mainBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(item.additionalInfo, style: const TextStyle(color: AppColors.mainGrey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.ruble),
                      const SizedBox(width: 8),
                      Text(
                        AppStrings.processPrices(item.price),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          AppIcons.decrement,
                          color: AppColors.decrementButtonColor(state),
                        ),
                        onPressed: () {
                          if (state > 0) {
                            context.read<CalculatorBloc>().add(CalculatorItemRemoved(item));
                            context.read<CounterCubit>().decrement();
                          }
                        },
                      ),
                      Text(
                        state.toString(),
                        style: const TextStyle(
                          color: AppColors.mainBlue,
                          fontSize: 16.8,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          AppIcons.increment,
                          color: AppColors.incrementButtonColor(state),
                        ),
                        onPressed: () async {
                          if (state < 10) {
                            context.read<CalculatorBloc>().add(CalculatorItemAdded(item));
                            context.read<CounterCubit>().increment(
                                  item: item,
                                  grownOnBoard: await context.read<CalculatorBloc>().isGrownOnBoard(),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              if (state > 0 && AppStrings.processWarningMessage(item.additionalInfo) != '')
                WarningRow(additionalInfo: item.additionalInfo),
            ],
          ),
        );
      },
    );
  }
}

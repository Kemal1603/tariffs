import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task2/features/tariff/domain/entities/tariff_entity.dart';
import 'package:test_task2/features/tariff/presentation/cubit/tariff_cubit.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_colors.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_icons.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_strings.dart';
import 'package:test_task2/features/tariff/presentation/widgets/warning_row.dart';

class TariffListItem extends StatelessWidget {
  final TariffEntity model;
  final int index;

  const TariffListItem({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.mainContainerBackgroundColor,
        border: Border.all(color: AppColors.mainContainerBorder(model.quantity)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: '${model.ageCondition} \n',
                  style: const TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: model.additionalInfo,
                  style: const TextStyle(color: AppColors.mainGrey),
                )
              ]))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppIcons.ruble),
                  const SizedBox(width: 8),
                  Text(
                    AppStrings.processPrices(model.price),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (model.quantity > 0) {
                          BlocProvider.of<TariffCubit>(context).quantityCalculation(index, AppStrings.decrement);
                        }
                      },
                      icon: SvgPicture.asset(
                        AppIcons.decrement,
                        color: AppColors.decrementButtonColor(model.quantity),
                      )),
                  Text('${model.quantity}',
                      style: const TextStyle(
                        color: AppColors.mainBlue,
                        fontSize: 16.8,
                        fontWeight: FontWeight.normal,
                      )),
                  IconButton(
                      onPressed: () {
                        if (model.quantity < 10) {
                          BlocProvider.of<TariffCubit>(context).quantityCalculation(index, AppStrings.increment);
                        }
                      },
                      icon: SvgPicture.asset(
                        AppIcons.increment,
                        color: AppColors.incrementButtonColor(model.quantity),
                      )),
                ],
              ),
            ],
          ),
          if (model.quantity > 0 && AppStrings.processWarningMessage(model.additionalInfo) != '')
            WarningRow(additionalInfo: model.additionalInfo),
        ],
      ),
    );
  }
}

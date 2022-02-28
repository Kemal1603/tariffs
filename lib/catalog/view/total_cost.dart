import 'package:flutter/material.dart';
import 'package:test_task2/utils/app_colors.dart';
import 'package:test_task2/utils/app_strings.dart';

class TotalCost extends StatelessWidget {
  final int totalPassengersQuantity;
  final int totalAmount;
  const TotalCost({
    Key? key,
    required this.totalPassengersQuantity,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.totalCost,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.mainBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.processTotalPassengersText(totalPassengersQuantity),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  totalAmount == 0 ? '0' : AppStrings.processPrices(totalAmount),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

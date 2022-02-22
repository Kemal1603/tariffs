import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task2/features/tariff/domain/entities/tariff_entity.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_colors.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_icons.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_strings.dart';


class WarningRow extends StatelessWidget {
  final String additionalInfo;

  const WarningRow({
    Key? key,
    required this.additionalInfo,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppIcons.warning),
          const SizedBox(width: 8),
          Text(AppStrings.processWarningMessage(additionalInfo),
              style: const TextStyle(color: AppColors.mainGrey,))
        ],
      ),
    );
  }
}
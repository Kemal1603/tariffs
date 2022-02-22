import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_colors.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_icons.dart';
import 'package:test_task2/features/tariff/presentation/utils/app_strings.dart';
import 'package:test_task2/features/tariff/presentation/widgets/tariff_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(AppIcons.profile),
                ],
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(AppStrings.tariffs,
                      style: TextStyle(
                          color: AppColors.mainBlue,
                          fontSize: 32,
                          fontWeight: FontWeight.bold))),
              const Expanded(child: TariffList()),
            ],
          ),
        ),
      ),
    );
  }
}

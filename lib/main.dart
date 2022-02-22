import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task2/features/tariff/presentation/cubit/tariff_cubit.dart';
import 'package:test_task2/features/tariff/presentation/pages/tariff_screen.dart';
import 'package:test_task2/locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<TariffCubit>(
        // ADD IMMEDIATELY fetchLessons METHOD TO GET FULL LIST OF LESSONS
        create: (context) => di.serviceLocator<TariffCubit>()..fetchTariffs(),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: const HomePage(),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task2/calculator/calculator.dart';
import 'package:test_task2/catalog/catalog.dart';
import 'package:test_task2/catalog/view/home_page.dart';
import 'package:test_task2/tariff_repository.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.tariffRepository}) : super(key: key);

  final TariffRepository tariffRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatalogBloc(tariffRepository: tariffRepository)..add(CatalogStarted()),
        ),
        BlocProvider(
          create: (_) => CalculatorBloc(tariffRepository: tariffRepository)..add(CalculatorStarted()),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Bloc Tariff Calculator',
        home: HomePage(),
      ),
    );
  }
}

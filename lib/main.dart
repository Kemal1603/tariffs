import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task2/app.dart';
import 'package:test_task2/simple_bloc_observer.dart';
import 'package:test_task2/tariff_repository.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(App(tariffRepository: TariffRepository())),
    blocObserver: SimpleBlocObserver(),
  );
}

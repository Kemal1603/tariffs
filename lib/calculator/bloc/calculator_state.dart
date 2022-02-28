part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState extends Equatable {
  const CalculatorState();
}

class CalculatorLoading extends CalculatorState {
  @override
  List<Object> get props => [];
}

class CalculatorLoaded extends CalculatorState {
  const CalculatorLoaded({this.calculator = const Calculator()});

  final Calculator calculator;

  @override
  List<Object> get props => [calculator];
}

class CalculatorError extends CalculatorState {
  @override
  List<Object> get props => [];
}

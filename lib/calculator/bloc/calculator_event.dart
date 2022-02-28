part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
}

class CalculatorStarted extends CalculatorEvent {
  @override
  List<Object> get props => [];
}

class CalculatorItemAdded extends CalculatorEvent {
  const CalculatorItemAdded(this.item);

  final Tariff item;

  @override
  List<Object> get props => [item];
}

class CalculatorItemRemoved extends CalculatorEvent {
  const CalculatorItemRemoved(this.item);

  final Tariff item;

  @override
  List<Object> get props => [item];
}

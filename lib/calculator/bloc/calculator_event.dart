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
  final Tariff item;

  const CalculatorItemAdded(this.item);

  @override
  List<Object> get props => [item];
}

class CalculatorItemRemoved extends CalculatorEvent {
  final Tariff item;

  const CalculatorItemRemoved(this.item);

  @override
  List<Object> get props => [item];
}

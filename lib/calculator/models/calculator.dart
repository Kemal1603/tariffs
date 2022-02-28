import 'package:equatable/equatable.dart';
import 'package:test_task2/catalog/models/tariff.dart';

class Calculator extends Equatable {
  final List<Tariff> items;

  const Calculator({this.items = const <Tariff>[]});

  int get totalPrice {
    return items.fold(0, (int total, Tariff current) => total + current.price);
  }

  @override
  List<Object> get props => [items];
}

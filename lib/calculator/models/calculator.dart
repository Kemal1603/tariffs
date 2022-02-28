import 'package:equatable/equatable.dart';
import 'package:test_task2/catalog/models/tariff.dart';

class Calculator extends Equatable {
  const Calculator({this.items = const <Tariff>[]});

  final List<Tariff> items;

  int get totalPrice {
    return items.fold(0, (total, current) => total + current.price);
  }

  @override
  List<Object> get props => [items];
}

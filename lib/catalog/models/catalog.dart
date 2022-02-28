import 'package:equatable/equatable.dart';
import 'package:test_task2/catalog/models/tariff.dart';

class Catalog extends Equatable {
  final List<Tariff> itemNames;

  const Catalog({required this.itemNames});

  Tariff getById(int id) => Tariff(
        id: id,
        additionalInfo: itemNames[id].additionalInfo,
        ageCondition: itemNames[id].ageCondition,
        price: itemNames[id].price,
      );

  Tariff getByPosition(int position) => getById(position);

  @override
  List<Object> get props => [itemNames];
}

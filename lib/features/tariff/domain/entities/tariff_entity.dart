import 'package:equatable/equatable.dart';

class TariffEntity extends Equatable {
  final String ageCondition;
  final String additionalInfo;
  final int price;
  final int quantity;


  const TariffEntity({
    required this.ageCondition,
    required this.additionalInfo,
    required this.price,
    this.quantity = 0
  });

  @override
  List<Object?> get props => [ageCondition, additionalInfo, price, quantity];
}

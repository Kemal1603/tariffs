import 'package:test_task2/features/tariff/domain/entities/tariff_entity.dart';

class TariffModel extends TariffEntity {
  const TariffModel({
    required String ageCondition,
    required String additionalInfo,
    required int price,
    int quantity = 0,
  }) : super(
          ageCondition: ageCondition,
          additionalInfo: additionalInfo,
          price: price,
          quantity: quantity,
        );

  factory TariffModel.fromJson(Map<String, dynamic> json) {
    return TariffModel(
      ageCondition: json["ageCondition"],
      additionalInfo: json["additionalInfo"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ageCondition": ageCondition,
        "additionalInfo": additionalInfo,
        "price": price,
      };
}

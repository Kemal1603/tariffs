import 'package:equatable/equatable.dart';

class Tariff extends Equatable {
  /// Cannot be empty.
  final int id;

  /// The age condition for the tariff
  ///
  /// Cannot be empty
  final String ageCondition;

  /// Additional info for the tariff
  ///
  /// Can be empty
  final String additionalInfo;

  /// The associated cost
  ///
  final int price;

  const Tariff({
    this.id = 0,
    required this.ageCondition,
    required this.additionalInfo,
    required this.price,
  });

  factory Tariff.fromJson(Map<String, dynamic> json) {
    return Tariff(
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

  Tariff copyWith({
    int? id,
    String? ageCondition,
    String? additionalInfo,
    int? price,
  }) {
    return Tariff(
      id: id ?? this.id,
      ageCondition: ageCondition ?? this.ageCondition,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      price: price ?? this.price,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, ageCondition, additionalInfo, price];
}

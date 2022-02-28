// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
//
// @immutable
//
// /// our tariff model
// class Tariff extends Equatable {
//   /// {@macro todo}
//   Tariff({
//     this.id = 0,
//     required this.ageCondition,
//     required this.additionalInfo,
//     required this.price,
//   });
//
//   /// The unique identifier of the todo.
//   ///
//   /// Cannot be empty.
//   final int id;
//
//   /// The age condition for the tariff
//   ///
//   /// Cannot be empty
//   final String ageCondition;
//
//   /// Additional info for the tariff
//   ///
//   /// Can be empty
//   final String additionalInfo;
//
//   /// The associated cost
//   ///
//   final int price;
//
//   /// fromJson method
//   static Tariff fromJson(Map<String, dynamic> json) => Tariff(
//         id: json['id'],
//         ageCondition: json['ageCondition'],
//         additionalInfo: json['additionalInfo'],
//         price: json['price'],
//       );
//
//   /// toJson Method
//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'id': id,
//         'ageCondition': ageCondition,
//         'additionalInfo': additionalInfo,
//         'price': price,
//       };
//
//   @override
//   List<Object> get props => [id, ageCondition, additionalInfo, price];
//
//   ///copy with method
//   Tariff copyWith({
//     int? id,
//     String? ageCondition,
//     String? additionalInfo,
//     int? price,
//   }) {
//     return Tariff(
//       id: id ?? this.id,
//       ageCondition: ageCondition ?? this.ageCondition,
//       additionalInfo: additionalInfo ?? this.additionalInfo,
//       price: price ?? this.price,
//     );
//   }
// }


class Tariff  {

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
  }) ;

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
}
import 'package:test_task2/features/tariff/domain/entities/tariff_entity.dart';

abstract class AppCalculations {
  static int totalPassengersQuantity(List<TariffEntity> list){
    int total = 0;
    for(TariffEntity tariff in list){
      total += tariff.quantity;
    }
    return total;
  }

  static int totalAmount(List<TariffEntity> list){
    int total = 0;
    for(TariffEntity tariff in list){
      if(tariff.quantity > 0){
        total += tariff.quantity * tariff.price;
      }
    }
    return total;
  }
}
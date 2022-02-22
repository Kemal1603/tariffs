import 'package:basic_utils/basic_utils.dart';

abstract class AppStrings {
  static const String tariffs = 'Тарифы';
  static const String cubitErrorMessage = 'Couldn\'t find tariffs';
  static const String tariffEmptyState = 'Sorry something went wrong';
  static const String increment = 'increment';
  static const String decrement = 'decrement';
  static const String grown = 'Взрослый';
  static const String babyUnder2YearsOld = 'Ребенок до 2 лет';
  static const String totalCost = 'Общая стоимость';

  static String processPrices(int number) {
    if (number != 0) {
      var s = StringUtils.reverse(number.toString());
      s = StringUtils.addCharAtPosition(s, " ", 3, repeat: true);
      s = StringUtils.addCharAtPosition(s, '.p ', 0);
      return StringUtils.reverse(s);
    } else {
      return 'Бесплатно';
    }
  }

  static String processWarningMessage(String additionalInfo) {
    if (additionalInfo.contains('Камчатском')) {
      return 'при регистрации на рейс нужно\nпредъявить паспорт с регистрацией\nв Камчатском крае';
    } else if (additionalInfo.contains('РФ')) {
      return 'при регистрации на рейс нужно\nпредъявить документ,\nподтверждающий гражданство РФ';
    } else if (additionalInfo.contains('без места')) {
      return 'ребенок летит бесплатно, если\nсидит на коленях\nсопровождающего, не занимая\nотдельного места';
    } else {
      return '';
    }
  }

  static String processTotalPassengersText(int passengersQuantity){
    if(passengersQuantity == 0){
      return '0';
    }else if(passengersQuantity == 1){
      return '$passengersQuantity пассажир';
    }else if(passengersQuantity > 1 && passengersQuantity < 5){
      return '$passengersQuantity пассажира';
    }else{
      return '$passengersQuantity пассажиров';
    }
  }

}

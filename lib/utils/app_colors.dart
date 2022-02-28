import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color mainBlue = Color(0xFF1D89ED);
  static const Color mainGrey = Color(0xFF768899);
  static const Color mainContainerBackgroundColor = Color(0xFFEEF6FE);

   static Color mainContainerBorder(int quantity){
    if(quantity > 0){
      return mainBlue;
    } else {
      return  Colors.transparent;
    }
   }

   static Color decrementButtonColor(int quantity){
     if(quantity > 0){
       return  mainBlue;
     } else {
       return mainGrey;
     }
   }

  static Color incrementButtonColor(int quantity){
    if(quantity < 10){
      return  mainBlue;
    } else {
      return mainGrey;
    }
  }

}
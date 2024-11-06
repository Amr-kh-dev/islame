import 'package:flutter/material.dart';

class ProviedSebha with ChangeNotifier {
   int counter = 0;
   int index = 0;
   List<String> typesOfSebha = ['سبحان الله', 'الحمدلله', 'الله اكبر '];
  double angle = 0;
  void onZekerpreesde() {
    angle = angle + 0.5;
    counter++;
    if (counter % 33 == 0) {
      index++;
      if (index >= typesOfSebha.length) {
        index = 0;
      }
    }
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class SliderViewModel extends ChangeNotifier {
  double sliderValue = 0;

  // setter
  void sliderValueChange(double value) {
    sliderValue = value;
    notifyListeners();
  }
}

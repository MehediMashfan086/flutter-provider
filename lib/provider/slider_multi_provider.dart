import 'package:flutter/foundation.dart';

class SliderMultiProvider with ChangeNotifier {
  double _sliderValue = 1.0;
  double get value => _sliderValue;

  void setValue(double val) {
    _sliderValue = val;
    notifyListeners();
  }
}

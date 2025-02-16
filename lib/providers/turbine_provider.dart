import 'package:flutter/foundation.dart';

class TurbineModel extends ChangeNotifier {
  bool _isConnect = false;
  double _fillPercentage = 0.0;

  bool get isConnect => _isConnect;
  double get fillPercentage => _fillPercentage;

  void powerOn() {
    _isConnect = true;
    notifyListeners();
  }

  void powerOff() {
    _isConnect = false;
    notifyListeners();
  }

  void fillTo(double percentage) {
    if (percentage >= 0.0 && percentage <= 100.0) {
      _fillPercentage = percentage;
      notifyListeners();
    }
  }
}

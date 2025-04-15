import 'package:flutter/foundation.dart';
import 'package:smart_home_commander/service/turbine_mqtt_fake.dart';
import 'package:smart_home_commander/service/turbine/status.dart';

class TurbineProvider extends ChangeNotifier {
  bool _isConnect = false;
  int _levelPercent = 0;
  int _levelCistern = 100;
  int _levelStopTank = 100;
  int _rateFluxFlow = 0;

  TurbineMqtt? _turbineMqtt;

  bool get isConnect => _isConnect;
  int get levelPercent => _levelPercent;
  int get levelCistern => _levelCistern;
  int get levelStopTank => _levelStopTank;
  int get rateFluxFlow => _rateFluxFlow;

  TurbineProvider() {
    _turbineMqtt = TurbineMqtt(
        broker: "192.168.1.94",
        topic: "casa_rayner/turbina",
        topicAction: "casa_rayner/turbina/action");
    // Get status turbine stream
    _turbineMqtt?.status.listen((TurbineStatus status) => updateStatus(status));
  }

  // Update turbine status from stream
  Future<void> updateStatus(TurbineStatus status) async {
    _isConnect = status.running == 1 ? true : false;
    _levelPercent =
        status.levelPercent != null ? status.levelPercent as int : -1;
    _levelStopTank =
        status.levelPercentStop != null ? status.levelPercentStop as int : -1;
    _rateFluxFlow = status.rate != null ? status.rate as int : -1;
    notifyListeners();
  }

  Future<void> powerOn() async {
    await _turbineMqtt?.powerOn();
    notifyListeners();
  }

  Future<bool> powerOnWaitConfirm() async{
    await powerOn();
    for(int i=0; i<50; i++){
      if (_isConnect){
        return true;
      }
      await Future.delayed(const Duration(milliseconds: 100));
    }
    return false;
  }

  Future<void> powerOff() async {
    await _turbineMqtt?.powerOff();
    notifyListeners();
  }

  Future<bool> powerOffWaitConfirm() async{
    await powerOff();
    for(int i=0; i<50; i++){
      if (!_isConnect){
        return true;
      }
      await Future.delayed(const Duration(milliseconds: 100));
    }
    return false;
  }

  Future<void> togglePower() async {
    if (_isConnect) {
      powerOff();
    } else {
      powerOn();
    }
  }

  Future<bool> togglePowerWaitConfirm() async {
    if (_isConnect) {
      return await powerOffWaitConfirm();
    } else {
      return await powerOnWaitConfirm();
    }
  }

  void fillTo(int percentage) {
    if (percentage >= 0 && percentage <= 100) {
      _turbineMqtt?.stopLevel(percentage);
      notifyListeners();
    }
  }

  void saveSettings(
      {required String broker, required String route, String? action}) {
    _turbineMqtt =
        TurbineMqtt(broker: broker, topic: route, topicAction: action ?? '');
    // Get status turbine stream
    _turbineMqtt?.status.listen((TurbineStatus status) => updateStatus(status));
  }
}

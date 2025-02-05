import 'dart:async';
import 'package:logging/logging.dart';
import 'package:smart_home_commander/service/turbine/status.dart';

final log = Logger('Turbine MQTT');

class TurbineMqtt {
  final _status = StreamController<TurbineStatus>();
  Stream<TurbineStatus> get status => _status.stream;
  String broker;
  String topic;
  String topicAction;
  bool isConnect = false;
  TurbineStatus turbineStatus = TurbineStatus(
    running: 0,
    datetimeStart: DateTime.now(),
    secondsLeft: 0,
    levelPercent: 40,
    levelAdc: 340,
    levelPercentStop: 100,
    sensorMax: 0,
    rate: 0,
    forcePowerOff: 0,
    sunLight: 1,
    sunLightActive: 1,
    sunLightMaxPercent: 100,
    sunLightMinPercent: 80
  );

  TurbineMqtt({
    required this.broker,
    required this.topic,
    required this.topicAction
  }){
    _subscribe();
  }

  Future<void> _subscribe() async{
    int levelPercent = turbineStatus.levelPercent as int;
    int levelAdc = turbineStatus.levelAdc as int;
    while (true) {
      _status.add(turbineStatus);
      await Future.delayed(const Duration(seconds: 3));
      if (turbineStatus.running == 1){
        levelPercent ++;
        levelAdc += 4;
      }else{
        levelPercent --;
        levelAdc -= 4;
        if (levelPercent < 0){
          levelPercent = 0;
          levelAdc = 260;
        }
      }
      if (levelPercent >= 100){
        levelPercent = 100;
        turbineStatus.running = 0;
      }
      turbineStatus.levelPercent = levelPercent;
      turbineStatus.levelAdc = levelAdc;
    }
  }

  Future<void> stopLevel(int level) async{
    turbineStatus.levelPercentStop = level;
  }

  Future<void> powerOn() async{
    turbineStatus.running = 1;
  }

  Future<void> powerOff() async{
    turbineStatus.running = 0;
  }

}

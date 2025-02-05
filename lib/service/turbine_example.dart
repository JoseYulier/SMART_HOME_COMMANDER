
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:smart_home_commander/service/turbine/status.dart';
//import 'package:smart_home_commander/service/turbine_mqtt.dart'; // Trust turbine mqtt
import 'package:smart_home_commander/service/turbine_mqtt_fake.dart'; // Fake turbine mqtt

final log = Logger('Turbine MQTT');

Future<void> main() async{

  // Configuring Logging
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  
  // Create a turbine object
  final turbine = TurbineMqtt(broker: "192.168.1.94", topic: "casa_rayner/turbina", topicAction: "casa_rayner/turbina/action");

  // get status turbine stream
  turbine.status.listen((TurbineStatus status) {
    log.info("Turbine level: ${status.levelPercent}%");
  });

  // Set stop level tank to 90%
  await turbine.stopLevel(90);

  // Power on turbine
  await turbine.powerOn();

  // Wait 10 seconds with turbine in power on
  await Future.delayed(const Duration(seconds: 10));

  // Power off turbine
  await turbine.powerOff();

  // Set stop level tank to 100%
  await turbine.stopLevel(100);
  await Future.delayed(const Duration(seconds: 30));

  log.info("End program");
  exit(-1);
}

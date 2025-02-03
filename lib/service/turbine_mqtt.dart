import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:async';
import 'package:logging/logging.dart';
import 'package:smart_home_commander/service/turbine/action.dart';
import 'package:smart_home_commander/service/turbine/status.dart';

final log = Logger('Turbine MQTT');

class TurbineMqtt {
  final _status = StreamController<TurbineStatus>();
  Stream<TurbineStatus> get status => _status.stream;
  String broker;
  String topic;
  String topicAction;
  MqttServerClient? client;
  bool isConnect = false;

  TurbineMqtt({
    required this.broker,
    required this.topic,
    required this.topicAction
  }){
    client = MqttServerClient(broker, '');
    /// Set the correct MQTT protocol for mosquito
    client?.setProtocolV311();
    /// Add the unsolicited disconnection callback
    client?.onDisconnected = _onDisconnected;
    /// Add the successful connection callback
    client?.onConnected = _onConnected;
    _connect();
  }

  Future<void> _onDisconnected() async{
    isConnect = false;
    await Future.delayed(Duration(seconds: 5));
    _connect();
  }

  Future<void> _onConnected() async{
    isConnect = true;
  }

  Future<void> _subscribe() async{
    /// Check we are connected
    if (client?.connectionStatus!.state == MqttConnectionState.connected) {
      log.info('EXAMPLE::Mosquitto client connected');
        
    } else {
      /// Use status here rather than state if you also want the broker return code.
      log.warning(
          'ERROR Mosquitto client connection failed - disconnecting, status is ${client?.connectionStatus}');
      client?.disconnect();
    }
    /// Ok, lets try a subscription
    client?.subscribe(topic, MqttQos.atMostOnce);
    client?.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      TurbineStatus turbineStatus = TurbineStatus.fromJson(pt);
      _status.add(turbineStatus);
    });
    //client?.unsubscribe(topic);
  }

  Future<void> _connect() async{
    try {
      await client?.connect();
      await _subscribe();
    } on Exception catch (e) {
      log.severe('Client exception - $e');
      client?.disconnect();
    }
  }

  Future<void> sendAction(TurbineAction action) async{
    final builder = MqttClientPayloadBuilder();
    builder.addString(action.toJson());
    while(!isConnect){
      await Future.delayed(const Duration(milliseconds: 200));
    }
    client?.publishMessage(topicAction, MqttQos.atLeastOnce, builder.payload!);
  }

  Future<void> stopLevel(int level) async{
    TurbineAction action = TurbineAction(stopLevel: level);
    await sendAction(action);
  }

  Future<void> powerOn() async{
    TurbineAction action = const TurbineAction(power: true);
    await sendAction(action);
  }

  Future<void> powerOff() async{
    TurbineAction action = const TurbineAction(power: false);
      await sendAction(action);
  }

}

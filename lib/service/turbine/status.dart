import 'dart:convert';

class TurbineStatus {
  int? running;
  DateTime? datetimeStart;
  int? secondsLeft;
  int? levelPercent;
  int? levelAdc;
  int? levelPercentStop;
  int? sensorMax;
  int? rate;
  int? forcePowerOff;
  int? sunLight;
  int? sunLightActive;
  int? sunLightMaxPercent;
  int? sunLightMinPercent;

  TurbineStatus({
    this.running,
    this.datetimeStart,
    this.secondsLeft,
    this.levelPercent,
    this.levelAdc,
    this.levelPercentStop,
    this.sensorMax,
    this.rate,
    this.forcePowerOff,
    this.sunLight,
    this.sunLightActive,
    this.sunLightMaxPercent,
    this.sunLightMinPercent,
  });

  factory TurbineStatus.fromJson(String str) => TurbineStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TurbineStatus.fromMap(Map<String, dynamic> json) => TurbineStatus(
    running: json["running"],
    datetimeStart: json["datetime_start"] == null ? null : DateTime.parse(json["datetime_start"]),
    secondsLeft: json["seconds_left"],
    levelPercent: json["level_percent"],
    levelAdc: json["level_adc"],
    levelPercentStop: json["level_percent_stop"],
    sensorMax: json["sensor_max"],
    rate: json["rate"],
    forcePowerOff: json["force_power_off"],
    sunLight: json["sun_light"],
    sunLightActive: json["sun_light_active"],
    sunLightMaxPercent: json["sun_light_max_percent"],
    sunLightMinPercent: json["sun_light_min_percent"],
  );

  Map<String, dynamic> toMap() => {
    "running": running,
    "datetime_start": datetimeStart?.toIso8601String(),
    "seconds_left": secondsLeft,
    "level_percent": levelPercent,
    "level_adc": levelAdc,
    "level_percent_stop": levelPercentStop,
    "sensor_max": sensorMax,
    "rate": rate,
    "force_power_off": forcePowerOff,
    "sun_light": sunLight,
    "sun_light_active": sunLightActive,
    "sun_light_max_percent": sunLightMaxPercent,
    "sun_light_min_percent": sunLightMinPercent,
  };
}
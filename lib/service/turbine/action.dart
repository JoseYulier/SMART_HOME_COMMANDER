import 'dart:convert';

class TurbineAction {
  final bool? power;
  final int? stopLevel;
  const TurbineAction({this.power, this.stopLevel});

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap(){
      Map<String, dynamic> actions = {};
      if (power != null){actions["power"] = power;}
      if (stopLevel != null) {actions["stop_level"] = stopLevel;}
      return actions;
  }
}
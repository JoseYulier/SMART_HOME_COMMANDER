// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class WaterTankAnimation extends StatefulWidget {
  late int levelTank;
  late int levelStopTank;
  late bool isConnect;
  WaterTankAnimation(
      {super.key,
      required this.levelTank,
      required this.levelStopTank,
      required this.isConnect});

  @override
  _WaterTankAnimationState createState() => _WaterTankAnimationState();
}

class _WaterTankAnimationState extends State<WaterTankAnimation>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
              color: Colors.blueGrey, style: BorderStyle.solid, width: 3),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: widget.levelTank * 2,
              color: Colors.blue,
            ),
            Text(
              '${widget.levelTank}%',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

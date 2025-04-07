import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CisterAnimation extends StatefulWidget {
  late int levelCistern;

  late bool isConnect;
  CisterAnimation(
      {super.key, required this.levelCistern, required this.isConnect});

  @override
  // ignore: library_private_types_in_public_api
  _CisterAnimationState createState() => _CisterAnimationState();
}

class _CisterAnimationState extends State<CisterAnimation>
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
              height: widget.levelCistern * 2,
              color: Colors.blue,
            ),
            Text(
              '${widget.levelCistern}%',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

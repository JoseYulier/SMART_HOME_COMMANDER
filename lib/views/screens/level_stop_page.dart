import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_commander/providers/turbine_provider.dart';
import 'package:smart_home_commander/views/components/custom_button.dart';

class LevelStopPage extends StatefulWidget {
  const LevelStopPage({super.key});

  @override
  State<LevelStopPage> createState() => _LevelStopPageState();
}

class _LevelStopPageState extends State<LevelStopPage> {
  double levelStop = 0;
  @override
  Widget build(BuildContext context) {
    Provider.of<TurbineProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stop Level Filling Panel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Value: ${levelStop.round().toString()} %',
              style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
            Slider(
              value: levelStop,
              min: 0,
              max: 100,
              divisions: 20,
              label: levelStop.round().toString(),
              onChanged: (double value) {
                setState(() {
                  levelStop = value;
                });
              },
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomStatefulButton(
                    text: 'Cancel',
                    color: Colors.redAccent,
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    }),
                CustomStatefulButton(
                    text: 'Accept',
                    color: Colors.green,
                    onPressed: () {
                      savelevelStop();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void savelevelStop() {}

import 'package:smart_home_commander/providers/turbine_provider.dart';
import 'package:smart_home_commander/views/animations/water_tank_animation.dart';
import 'package:smart_home_commander/views/components/custom_button.dart';
import 'package:smart_home_commander/views/screens/level_stop_page.dart';
import 'package:smart_home_commander/views/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final turbineProvider = Provider.of<TurbineProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Filling Panel'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => const SettingPage(),
                      ));
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  goTolevelStop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white10,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: 150,
                  height: 300,
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Elevated Tank',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 45,
                        child: Container(
                          width: 80,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Colors.blueGrey,
                                style: BorderStyle.solid,
                                width: 3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 25,
                        child: WaterTankAnimation(
                          isConnect: turbineProvider.isConnect,
                          levelTank: turbineProvider.levelPercent,
                          levelStopTank: turbineProvider.levelStopTank,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                width: 150,
                height: 300,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Cistern',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white10,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            width: 300,
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Turbine Data',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        'Flux rate: ${turbineProvider.rateFluxFlow} lts/s',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(
                        'Time left: 10 min',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          CustomButtonFul(
            powerStatus: turbineProvider.isConnect,
            onPressed: () {
              turbineProvider.togglePower();
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Update Status...',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              );
              Future.delayed(Duration(seconds: 3), () {
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              });
            },
          ),
        ],
      ),
    );
  }

  void goTolevelStop(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (contex) => const LevelStopPage(),
        ));
  }
}

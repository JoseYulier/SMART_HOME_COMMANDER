import 'package:smart_home_commander/providers/turbine_provider.dart';
import 'package:smart_home_commander/views/animations/cistern_animation.dart';
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
                        left: 35,
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
                        left: 15,
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
                child: Stack(
                  children: [
                    const Padding(
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
                    Positioned(
                      top: 70,
                      left: 15,
                      child: CisterAnimation(
                        isConnect: turbineProvider.isConnect,
                        levelCistern: turbineProvider.levelCistern,
                      ),
                    ),
                  ],
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
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
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        'Time left: ${turbineProvider.rateFluxFlow} min',
                        style: const TextStyle(
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
                builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ],
                    ),
                    width: 100,
                    height: 100,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                        SizedBox(height: 14),
                        Text(
                          "Update Status...",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );

              Future.delayed(const Duration(seconds: 3), () {
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

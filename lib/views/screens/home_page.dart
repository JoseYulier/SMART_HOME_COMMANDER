import 'package:smart_home_commander/views/components/custom_button.dart';
import 'package:smart_home_commander/views/screens/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              Container(
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                width: 150,
                height: 300,
                child: const Padding(
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
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.grey,
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
                color: Colors.grey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            width: 300,
            height: 100,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Turbine Data',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 30),
          CustomButtonFul(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

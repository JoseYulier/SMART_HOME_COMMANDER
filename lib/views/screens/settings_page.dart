import 'package:smart_home_commander/views/components/textfield_imput.dart';
import 'package:smart_home_commander/views/components/custom_button.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  
  const SettingPage({super.key,});

  @override
  State<SettingPage> createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: const TextFieldImput(
              label: 'Broker:',
              icon: Icon(Icons.settings_ethernet),
            ),
          ),
          const Text('Example: localhost, 192.168.1.94',
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: const TextFieldImput(
              label: 'Route:',
              icon: Icon(Icons.location_on),
            ),
          ),
          const Text('Example: casa_rayner/turbina',
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: const TextFieldImput(
              label: 'Action:',
              icon: Icon(Icons.play_arrow),
            ),
          ),
          const Text('Example: casa_rayner/turbina/action',
              style: TextStyle(color: Colors.grey, fontSize: 15)),
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
                  text: 'Accept', color: Colors.green, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

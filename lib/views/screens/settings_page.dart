import 'package:smart_home_commander/views/components/textfield_imput.dart';
import 'package:smart_home_commander/views/components/custom_button.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TextFieldImput(
            labelText: 'Broker',
            icon: Icon(
              Icons.perm_device_information,
              size: 50.0,
            ),
          ),
          const Text('Example: localhost, 192.168.1.94',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          const TextFieldImput(
            labelText: 'Route',
            icon: Icon(
              Icons.link,
              size: 50.0,
            ),
          ),
          const Text('Example: casa_rayner/turbina',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          const TextFieldImput(
            labelText: 'Action',
            icon: Icon(
              Icons.play_arrow,
              size: 50.0,
            ),
          ),
          const Text('Example: casa_rayner/turbina/action',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey, fontSize: 15)),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomStatefulButton(
                  text: 'Cancel', color: Colors.redAccent, onPressed: () {}),
              CustomStatefulButton(
                  text: 'Accept', color: Colors.green, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

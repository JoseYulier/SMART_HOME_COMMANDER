import 'package:provider/provider.dart';
import 'package:smart_home_commander/providers/turbine_provider.dart';
import 'package:smart_home_commander/views/components/textfield_imput.dart';
import 'package:smart_home_commander/views/components/custom_button.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    super.key,
  });

  @override
  State<SettingPage> createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final turbineModel = Provider.of<TurbineProvider>(context);
    TextEditingController textControllerBroker = TextEditingController();
    TextEditingController textControllerRoute = TextEditingController();
    TextEditingController textControllerAction = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFieldImput(
                label: 'Broker:',
                icon: const Icon(Icons.settings_ethernet),
                controller: textControllerBroker,
              ),
            ),
            const Text('Example: localhost, 192.168.1.94',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFieldImput(
                label: 'Route:',
                icon: const Icon(Icons.location_on),
                controller: textControllerRoute,
              ),
            ),
            const Text('Example: casa_rayner/turbina',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFieldImput(
                label: 'Action:',
                icon: const Icon(Icons.play_arrow),
                controller: textControllerAction,
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
                    text: 'Accept',
                    color: Colors.green,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        turbineModel.saveSettings(
                            broker: textControllerBroker.text,
                            route: textControllerRoute.text,
                            action: textControllerAction.text);
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

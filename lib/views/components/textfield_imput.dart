import 'package:flutter/material.dart';

class TextFieldImput extends StatefulWidget {
  final String labelText;
  final Icon icon;
  const TextFieldImput({
    super.key,
    required this.labelText,
    required this.icon,
  });

  @override
  State<TextFieldImput> createState() => TextFieldImputState();
}

class TextFieldImputState extends State<TextFieldImput> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController imputController = TextEditingController();

  get labelText => 'Broker';

  get icon => null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: imputController,
      decoration: InputDecoration(
        labelText: '$labelText',
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $labelText';
        }
        return null;
      },
    );
  }
}

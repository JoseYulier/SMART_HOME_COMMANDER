import 'package:flutter/material.dart';

class CustomStatefulButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle textStyle;

  const CustomStatefulButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = Colors.blue,
      this.textStyle = const TextStyle(color: Colors.white)});

  @override
  State<CustomStatefulButton> createState() => _CustomStatefulButtonState();
}

class _CustomStatefulButtonState extends State<CustomStatefulButton> {
  bool _isPressed = false;
  void _handlePress() {
    setState(() {
      _isPressed = !_isPressed;
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
      ),
      onPressed: _handlePress,
      child: Text(
        widget.text,
        style: widget.textStyle,
      ),
    );
  }
}

class CustomButtonFul extends StatefulWidget {
  final VoidCallback onPressed;
  const CustomButtonFul({super.key, required this.onPressed});

  @override
  CustomButtonFulState createState() => CustomButtonFulState();
}

class CustomButtonFulState extends State<CustomButtonFul> {
  bool _isPressed = false;

  void _onPressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          color: _isPressed ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            textAlign: TextAlign.center,
            _isPressed ? 'Turn Off' : 'Fill',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

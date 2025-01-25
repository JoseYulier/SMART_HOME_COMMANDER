import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle textStyle;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = Colors.blue,
      this.textStyle = const TextStyle(color: Colors.white)});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

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

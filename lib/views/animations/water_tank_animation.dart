import 'package:flutter/material.dart';

class WaterTankAnimation extends StatefulWidget {
  const WaterTankAnimation({super.key});

  @override
  WaterTankAnimationState createState() => WaterTankAnimationState();
}

class WaterTankAnimationState extends State<WaterTankAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  final double tankHeight = 300.0; // Altura del tanque
  final double tankWidth = 150.0; // Ancho del tanque
  double fillPercentage = 0.0; // Porcentaje de llenado (0 a 100)

  @override
  void initState() {
    super.initState();

    // Inicializar el AnimationController
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Crear una animación que vaya de 0 a 1
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  void startAnimation(double percentage) {
    fillPercentage = percentage;
    controller.forward(from: 0.0); // Reiniciar la animación
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Dibujar el tanque
        CustomPaint(
          size: Size(tankWidth, tankHeight),
          painter: WaterTankPainter(
            fillPercentage: fillPercentage,
            animationValue: animation.value,
          ),
        ),
        SizedBox(height: 20),
        // Botón para iniciar la animación
        ElevatedButton(
          onPressed: () => startAnimation(75.0), // Llenar al 75%
          child: Text('Llenar al 75%'),
        ),
      ],
    );
  }
}

class WaterTankPainter extends CustomPainter {
  final double fillPercentage;
  final double animationValue;

  WaterTankPainter({
    required this.fillPercentage,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double tankHeight = size.height;
    final double tankWidth = size.width;

    // Dibujar el contorno del tanque
    final Paint tankPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, tankWidth, tankHeight),
      tankPaint,
    );

    // Dibujar el agua
    final double waterHeight =
        tankHeight * (fillPercentage / 100) * animationValue;
    final Paint waterPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        tankHeight - waterHeight, // La parte inferior del tanque
        tankWidth,
        waterHeight,
      ),
      waterPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

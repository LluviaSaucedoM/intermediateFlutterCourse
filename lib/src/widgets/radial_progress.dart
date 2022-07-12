import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final porcentaje;
  // ignore: use_key_in_widget_constructors
  const RadialProgress({this.porcentaje});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late num procentajeAnterior;

  @override
  void initState() {
    procentajeAnterior = widget.porcentaje;

    controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _MiRadialProgres(widget.porcentaje),
      ),
    );
  }
}

class _MiRadialProgres extends CustomPainter {
  num porcentaje;
  _MiRadialProgres(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    //Circulo
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    //Arco
    final paintArco = Paint()
      ..strokeWidth = 8
      ..color = Colors.pinkAccent
      ..style = PaintingStyle.stroke;
    // Parte que se va llenado

    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      true,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

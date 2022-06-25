import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  num porcentaje = 0.0;
  num newPorcentaje = 0.0;

  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 8000),
    );

    controller.addListener(() {
      // ignore: avoid_print
      print('valor controller: ${controller.value}');
      setState(() {
        porcentaje =
            lerpDouble(porcentaje, newPorcentaje, controller.value) as num;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          porcentaje = newPorcentaje;
          newPorcentaje += 10;
          if (newPorcentaje > 100) {
            newPorcentaje = 0;
            porcentaje = 0;
          }

          controller.forward(from: 0.0);

          setState(() {});
        },
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10),
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: _MiRadialProgres(porcentaje),
            )),
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
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    //Arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
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

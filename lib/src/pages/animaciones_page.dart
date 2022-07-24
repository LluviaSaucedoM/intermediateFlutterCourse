import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RectanguloAnimado(),
      ),
    );
  }
}

class RectanguloAnimado extends StatefulWidget {
  const RectanguloAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<RectanguloAnimado> createState() => _RectanguloAnimadoState();
}

class _RectanguloAnimadoState extends State<RectanguloAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.0,
          0.25,
          curve: Curves.easeOut,
        )));

    opacidadOut = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.75,
          1.0,
          curve: Curves.easeOut,
        )));
    moverDerecha = Tween(begin: 0.1, end: 200.0).animate(controller);

    agrandar = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));
    agrandar = Tween(begin: 0.1, end: 2.0).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
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
    //Boton de Play o Reprducion
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        child: const _Rectangulo(),
        builder: (BuildContext context, childRectangulo) {
          return Transform.translate(
            offset: Offset(moverDerecha.value, 0),
            child: Transform.rotate(
                angle: rotacion.value,
                child: Opacity(
                  opacity: opacidad.value - opacidadOut.value,
                  child: Transform.scale(
                    scale: agrandar.value,
                    child: childRectangulo,
                  ),
                )),
          );
        });
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}

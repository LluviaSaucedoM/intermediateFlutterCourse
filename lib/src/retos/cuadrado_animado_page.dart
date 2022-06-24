import 'package:flutter/material.dart';

class CudradoAnimadoPage extends StatelessWidget {
  const CudradoAnimadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _CudradoAnimado()),
    );
  }
}

class _CudradoAnimado extends StatefulWidget {
  const _CudradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CudradoAnimado> createState() => _CudradoAnimadoState();
}

class _CudradoAnimadoState extends State<_CudradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

  @override
  void initState() {
    //el mas importante
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );
    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.bounceOut)));

    moverArriba = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.50, curve: Curves.bounceOut)));

    moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)));

    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moverDerecha.value + moverIzquierda.value,
              moverArriba.value + moverAbajo.value),
          child: child,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}

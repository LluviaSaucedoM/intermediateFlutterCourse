import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff9DB34F),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xff9DB34F),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
    );
  }
}

class HeaderDiagonalHorizontal extends StatelessWidget {
  const HeaderDiagonalHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderHorizontalPaing(),
      ),
    );
  }
}

class _HeaderHorizontalPaing extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff9DB34F);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderDiagonalVertical extends StatelessWidget {
  const HeaderDiagonalVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderVerticalPainter(),
      ),
    );
  }
}

class _HeaderVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff9DB34F);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    //Ariba derecha
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    //Abajo Izquierda
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    //Mi solucion
    // path.moveTo(0, size.height);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff9DB34F);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, size.height * 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCirular extends StatelessWidget {
  const HeaderCirular({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCirularPainter(),
      ),
    );
  }
}

class _HeaderCirularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff9DB34F);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.40,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, size.height * 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderHonda extends StatelessWidget {
  const HeaderHonda({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderHondaPainter(),
      ),
    );
  }
}

class _HeaderHondaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff9DB34F);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * .5, size.height * 0.20);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.10, size.width, size.height * 0.20);
    path.lineTo(size.width, size.height * 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: const Offset(0, 55), radius: 180);

    const Gradient gradiente = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff5D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA),
        ],
        stops: [
          0.2,
          0.5,
          1.0
        ]);

    final paint = Paint()..shader = gradiente.createShader(rect);

    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.35,
      size.width * .5,
      size.height * 0.30,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.25,
      size.width,
      size.height * 0.30,
    );
    path.lineTo(size.width, size.height * 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshop extends StatelessWidget {
  const Slideshop({
    Key? key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.white,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12,
  }) : super(key: key);

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
          child: Center(child: Builder(builder: (BuildContext context) {
        Provider.of<_SlideshowModel>(context).colorPrimario = colorPrimario;
        Provider.of<_SlideshowModel>(context).colorSecundario = colorSecundario;

        Provider.of<_SlideshowModel>(context).bulletPrimario = bulletPrimario;
        Provider.of<_SlideshowModel>(context).bulletSecundario =
            bulletSecundario;
        return EstructuraBuilder(puntosArriba: puntosArriba, slides: slides);
      }))),
    );
  }
}

class EstructuraBuilder extends StatelessWidget {
  const EstructuraBuilder({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (puntosArriba) _Dots(slides.length),
        Expanded(child: _Slides(slides)),
        if (!puntosArriba) _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots(
    this.totalSlides,
  );
  final int totalSlides;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalSlides, (index) => _Dot(index))),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    double tamano = 0;
    Color color;
    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      tamano = ssModel._bulletPrimario;
      color = ssModel._colorPrimario;
    } else {
      tamano = ssModel._bulletSecundario;
      color = ssModel._colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final PageController pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.slide,
  }) : super(key: key);
  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  late double _currentPage = 0;
  late Color _colorPrimario = Colors.grey;
  late Color _colorSecundario = const Color.fromARGB(255, 39, 128, 176);
  late double _bulletPrimario = 12;
  late double _bulletSecundario = 12;

  // ignore: unnecessary_getters_setters
  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  Color get colorPrimario => _colorPrimario;

  set colorPrimario(Color colorPrimario) {
    _colorPrimario = colorPrimario;
  }

  // ignore: unnecessary_getters_setters
  Color get colorSecundario => _colorSecundario;
  set colorSecundario(Color colorSecundario) {
    _colorSecundario = colorSecundario;
  }

// ignore: unnecessary_getters_setters
  double get bulletPrimario => _bulletPrimario;
  set bulletPrimario(double bulletPrimario) {
    _bulletPrimario = bulletPrimario;
  }

  // ignore: unnecessary_getters_setters
  double get bulletSecundario => _bulletSecundario;
  set bulletSecundario(double bulletSecundario) {
    _bulletSecundario = bulletSecundario;
  }
}

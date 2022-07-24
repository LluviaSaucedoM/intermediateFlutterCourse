import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/slider_model.dart';

class Slideshop extends StatelessWidget {
  const Slideshop(
      {Key? key,
      required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.grey,
      this.colorSecundario = Colors.purple})
      : super(key: key);

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              if (puntosArriba)
                _Dots(
                  slides.length,
                  colorPrimario,
                  colorSecundario,
                ),
              Expanded(child: _Slides(slides)),
              if (!puntosArriba)
                _Dots(
                  slides.length,
                  colorPrimario,
                  colorSecundario,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots(this.totalSlides, this.colorPrimario, this.colorSecundario);
  final int totalSlides;
  final Color colorPrimario;
  final Color colorSecundario;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalSlides,
              (index) => _Dot(index, colorPrimario, colorSecundario))),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot(
    this.index,
    this.colorPrimario,
    this.colorSecundario,
  );
  final int index;
  final Color colorPrimario;
  final Color colorSecundario;

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 17,
      height: 17,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? colorSecundario
            : colorPrimario,
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
      Provider.of<SliderModel>(context, listen: false).currentPage =
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
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/slideshop.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshop(
        puntosArriba: false,
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg'),
        ],
        colorPrimario: Colors.grey,
        colorSecundario: const Color.fromARGB(255, 31, 61, 227),
      ),
    );
  }
}

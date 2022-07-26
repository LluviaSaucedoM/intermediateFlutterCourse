import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/slideshop.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshop(
        bulletPrimario: 15,
        bulletSecundario: 12,
        colorPrimario: const Color.fromARGB(255, 71, 101, 191),
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}

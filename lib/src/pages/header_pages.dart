import 'package:flutter/material.dart';

//import '../widgets/headers.dart';
//import 'animaciones_page.dart';
import '../retos/cuadrado_animado_page.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CudradoAnimadoPage(),
    );
  }
}

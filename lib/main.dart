import 'package:flutter/material.dart';
import 'package:designs/src/pages/graficas_circulares_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: GraficasCircularesPage());
  }
}

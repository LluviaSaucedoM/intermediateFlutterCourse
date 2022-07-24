import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  late double _currentPage = 0;
  // ignore: unnecessary_getters_setters
  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;

    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class CoffeeProvider extends ChangeNotifier {
  String _selectedSize = 'M';
  bool _isFavorite = false;

  String get selectedSize => _selectedSize;
  bool get isFavorite => _isFavorite;

  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
}

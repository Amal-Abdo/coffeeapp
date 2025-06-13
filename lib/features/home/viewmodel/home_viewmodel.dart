import 'package:flutter/material.dart';
import '../../../core/model/coffee_model.dart';

class HomeViewModel extends ChangeNotifier {
  int _selectedTabIndex = 0;
  int _selectedBottomNavIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;
  int get selectedBottomNavIndex => _selectedBottomNavIndex;
  List<String> get tabs => ['All Coffee', 'Macchiato', 'Latte', 'Americano'];

  void selectTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void updateBottomNavIndex(int index) {
    _selectedBottomNavIndex = index;
    notifyListeners();
  }

  List<CoffeeModel> get currentCoffeeList {
    switch (_selectedTabIndex) {
      case 1:
        return _macchiatoList;
      case 2:
        return _latteList;
      case 3:
        return _americanoList;
      default:
        return _allCoffeeList;
    }
  }

  final List<CoffeeModel> _allCoffeeList = [
    CoffeeModel(
      name: 'Caffe Mocha',
      subtitle: 'Deep Foam',
      price: 4.53,
      image: 'assets/images/coffee_mocha.jpg',
    ),
    CoffeeModel(
      name: 'Flat White',
      subtitle: 'Espresso',
      price: 3.53,
      image: 'assets/images/flat_white.jpg',
    ),
    CoffeeModel(
      name: 'Latte Art',
      subtitle: 'Fresh Milk',
      price: 4.00,
      image: 'assets/images/latte.jpg',
    ),
    CoffeeModel(
      name: 'Americano Classic',
      subtitle: 'No Foam',
      price: 3.00,
      image: 'assets/images/promo_image.jpg',
    ),
  ];

  final List<CoffeeModel> _macchiatoList = [
    CoffeeModel(
      name: 'Macchiato Classic',
      subtitle: 'Bold Taste',
      price: 4.2,
      image: 'assets/images/coffee_mocha.jpg',
    ),
  ];

  final List<CoffeeModel> _latteList = [
    CoffeeModel(
      name: 'Vanilla Latte',
      subtitle: 'With Vanilla',
      price: 4.8,
      image: 'assets/images/flat_white.jpg',
    ),
  ];

  final List<CoffeeModel> _americanoList = [
    CoffeeModel(
      name: 'Classic Americano',
      subtitle: 'Pure Espresso',
      price: 3.0,
      image: 'assets/images/latte.jpg',
    ),
  ];
}

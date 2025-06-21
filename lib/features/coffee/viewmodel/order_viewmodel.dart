import 'package:flutter/material.dart';

class OrderViewModel extends ChangeNotifier {
  bool isDelivery = true;
  int quantity = 1;

  void toggleDelivery(bool value) {
    isDelivery = value;
    notifyListeners();
  }

  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  double get price => 4.53;
  double get deliveryFee => isDelivery ? 1.0 : 0.0;
  double get total => price * quantity + deliveryFee;
}

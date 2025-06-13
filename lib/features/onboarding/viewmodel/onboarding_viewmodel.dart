import 'package:flutter/material.dart';

import '../../home/view/home_screen.dart';

class OnboardingViewModel extends ChangeNotifier {
  // Example: if you later want to track loading or other states
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getStarted(BuildContext context) {
    _isLoading = true;
    notifyListeners();

    // simulate API call / navigation
    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;
      notifyListeners();
      if(context.mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      }
    });
  }
}

import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const GetStartedButton({super.key, required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
      )
          : const Text('Get Started'),
    );
  }
}

import 'package:flutter/material.dart';

class DeliveryStatusBar extends StatelessWidget {
  final String eta;
  final String address;

  const DeliveryStatusBar({super.key, required this.eta, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$eta left", style: Theme.of(context).textTheme.titleLarge),
        Text("Delivery to $address"),
        const SizedBox(height: 8),
      ],
    );
  }
}

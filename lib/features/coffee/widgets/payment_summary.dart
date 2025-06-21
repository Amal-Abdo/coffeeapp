import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  final double price;
  final double deliveryFee;

  const PaymentSummary({
    super.key,
    required this.price,
    required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Payment Summary", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildRow("Price", price),
        _buildRow("Delivery Fee", deliveryFee, original: 2.0),
      ],
    );
  }

  Widget _buildRow(String label, double value, {double? original}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Row(
            children: [
              if (original != null)
                Text("\$${original.toStringAsFixed(1)}",
                    style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
              const SizedBox(width: 4),
              Text("\$${value.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

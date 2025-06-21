import 'package:flutter/material.dart';

class OrderItemTile extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imagePath;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const OrderItemTile({
    super.key,
    required this.name,
    required this.subtitle,
    required this.imagePath,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
        Text(quantity.toString()),
        IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
      ],
    );
  }
}

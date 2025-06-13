import 'package:flutter/material.dart';

class CoffeeTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTap;

  const CoffeeTabs({super.key, required this.tabs, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final label = entry.value;
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFC67C4E) : Colors.white12,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.white70)),
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../core/model/coffee_model.dart';
import '../viewmodel/coffee_view_model.dart';

class CoffeeDetailScreen extends HookWidget {
  final CoffeeModel coffee;

  const CoffeeDetailScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    final coffeeProvider = useContext().watch<CoffeeProvider>();
    final animationController = useAnimationController(duration: const Duration(milliseconds: 600));
    final slideAnimation = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(animationController);
    final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: opacityAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BackButton(),
                      const Text("Detail", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(
                          coffeeProvider.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.brown,
                        ),
                        onPressed: coffeeProvider.toggleFavorite,
                      ),
                    ],
                  ),
                ),

                // Coffee Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(coffee.image, height: 220, width: double.infinity, fit: BoxFit.cover),
                ),

                const SizedBox(height: 12),

                // Title and Icons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(coffee.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text('${coffee.rating}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          const Text(' (230)', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    coffee.subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),

                const Divider(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 6),
                      Text(
                        coffee.description,
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Sizes
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: coffee.sizes.map((size) {
                      final isSelected = coffeeProvider.selectedSize == size;
                      return GestureDetector(
                        onTap: () => coffeeProvider.selectSize(size),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: isSelected ? Colors.brown : Colors.grey.shade300),
                            color: isSelected ? Colors.brown.shade100 : Colors.white,
                          ),
                          child: Text(size, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const Spacer(),

                // Price & Buy Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text('\$${coffee.price.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      HookBuilder(
                        builder: (context) {
                          final tapped = useState(false);

                          return GestureDetector(
                            onTapDown: (_) => tapped.value = true,
                            onTapUp: (_) => tapped.value = false,
                            onTapCancel: () => tapped.value = false,
                            onTap: () {
                              // Handle Buy
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Added to cart"),
                              ));
                            },
                            child: AnimatedScale(
                              scale: tapped.value ? 0.95 : 1.0,
                              duration: const Duration(milliseconds: 150),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                                child: const Text("Buy Now",
                                    style: TextStyle(fontSize: 16, color: Colors.white)),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

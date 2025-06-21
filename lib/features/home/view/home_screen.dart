import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import '../../coffee/view/coffee_detail_screen.dart';
import '../viewmodel/home_viewmodel.dart';
import '../widget/coffee_item_card.dart';
import '../widget/promo_banner.dart';
import '../widget/coffee_tabs.dart';
import '../widget/search_bar_with_filter.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = useListenable(Provider.of<HomeViewModel>(context));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: _buildBody(context, vm),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: vm.selectedBottomNavIndex,
        onTap: vm.updateBottomNavIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
        selectedItemColor: Color(0xFFC67C4E),
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomeViewModel vm) {
    switch (vm.selectedBottomNavIndex) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.white70),
                const SizedBox(width: 8),
                Text('Bilzen, Tanjungbalai', style: Theme.of(context).textTheme.bodyMedium),
                const Icon(Icons.keyboard_arrow_down, color: Colors.white),
              ],
            ),
            const SizedBox(height: 16),
            const SearchBarWithFilter(),
            const SizedBox(height: 16),
            const PromoBanner(),
            const SizedBox(height: 16),
            CoffeeTabs(
              tabs: vm.tabs,
              selectedIndex: vm.selectedTabIndex,
              onTap: vm.selectTab,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: vm.currentCoffeeList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                  itemBuilder: (context, index) {
                    final coffee = vm.currentCoffeeList[index];
                    return CoffeeItemCard(
                      name: coffee.name,
                      subtitle: coffee.subtitle,
                      price: coffee.price,
                      imagePath: coffee.image,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CoffeeDetailScreen(coffee: coffee),
                            ),
                          );
                        }

                    );
                  }
              ),
            ),
          ],
        );
      case 1:
        return const Center(child: Text('Shopping Bag', style: TextStyle(color: Colors.white)));
      case 2:
        return const Center(child: Text('Notifications', style: TextStyle(color: Colors.white)));
      case 3:
        return const Center(child: Text('Profile', style: TextStyle(color: Colors.white)));
      default:
        return const SizedBox();
    }
  }
}


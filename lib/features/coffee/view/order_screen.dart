import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import '../../home/widget/coffee_tabs.dart';
import '../viewmodel/order_viewmodel.dart';
import '../widgets/order_item_tile.dart';
import '../widgets/payment_summary.dart';
import '../widgets/wallet_section.dart';
import 'tracking_screen.dart';

class OrderScreen extends HookWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = useListenable(Provider.of<OrderViewModel>(context));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CoffeeTabs(
              tabs: const ['Deliver', 'Pick Up'],
              selectedIndex: vm.isDelivery ? 0 : 1,
              onTap: (index) => vm.toggleDelivery(index == 0),
            ),
            const SizedBox(height: 16),
            _buildAddressSection(),
            const Divider(),
            OrderItemTile(
              name: 'Caffe Mocha',
              subtitle: 'Deep Foam',
              quantity: vm.quantity,
              imagePath: 'assets/images/coffee_mocha.jpg',
              onAdd: vm.increment,
              onRemove: vm.decrement,
            ),
            const SizedBox(height: 16),
            _buildDiscountSection(),
            const SizedBox(height: 16),
            PaymentSummary(price: vm.price * vm.quantity, deliveryFee: vm.deliveryFee),
            const SizedBox(height: 16),
            const WalletSection(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingScreen(),));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC67C4E),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Order"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Delivery Address", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text("Jl. Kpg Sutoyo", style: TextStyle(fontSize: 16)),
        const Text("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai"),
        const SizedBox(height: 8),
        Row(
          children: [
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.edit), label: const Text("Edit Address")),
            const SizedBox(width: 8),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.note_add), label: const Text("Add Note")),
          ],
        )
      ],
    );
  }

  Widget _buildDiscountSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFC67C4E),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("1 Discount is Applies"),
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}

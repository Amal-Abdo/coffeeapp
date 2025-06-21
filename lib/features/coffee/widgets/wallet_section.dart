import 'package:flutter/material.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text("Cash/Wallet"),
      subtitle: const Text("\$ 5.53"),
      leading: const Icon(Icons.account_balance_wallet_outlined),
      children: const [
        ListTile(
          title: Text("Use Cash Balance"),
          trailing: Icon(Icons.check_circle, color: Color(0xFFC67C4E)),
        ),
      ],
    );
  }
}

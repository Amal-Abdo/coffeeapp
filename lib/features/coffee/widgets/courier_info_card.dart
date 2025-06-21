import 'package:flutter/material.dart';

import '../../../core/model/courier_model.dart';

class CourierInfoCard extends StatelessWidget {
  final CourierModel courier;

  const CourierInfoCard({required this.courier});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(courier.imageUrl)),
        title: Text(courier.name),
        subtitle: Text("Personal Courier"),
        trailing: Icon(Icons.call, color: Colors.green),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  final Map<String, dynamic> car;

  const CarItem({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Container(width: 50, height: 50, color: Colors.grey),
        title: Text('Placa: ${car['placa']}'),
        subtitle: Text('Conductor: ${car['conductor']}'),
      ),
    );
  }
}

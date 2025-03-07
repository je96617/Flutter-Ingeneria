import 'package:flutter/material.dart';
import '../screens/lista.dart';

class CarritoItem extends StatelessWidget {
  final Carrito carrito;

  const CarritoItem({super.key, required this.carrito});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "IMG",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Placa: ${carrito.placa}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Conductor: ${carrito.nombreConductor}"),
                Text("Empresa: ${carrito.nombreEmpresa}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

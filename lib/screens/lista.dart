import 'package:carritoselectricos/screens/carrito_item.dart';
import 'package:flutter/material.dart';

class Carrito {
  final String placa;
  final String nombreConductor;
  final String nombreEmpresa;

  Carrito({
    required this.placa,
    required this.nombreConductor,
    required this.nombreEmpresa,
  });
}

class ListaCarritos extends StatelessWidget {
  final List<Carrito> carritos = [
    Carrito(
      placa: "ERF888",
      nombreConductor: "Juan Carlos",
      nombreEmpresa: "XYZ",
    ),
    Carrito(
      placa: "ABC123",
      nombreConductor: "María López",
      nombreEmpresa: "ABC Transport",
    ),
    Carrito(
      placa: "XYZ789",
      nombreConductor: "Pedro Gómez",
      nombreEmpresa: "Movilidad Express",
    ),
  ];

  ListaCarritos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carritos.length,
      itemBuilder: (context, index) {
        return CarritoItem(carrito: carritos[index]);
      },
    );
  }
}

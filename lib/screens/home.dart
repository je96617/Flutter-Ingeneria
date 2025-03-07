import 'package:flutter/material.dart';
import 'lista.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuario: Pepe Pérez"),
        centerTitle: true,
      ),
      body: ListaCarritos(),
    );
  }
}

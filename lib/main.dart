import 'package:carritoselectricos/view/login_view.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const CarrosApp());
}

class CarrosApp extends StatelessWidget {
  const CarrosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carros Eléctricos',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
import 'package:flutter/material.dart';
import 'screens/veiculos_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manutenção de Veículos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VeiculosScreen(),
    );
  }
}

import 'package:flutter/material.dart';

class SimuladorConsumoScreen extends StatefulWidget {
  @override
  _SimuladorConsumoScreenState createState() => _SimuladorConsumoScreenState();
}

class _SimuladorConsumoScreenState extends State<SimuladorConsumoScreen> {
  final _distanciaController = TextEditingController();
  final _consumoController = TextEditingController();
  double _custo = 0.0;
  double _precoGasolina = 6.07; // Preço médio da gasolina

  void _calcularCusto() {
    final distancia = double.tryParse(_distanciaController.text);
    final consumo = double.tryParse(_consumoController.text);

    if (distancia != null && consumo != null) {
      // Cálculo do custo
      _custo = (distancia / consumo) * _precoGasolina;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulador de Consumo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _distanciaController,
              decoration: InputDecoration(labelText: 'Distância (km)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _consumoController,
              decoration: InputDecoration(labelText: 'Consumo (km/L)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularCusto,
              child: Text('Calcular Custo'),
            ),
            SizedBox(height: 20),
            Text(
                'Estimativa do Custo do Combustível: R\$ ${_custo.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/manutencao_screen.dart';
import 'package:flutter_application_1/screens/simulador_consumo_screen.dart';
import '../models/veiculo.dart';
import '../services/api_service.dart';

class VeiculosScreen extends StatefulWidget {
  @override
  _VeiculosScreenState createState() => _VeiculosScreenState();
}

class _VeiculosScreenState extends State<VeiculosScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Veiculo>> veiculos;

  @override
  void initState() {
    super.initState();
    veiculos = apiService.fetchVeiculos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veículos'),
      ),
      body: FutureBuilder<List<Veiculo>>(
        future: veiculos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum veículo encontrado'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final veiculo = snapshot.data![index];
                return ListTile(
                  title: Text('${veiculo.marca} ${veiculo.modelo}'),
                  subtitle: Text('Ano: ${veiculo.ano}'),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SimuladorConsumoScreen()),
              );
            },
            child: Icon(Icons.calculate),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManutencaoScreen()),
              );
            },
            child: Icon(Icons.build),
          ),
        ],
      ),
    );
  }
}

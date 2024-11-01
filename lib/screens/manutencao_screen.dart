import 'package:flutter/material.dart';

class ManutencaoScreen extends StatefulWidget {
  @override
  _ManutencaoScreenState createState() => _ManutencaoScreenState();
}

class _ManutencaoScreenState extends State<ManutencaoScreen> {
  final _descricaoController = TextEditingController();
  final _dataController = TextEditingController();

  void _registrarManutencao() {
    final descricao = _descricaoController.text;
    final data = _dataController.text;

    // Aqui você pode enviar os dados para a API ou armazená-los localmente
    // Exemplo: apiService.registrarManutencao(descricao, data);

    // Limpa os campos
    _descricaoController.clear();
    _dataController.clear();

    // Mostra um snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Manutenção registrada com sucesso!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Manutenção'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _dataController,
              decoration: InputDecoration(labelText: 'Data (DD/MM/AAAA)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registrarManutencao,
              child: Text('Registrar Manutenção'),
            ),
          ],
        ),
      ),
    );
  }
}

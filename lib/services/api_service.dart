import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/veiculo.dart';

class ApiService {
  static const String baseUrl = 'https://api-manutencao-carros.onrender.com';

  // Método para buscar veículos da API
  Future<List<Veiculo>> fetchVeiculos() async {
    final response = await http.get(Uri.parse('$baseUrl/veiculos'));

    if (response.statusCode == 200) {
      // Decodificando a resposta JSON
      List<dynamic> jsonList = jsonDecode(response.body);
      // Convertendo cada item JSON em um objeto Veiculo
      return jsonList.map((json) => Veiculo.fromJson(json)).toList();
    } else {
      // Lançando uma exceção em caso de erro
      throw Exception('Erro ao buscar veículos: ${response.statusCode}');
    }
  }
}

class Veiculo {
  final int id;
  final String marca;
  final String modelo;
  final int ano;
  final int quilometragem;
  final String tipoCombustivel;

  Veiculo({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.quilometragem,
    required this.tipoCombustivel,
  });

  // Factory para converter o JSON do backend em um objeto Veiculo
  factory Veiculo.fromJson(Map<String, dynamic> json) {
    return Veiculo(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      ano: json['ano'],
      quilometragem: json['quilometragem'],
      tipoCombustivel: json['tipo_combustivel'],
    );
  }
}

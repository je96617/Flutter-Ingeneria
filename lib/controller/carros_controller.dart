import 'dart:convert';

import 'package:carritoselectricos/model/carro_model.dart';




class CarrosController {
  static const String _baseUrl = 'https://67f7d1812466325443eadd17.mockapi.io/carros';
  
  static get http => null;

  static Future<List<Carro>> obtenerCarros() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Carro.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener carros');
    }
  }

  static Future<Carro> obtenerCarroPorQR(String codigo) async {
    final response = await http.get(Uri.parse('\$_baseUrl/\$codigo'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Carro.fromJson(data);
    } else {
      throw Exception('Este vehiculo no existe');
    }
  }
}
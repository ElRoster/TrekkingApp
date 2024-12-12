import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trekking_apk/Models/Guias.dart';

class Apiservices {
  static const String baseUrl = "https://api-2821726-m4st.onrender.com/api/Guias";

  // Método estático para obtener las guías
  static Future<List<Guias>> getGuia() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> guiasData = jsonData['Guias'];

      return guiasData.map((item) => Guias.fromJson(item)).toList();
    } else {
      throw Exception('Error obteniendo los datos: ${response.body}');
    }
  }

  // Método estático para crear una nueva guía
  static Future<void> createGuia(String nombre, String apellido, String documento,
      String email, String direccion) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'nombre': nombre,
        'apellido': apellido,
        'documento': documento,
        'email': email,
        'direccion': direccion,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al registrar la guía: ${response.body}');
    }
  }

  // Método estático para actualizar una guía
  static Future<void> updateGuia(String id, String nombre, String apellido,
      String documento, String email, String direccion) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'nombre': nombre,
        'apellido': apellido,
        'documento': documento,
        'email': email,
        'direccion': direccion,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al actualizar la guía: ${response.body}');
    }
  }

  // Método estático para eliminar una guía
  static Future<void> deleteGuia(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Error al eliminar la guía: ${response.body}');
    }
  }
}

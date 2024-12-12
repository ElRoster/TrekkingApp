class Guias {
  final String id;
  final String nombre;
  final String apellido;
  final String documento;
  final String email;
  final String direccion;

  Guias({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.documento,
    required this.email,
    required this.direccion,
  });

  factory Guias.fromJson(Map<String, dynamic> json) {
    return Guias(
      id: json['_id'] ?? '',
      nombre: json['nombre'] ?? '',
      apellido: json['apellido'] ?? '',
      documento: json['documento'] ?? '',
      email: json['email'] ?? '',
      direccion: json['direccion'] ?? '',  // Corregido aquí
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'nombre': nombre,
      'apellido': apellido,
      'documento': documento,
      'email': email,
      'direccion': direccion,
    };
  }
}

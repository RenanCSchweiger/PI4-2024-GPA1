import 'dart:convert';

class LoginResponse {
  LoginResponse({
    required this.id,
    required this.nome,
    required this.email,
    required this.isAdmin,
  });

  final int id;
  final String nome;
  final String email;
  final bool isAdmin;

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
    );
  }

  factory LoginResponse.fromJson(String source) => LoginResponse.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'isAdmin': isAdmin,
    };
  }

  String toJson() => json.encode(toMap());
}

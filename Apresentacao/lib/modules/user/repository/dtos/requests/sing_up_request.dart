import 'dart:convert';

class SingUpRequest {
  SingUpRequest({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.senha,
  });

  final String nome;
  final String email;
  final String telefone;
  final String senha;

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'senha': senha,
    };
  }

  factory SingUpRequest.fromMap(Map<String, dynamic> map) {
    return SingUpRequest(
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      telefone: map['telefone'] ?? '',
      senha: map['senha'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SingUpRequest.fromJson(String source) => SingUpRequest.fromMap(json.decode(source));
}

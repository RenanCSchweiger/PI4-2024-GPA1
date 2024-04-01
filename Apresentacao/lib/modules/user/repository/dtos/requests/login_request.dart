import 'dart:convert';

class LoginRequest {
  LoginRequest({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      email: map['email'] ?? '',
      password: map['senha'] ?? '',
    );
  }

  factory LoginRequest.fromJson(String source) => LoginRequest.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'senha': password,
    };
  }

  String toJson() => json.encode(toMap());
}

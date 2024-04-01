class LoginUserSave {
  final int id;
  final String nome;
  final String email;
  final bool isAdmin;

  LoginUserSave({
    required this.id,
    required this.nome,
    required this.email,
    required this.isAdmin,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'isAdmin': isAdmin,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'isAdmin': isAdmin,
    };
  }

  factory LoginUserSave.fromMap(Map<String, dynamic> map) {
    return LoginUserSave(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
    );
  }

  factory LoginUserSave.fromJson(Map<String, dynamic> json) {
    return LoginUserSave(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      isAdmin: json['isAdmin'],
    );
  }

  factory LoginUserSave.empty() => LoginUserSave.fromMap(<String, dynamic>{'': ''});
}

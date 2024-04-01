import 'dart:convert';

class RegisterOutsourcedOngRequest {
  RegisterOutsourcedOngRequest({
    required this.tipo,
    required this.nome,
    required this.email,
    required this.endereco,
    required this.telefone,
    required this.descricao,
    this.cnpj,
    this.logoEmpresa,
    this.pix,
    this.site,
  });

  final String nome;
  final String? cnpj;
  final String tipo;
  final List<int>? logoEmpresa;
  final String email;
  final String? pix;
  final String endereco;
  final String telefone;
  final String descricao;
  final String? site;

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'cnpj': cnpj,
      'tipo': tipo,
      'logoEmpresa': logoEmpresa,
      'email': email,
      'pix': pix,
      'endereco': endereco,
      'telefone': telefone,
      'descricao': descricao,
      'site': site,
    };
  }

  factory RegisterOutsourcedOngRequest.fromMap(Map<String, dynamic> map) {
    return RegisterOutsourcedOngRequest(
      nome: map['nome'] ?? '',
      cnpj: map['cnpj'] ?? '',
      tipo: map['tipo'] ?? '',
      logoEmpresa: map['logoEmpresa'] ?? [],
      email: map['email'] ?? '',
      pix: map['pix'] ?? '',
      endereco: map['endereco'] ?? '',
      telefone: map['telefone'] ?? '',
      descricao: map['descricao'] ?? '',
      site: map['site'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterOutsourcedOngRequest.fromJson(String source) => RegisterOutsourcedOngRequest.fromMap(json.decode(source));
}

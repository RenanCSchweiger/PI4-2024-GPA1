import 'dart:convert';

class OutsourcedOngResponse {
  OutsourcedOngResponse({
    required this.id,
    required this.nome,
    required this.tipo,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.descricao,
    this.cnpj,
    this.logo,
    this.pix,
    this.site,
  });

  final int id;
  final String nome;
  final String? cnpj;
  final String tipo;
  final String? logo;
  final String email;
  final String telefone;
  final String endereco;
  final String? pix;
  final String descricao;
  final String? site;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cnpj': cnpj,
      'tipo': tipo,
      'logo': logo,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'pix': pix,
      'descricao': descricao,
      'site': site,
    };
  }

  factory OutsourcedOngResponse.fromMap(Map<String, dynamic> map) {
    return OutsourcedOngResponse(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      cnpj: map['cnpj'] ?? '',
      tipo: map['tipo'] ?? '',
      logo: map['logo'] ?? '',
      email: map['email'] ?? '',
      telefone: map['telefone'] ?? '',
      endereco: map['endereco'] ?? '',
      pix: map['pix'] ?? '',
      descricao: map['descricao'] ?? '',
      site: map['site'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OutsourcedOngResponse.fromJson(String source) => OutsourcedOngResponse.fromMap(json.decode(source));

  factory OutsourcedOngResponse.empty() => OutsourcedOngResponse.fromMap(<String, dynamic>{'': ''});
}

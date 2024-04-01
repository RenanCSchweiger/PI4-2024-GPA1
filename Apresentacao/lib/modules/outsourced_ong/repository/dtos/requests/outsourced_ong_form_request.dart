import 'dart:convert';

class OutsourcedOngFormRequest {
  OutsourcedOngFormRequest({
    required this.tipo,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.descricao,
    this.logo,
    this.cnpj,
    this.pix,
    this.comprovante,
    this.site,
  });

  final String tipo;
  final String nome;
  final String email;
  final String? cnpj;
  final String telefone;
  final String endereco;
  final String descricao;
  final String? pix;
  final String? logo;
  final String? comprovante;
  final String? site;

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'nome': nome,
      'email': email,
      'cnpj': cnpj,
      'telefone': telefone,
      'endereco': endereco,
      'descricao': descricao,
      'pix': pix,
      'logo': logo,
      'comprovante': comprovante,
      'site': site,
    };
  }

  factory OutsourcedOngFormRequest.fromMap(Map<String, dynamic> map) {
    return OutsourcedOngFormRequest(
      tipo: map['tipo'] ?? '',
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      cnpj: map['cnpj'] ?? '',
      telefone: map['telefone'] ?? '',
      endereco: map['endereco'] ?? '',
      descricao: map['descricao'] ?? '',
      pix: map['pix'] ?? '',
      logo: map['logo'] ?? '',
      comprovante: map['comprovante'] ?? '',
      site: map['site'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OutsourcedOngFormRequest.fromJson(String source) => OutsourcedOngFormRequest.fromMap(json.decode(source));
}

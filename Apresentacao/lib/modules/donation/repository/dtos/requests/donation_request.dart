import 'dart:convert';

class DonationRequest {
  DonationRequest({
    required this.idDoador,
    required this.idOng,
    required this.comprovante,
    required this.mensagem,
  });

  final int idDoador;
  final int idOng;
  final List<int> comprovante;
  final String mensagem;

  Map<String, dynamic> toMap() {
    return {
      'idDoador': idDoador,
      'idOng': idOng,
      'comprovante': comprovante,
      'mensagem': mensagem,
    };
  }

  factory DonationRequest.fromMap(Map<String, dynamic> map) {
    return DonationRequest(
      idDoador: map['idDoador']?.toInt() ?? 0,
      idOng: map['idOng']?.toInt() ?? 0,
      comprovante: List<int>.from(map['comprovante'] ?? []),
      mensagem: map['mensagem'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DonationRequest.fromJson(String source) => DonationRequest.fromMap(json.decode(source));
}

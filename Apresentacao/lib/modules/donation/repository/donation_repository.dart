import 'package:eco_clico_app/lib.dart';
import 'package:http/http.dart' as http;

class DonationRepository implements IDonationRepository {
  static const pathSendDonationOng = "/usuario/doacao";
  static const pathSendDonationEcoCiclo = "/usuario/doacao/eco";

  @override
  Future<bool> postSendDonation(DonationRequest request, bool isEco) async {
    final Uri url;
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};

    if (isEco) {
      url = Uri.parse('${ApiConstants.baseUrl}$pathSendDonationEcoCiclo');
    } else {
      url = Uri.parse('${ApiConstants.baseUrl}$pathSendDonationOng');
    }

    final response = await http.post(
      url,
      headers: headers,
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}

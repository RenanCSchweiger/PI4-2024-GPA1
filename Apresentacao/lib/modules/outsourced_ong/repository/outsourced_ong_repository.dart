import 'package:eco_clico_app/lib.dart';
import 'package:http/http.dart' as http;

class OutsourcedOngRepository implements IOutsourcedOngRepository {
  static const pathSendForm = "/empresa/proposta";
  static const pathRegisterOutsourcedOng = "/empresa/cadastrar";

  @override
  Future<bool> postSendFormOutsourced(OutsourcedOngFormRequest request) async {
    var headers = {'Content-Type': 'multipart/form-data'};

    final requestQuery = http.MultipartRequest('POST', Uri.parse('${ApiConstants.baseUrl}$pathSendForm'));

    requestQuery.fields.addAll({
      'tipo': request.tipo,
      'nome': request.nome,
      'email': request.email,
      'telefone': request.telefone,
      'endereco': request.endereco,
      'descricao': request.descricao,
      'cnpj': request.cnpj!,
      'site': request.site!,
    });

    request.logo != '' ? requestQuery.files.add(await http.MultipartFile.fromPath('logo', request.logo!)) : null;
    requestQuery.files.add(await http.MultipartFile.fromPath('comprovante', request.comprovante!));

    requestQuery.headers.addAll(headers);

    http.StreamedResponse response = await requestQuery.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> postSendFormOng(OutsourcedOngFormRequest request) async {
    var headers = {'Content-Type': 'multipart/form-data'};

    final requestQuery = http.MultipartRequest('POST', Uri.parse('${ApiConstants.baseUrl}$pathSendForm'));

    requestQuery.fields.addAll({
      'tipo': request.tipo,
      'nome': request.nome,
      'email': request.email,
      'telefone': request.telefone,
      'endereco': request.endereco,
      'descricao': request.descricao,
      'pix': request.pix!,
      'site': request.site!,
    });

    request.logo != '' ? requestQuery.files.add(await http.MultipartFile.fromPath('logo', request.logo!)) : null;

    requestQuery.headers.addAll(headers);

    http.StreamedResponse response = await requestQuery.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> postRegisterOutsourcedOng(RegisterOutsourcedOngRequest request) async {
    var url = Uri.parse('${ApiConstants.baseUrl}$pathRegisterOutsourcedOng');
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};

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

import 'package:eco_clico_app/lib.dart';
import 'package:get/get_connect/connect.dart';

class HomeRepository extends GetConnect implements IHomeRepository {
  static const String pathFindAll = '/empresa/buscar';
  static const String pathFindCompany = '/empresa';

  @override
  Future<List<OutsourcedOngResponse>?> getAllCompanysByType(String type) async {
    final response = await get('${ApiConstants.baseUrl}$pathFindAll?filtro=$type');

    if (response.statusCode == 200 && response.body != null) {
      final List<dynamic> result = response.body as List<dynamic>;
      return result.map((item) => OutsourcedOngResponse.fromMap(item)).toList();
    }

    return null;
  }

  @override
  Future<OutsourcedOngResponse?> getCompanyById(String id) async {
    final response = await get('${ApiConstants.baseUrl}$pathFindCompany?idEmpresa=$id');

    if (response.statusCode == 200) {
      return OutsourcedOngResponse.fromMap(response.body);
    }

    return null;
  }
}

import 'repository.dart';

abstract class IHomeRepository {
  Future<List<OutsourcedOngResponse>?> getAllCompanysByType(String type);
  Future<OutsourcedOngResponse?> getCompanyById(String id);
}

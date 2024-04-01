import 'repository.dart';

abstract class IOutsourcedOngRepository {
  Future<bool> postSendFormOutsourced(OutsourcedOngFormRequest request);
  Future<bool> postSendFormOng(OutsourcedOngFormRequest request);
  Future<bool> postRegisterOutsourcedOng(RegisterOutsourcedOngRequest request);
}

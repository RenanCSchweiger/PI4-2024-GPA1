import 'dtos/dtos.dart';

abstract class IUserRepository {
  Future<LoginResponse?> postLogin(LoginRequest request);
  Future<bool> postSingUp(SingUpRequest request);
}

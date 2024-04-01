import 'package:eco_clico_app/lib.dart';
import 'package:get/get.dart';

class UserRepository extends GetConnect implements IUserRepository {
  static const String pathLogin = '/usuario/login';
  static const String pathSingUp = '/usuario/cadastro';

  @override
  Future<LoginResponse?> postLogin(LoginRequest request) async {
    final response = await post('${ApiConstants.baseUrl}$pathLogin', request.toJson());

    if (response.statusCode == 200) {
      return LoginResponse.fromMap(response.body);
    } else {
      return null;
    }
  }

  @override
  Future<bool> postSingUp(SingUpRequest request) async {
    final response = await post('${ApiConstants.baseUrl}$pathSingUp', request.toJson());

    if (response.statusCode == 201 || response.statusCode == 200 || response.statusCode == 409) {
      return true;
    }

    return false;
  }
}

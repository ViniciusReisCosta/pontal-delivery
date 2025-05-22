import 'package:pontal_delivery/constants/endpoints.dart';
import 'package:pontal_delivery/models/user_model.dart';
import 'package:pontal_delivery/pages/auth/repository/auth_errors.dart' as authErros;
import 'package:pontal_delivery/pages/auth/result/auth_result.dart';
import 'package:pontal_delivery/services/http_manager.dart';

class AuthRepository {

  final HttpManager _httpManager = HttpManager();

  Future<AuthResult> validateToken(String token) async{

    final result = await _httpManager.restRequest(
        url: Endpoints.validateToken,
        method: HttpMethods.post,
        headers: {
          'X-Parse-Session-Token' : token
        }
    );

    if(result['result'] != null) {

      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);

    } else {

      return AuthResult.error(authErros.authErrorsString(result['error']));

    }
  }

  Future <AuthResult> signIn({required String email, required String password}) async {

    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      }
    );

    if(result['result'] != null) {

      final user = UserModel.fromJson(result['result']);

      return AuthResult.success(user);

    } else {

      return AuthResult.error(authErros.authErrorsString(result['error']));

    }
  }
}
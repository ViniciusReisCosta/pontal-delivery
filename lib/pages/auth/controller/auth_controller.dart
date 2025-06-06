import 'package:get/get.dart';
import 'package:pontal_delivery/config/app_data.dart';
import 'package:pontal_delivery/constants/storage_keys.dart';
import 'package:pontal_delivery/models/user_model.dart';
import 'package:pontal_delivery/pages/auth/repository/auth_repository.dart';
import 'package:pontal_delivery/pages/auth/result/auth_result.dart';
import 'package:pontal_delivery/services/utils_services.dart';

import '../../../pages_routes/app_pages.dart';

class AuthController extends GetxController {

  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  @override
  void onInit() {

    super.onInit();

    validateToken();

  }

  Future<void> validateToken() async {

    // Recuperar o token que foi salvo localmente
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if(token == null) {

      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(

      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },

      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {

    // Zerar o user
    user = UserModel();

    // Remover o token localmente
    await utilsServices.removeLocalData(key: StorageKeys.token);

    // Ir para o login
    Get.offAllNamed(PagesRoutes.signInRoute);

  }

  void saveTokenAndProceedToBase() {

    // Salvar o token
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    // Ir para a base
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> signUp () async {

    isLoading.value = true;

   AuthResult result = await authRepository.signUp(user);

    isLoading.value = false;

   result.when(
     success: (user) {
       this.user = user;
       saveTokenAndProceedToBase();
     },
     error: (message) {
       utilsServices.showToast(
         message: message,
         isError: true,
       );
     },
   );
  }

  Future<void> resetPassword(String email) async {

    await authRepository.resetPassword(email);
  }

  Future<void> signIn({required String email, required String password}) async{

    isLoading.value = true;

    AuthResult result = await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {

        utilsServices.showToast(
          message: message,
          isError: true,
        );
      }
    );
  }
}
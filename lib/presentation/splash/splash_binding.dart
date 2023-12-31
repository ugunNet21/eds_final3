import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../data/repository/auth_repository.dart';
import '../../data/services/dio_client.dart';
import '../../data/services/firebase_auth_services.dart';
import 'splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.put(SplashController(
      authRepository: Get.find<AuthRepository>(),
      firebaseAuthService: Get.find<FirebaseAuthService>(),
    ));
  }
}
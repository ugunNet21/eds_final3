import 'package:edsp_final3/presentation/auth/register/register_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/services/dio_client.dart';
import '../../../data/services/firebase_auth_services.dart';

class RegistFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut(() => RegistFormController(
        authRepository: Get.find<AuthRepository>(),
        firebaseAuthService: Get.find<FirebaseAuthService>()));
  }
}

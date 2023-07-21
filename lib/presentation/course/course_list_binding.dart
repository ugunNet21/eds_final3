import 'package:get/get.dart';
import '../../data/repository/course_repository.dart';
import '../../data/services/dio_client.dart';
import '../../data/services/firebase_auth_services.dart';
import 'course_list_controller.dart';

class CourseListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRepository>(
        () => CourseRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => CourseListController(
        Get.find<CourseRepository>(), Get.find<FirebaseAuthService>()));
  }
}

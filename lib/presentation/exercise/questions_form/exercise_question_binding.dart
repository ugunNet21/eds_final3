import 'package:get/get.dart';
import '../../../data/repository/course_repository.dart';
import '../../../data/services/dio_client.dart';
import '../../../data/services/firebase_auth_services.dart';
import 'exercise_question_controller.dart';


class ExerciseQuestionsFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => ExerciseQuestionsFormController(Get.find<CourseRepository>(), Get.find<FirebaseAuthService>()));
  }
}
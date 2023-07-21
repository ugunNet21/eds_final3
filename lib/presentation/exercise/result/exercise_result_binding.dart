import 'package:get/get.dart';
import 'exercise_result_controller.dart';

class ExerciseResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseResultController());
  }
}

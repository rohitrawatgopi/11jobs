import 'package:get/get.dart';
import 'package:myerp/features/teacher/feature/home/controllers/teacher_home_controller.dart';

class TeacherHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherHomeController>(
      () => TeacherHomeController(),
    );
  }
}

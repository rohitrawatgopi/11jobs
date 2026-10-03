import 'package:get/get.dart';
import 'package:myerp/features/question/question.cnntrl.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(() => QuizController());
  }
}

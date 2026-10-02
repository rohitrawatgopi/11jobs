import 'package:get/get.dart';
import 'package:myerp/features/auth/controllers/login.cntrl.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

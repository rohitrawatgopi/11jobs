import 'package:get/get.dart';
import 'package:myerp/features/auth/views/login.dart';

class SplashController extends GetxController {
  final RxBool visible = false.obs;

  final bool isFirstTime = false;

  @override
  void onReady() {
    super.onReady();
    _start();
  }

  Future<void> _start() async {
    await Future.delayed(const Duration(milliseconds: 150));
    visible.value = true;

    await Future.delayed(const Duration(milliseconds: 2200));
    _goNext();
  }

  void _goNext() {
    Get.offAll(() => LoginScreen());
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myerp/features/question/question.view.dart';
import 'package:myerp/features/question/teacher_home_binding.dart';

import 'package:myerp/utils/app.toast.dart';

class LoginController extends GetxController {
  static const String _defaultEmail = 'test@gmail.com';
  static const String _defaultPassword = '12345678';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  final RxBool isPasswordHidden = true.obs;

  final RxBool isLoading = false.obs;

  final RxBool rememberMe = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? !rememberMe.value;
  }

  String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    final password = value?.trim() ?? '';
    if (password.isEmpty) {
      return 'Please enter your password';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> login() async {
    if (isLoading.value) return;

    final email = emailcontroller.text.trim();
    final password = passcontroller.text.trim();

    if (email.isEmpty) {
      AppToast.failed('Please enter your email');
      return;
    }

    if (!GetUtils.isEmail(email)) {
      AppToast.failed('Please enter a valid email');
      return;
    }

    if (password.isEmpty) {
      AppToast.failed('Please enter your password');
      return;
    }

    if (!(formKey.currentState?.validate() ?? true)) {
      return;
    }

    try {
      isLoading.value = true;

      await Future.delayed(const Duration(milliseconds: 1200));

      final isEmailCorrect = email.toLowerCase() == _defaultEmail.toLowerCase();
      final isPasswordCorrect = password == _defaultPassword;

      if (!isEmailCorrect && !isPasswordCorrect) {
        AppToast.failed('Invalid email and password');
        return;
      }
      if (!isEmailCorrect) {
        AppToast.failed('Incorrect email address');
        return;
      }
      if (!isPasswordCorrect) {
        AppToast.failed('Incorrect password');
        return;
      }

      AppToast.success('Welcome back! Logged in successfully');

      Get.offAll(() => QuestionScreen(), binding: QuestionBinding());
    } catch (e) {
      AppToast.failed('Login failed: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.onClose();
  }
}

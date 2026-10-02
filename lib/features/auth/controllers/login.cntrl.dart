import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myerp/features/teacher/feature/home/bindings/teacher_home_binding.dart';
import 'package:myerp/features/teacher/feature/home/home.dart';
import 'package:myerp/utils/app.toast.dart';

/// Available user roles for login
enum UserType { student, teacher }

class LoginController extends GetxController {
  // Global Form Key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  // Role Selection (Single selection: Student or Teacher)
  final Rx<UserType> selectedRole = UserType.student.obs;

  // Password Visibility Toggle
  final RxBool isPasswordHidden = true.obs;

  // Loading State for Login
  final RxBool isLoading = false.obs;

  // Remember Me Checkbox
  final RxBool rememberMe = false.obs;

  // Getters for role checking
  bool get isStudent => selectedRole.value == UserType.student;
  bool get isTeacher => selectedRole.value == UserType.teacher;

  String get currentRoleName =>
      selectedRole.value == UserType.teacher ? 'Teacher' : 'Student';

  /// Select role - ensures only ONE role can be selected at a time
  void setRole(UserType role) {
    if (selectedRole.value != role) {
      selectedRole.value = role;
    }
  }

  /// Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  /// Toggle remember me
  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? !rememberMe.value;
  }

  /// Email / User ID Validator
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email or ID';
    }
    if (value.trim().length < 3) {
      return 'ID / Email must be at least 3 characters';
    }
    return null;
  }

  /// Password Validator
  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }
    if (value.trim().length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  /// Handle Login Action
  Future<void> login() async {
    final email = emailcontroller.text.trim();
    final password = passcontroller.text.trim();

    if (email.isEmpty) {
      AppToast.failed('Please enter your email or ID');
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

      // Simulate authentication request
      await Future.delayed(const Duration(milliseconds: 1200));

      AppToast.success('Welcome back! Logged in as $currentRoleName');

      // Navigate based on selected role
      if (selectedRole.value == UserType.teacher) {
        Get.offAll(
          () => const TeacherHomeScreen(),
          binding: TeacherHomeBinding(),
        );
      } else {
        AppToast.info('Student Dashboard selected');
      }
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

                                
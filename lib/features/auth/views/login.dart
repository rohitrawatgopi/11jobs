import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myerp/features/auth/controllers/login.cntrl.dart';
import 'package:myerp/theme/app.colors.dart';
import 'package:myerp/widgets/app.text.dart';
import 'package:myerp/widgets/app.text.filed.dart';
import 'package:myerp/widgets/app_btw.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.isRegistered<LoginController>()
        ? Get.find<LoginController>()
        : Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Brand Icon / Logo
                Center(
                  child: Container(
                    width: 72.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.appColor,
                          AppColors.appColor.withOpacity(0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.appColor.withOpacity(0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.school_rounded,
                      color: Colors.white,
                      size: 38.sp,
                    ),
                  ),
                ),
                SizedBox(height: 18.h),

                // Title & Subtitle
                Center(
                  child: AppText(
                    title: "ERP Portal",
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(height: 6.h),
                Center(
                  child: AppText(
                    title: "Select your role and sign in to continue",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textLightColor,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 28.h),

                // Main Card Form Container
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 18,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Role Selector Label
                        AppText(
                          title: "Login As",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                        SizedBox(height: 10.h),

                        // Role Selector Switcher (Student / Teacher) - Only ONE selectable at a time
                        Obx(
                          () => Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                // Student Role Option
                                Expanded(
                                  child: _RoleTabButton(
                                    title: "Student",
                                    icon: Icons.school_outlined,
                                    isSelected: controller.isStudent,
                                    onTap: () =>
                                        controller.setRole(UserType.student),
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                // Teacher Role Option
                                Expanded(
                                  child: _RoleTabButton(
                                    title: "Teacher",
                                    icon: Icons.person_outline_rounded,
                                    isSelected: controller.isTeacher,
                                    onTap: () =>
                                        controller.setRole(UserType.teacher),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 22.h),

                        // Email / ID Field Label
                        Obx(
                          () => AppText(
                            title: controller.isStudent
                                ? "Student ID / Email"
                                : "Teacher ID / Email",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                          ),
                        ),
                        SizedBox(height: 6.h),

                        // Email / ID Input Field
                        Obx(
                          () => AppTextField(
                            controller: controller.emailcontroller,
                            hintText: controller.isStudent
                                ? "Enter your Student ID or email"
                                : "Enter your Teacher ID or email",
                            keyBoardType: TextInputType.emailAddress,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: 20.sp,
                              color: AppColors.appColor,
                            ),
                            borderRadius: 10,
                            focusColor: AppColors.appColor,
                            borderColor: const Color(0xFFE5E7EB),
                            validator: controller.validateEmail,
                          ),
                        ),
                        SizedBox(height: 18.h),

                        // Password Field Label
                        AppText(
                          title: "Password",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        SizedBox(height: 6.h),

                        // Password Input Field with Obscure Toggle
                        Obx(
                          () => AppTextField(
                            controller: controller.passcontroller,
                            hintText: "Enter your password",
                            obscureText: controller.isPasswordHidden.value,
                            keyBoardType: TextInputType.visiblePassword,
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              size: 20.sp,
                              color: AppColors.appColor,
                            ),
                            iconData: IconButton(
                              splashRadius: 20.r,
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 20.sp,
                                color: const Color(0xFF9CA3AF),
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                            borderRadius: 10,
                            focusColor: AppColors.appColor,
                            borderColor: const Color(0xFFE5E7EB),
                            validator: controller.validatePassword,
                          ),
                        ),
                        SizedBox(height: 12.h),

                        // Remember Me & Forgot Password Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => InkWell(
                                onTap: () => controller.toggleRememberMe(null),
                                borderRadius: BorderRadius.circular(6.r),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 22.w,
                                      height: 22.h,
                                      child: Checkbox(
                                        value: controller.rememberMe.value,
                                        onChanged: controller.toggleRememberMe,
                                        activeColor: AppColors.appColor,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    AppText(
                                      title: "Remember me",
                                      fontSize: 12,
                                      color: AppColors.textLightColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Forgot password handler
                              },
                              borderRadius: BorderRadius.circular(4.r),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 4.h,
                                ),
                                child: AppText(
                                  title: "Forgot password?",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.appColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),

                        // Login Action Button
                        Obx(
                          () => AppButton(
                            title: "Login as ${controller.currentRoleName}",
                            isLoading: controller.isLoading.value,
                            onPressed: controller.login,
                            color: AppColors.appColor,
                            textColor: Colors.white,
                            radius: 10,
                            height: 48.h,
                            padding: EdgeInsets.zero,
                            width: double.infinity,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            elevation: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                // Footer Help / Support
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title: "Need help logging in? ",
                        fontSize: 12,
                        color: AppColors.textLightColor,
                      ),
                      InkWell(
                        onTap: () {
                          // Contact support handler
                        },
                        child: AppText(
                          title: "Contact Admin",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.appColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom Interactive Role Tab Button with active/inactive states
class _RoleTabButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleTabButton({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.appColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.appColor.withOpacity(0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18.sp,
              color: isSelected ? Colors.white : const Color(0xFF6B7280),
            ),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.white : const Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

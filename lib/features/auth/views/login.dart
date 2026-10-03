import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myerp/features/auth/controllers/login.cntrl.dart';
import 'package:myerp/features/auth/widget/headers.dart';
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
                SizedBox(height: 18.h),

                Center(
                  child: HeroHeading(
                    badge: 'Hiring workflows, on autopilot',
                    title: 'Create your own\nHiring Workflow',
                    highlight: 'Built once reuse forever.',
                  ),
                ),

                SizedBox(height: 6.h),

                SizedBox(height: 28.h),

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
                        SizedBox(height: 10.h),
                        SizedBox(height: 22.h),

                        AppText(
                          title: "Email",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        SizedBox(height: 6.h),

                        AppTextField(
                          controller: controller.emailcontroller,
                          hintText: "Enter your email",
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
                        SizedBox(height: 18.h),

                        AppText(
                          title: "Password",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        SizedBox(height: 6.h),

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
                          ),
                        ),
                        SizedBox(height: 12.h),

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
                              onTap: () {},
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

                        Obx(
                          () => AppButton(
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  title: "Log In",
                                  textAlign: TextAlign.center,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                            title: "",
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
                        onTap: () {},
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

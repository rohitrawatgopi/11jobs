import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:myerp/features/splash/splash.cntrl.dart';

import 'package:myerp/theme/app.colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController c = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final logo = 'assets/svg/logo-full-dark.svg';

    return Container(
      decoration: AppColors.pageBg(dark),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Obx(
                () => AnimatedOpacity(
                  opacity: c.visible.value ? 1 : 0,
                  duration: const Duration(milliseconds: 600),
                  child: AnimatedScale(
                    scale: c.visible.value ? 1 : 0.85,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOutBack,
                    child: SvgPicture.asset(logo, width: 230),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 56,
              child: Obx(
                () => AnimatedOpacity(
                  opacity: c.visible.value ? 1 : 0,
                  duration: const Duration(milliseconds: 600),
                  child: const Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: AppColors.appColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

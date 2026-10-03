import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myerp/features/auth/bindings/login.binding.dart';
import 'package:myerp/features/auth/views/login.dart';
import 'package:myerp/features/splash/splash.dart';

import 'package:myerp/theme/app.theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ThemeController());

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialBinding: LoginBinding(),
          home: SplashScreen(),
        );
      },
    );
  }
}

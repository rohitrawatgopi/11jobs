import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myerp/features/auth/bindings/login.binding.dart';
import 'package:myerp/features/teacher/feature/home/home.dart';
import 'package:myerp/services/pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefService.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // only vertical
  ]);
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
          debugShowCheckedModeBanner: false,
          initialBinding: LoginBinding(),
          home: const TeacherHomeScreen(),
        );
      },
    );
  }
}

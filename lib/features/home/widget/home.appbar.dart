import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:myerp/features/home/home.cntrl.dart';
import 'package:myerp/theme/app.colors.dart';

Widget topBar(bool dark) {
  final HomeController c = Get.put(HomeController());

  return Padding(
    padding: const EdgeInsets.fromLTRB(4, 6, 16, 4),
    child: Row(
      children: [
        Builder(
          builder: (ctx) => IconButton(
            onPressed: () => Scaffold.of(ctx).openDrawer(),
            icon: Icon(Icons.menu_rounded, color: AppColors.text(dark)),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _greeting(),
                style: TextStyle(
                  color: AppColors.subText(dark),
                  fontSize: 12.5,
                ),
              ),
              Text(
                c.userName,
                style: TextStyle(
                  color: AppColors.text(dark),
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Badge(
            smallSize: 8,
            backgroundColor: AppColors.error,
            child: Icon(
              Icons.notifications_none_rounded,
              color: AppColors.text(dark),
            ),
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () => c.bottomIndex.value = 4,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.appColor,
            child: Text(
              c.userName[0],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

String _greeting() {
  final h = DateTime.now().hour;
  if (h < 12) return 'Good morning';
  if (h < 17) return 'Good afternoon';
  return 'Good evening';
}

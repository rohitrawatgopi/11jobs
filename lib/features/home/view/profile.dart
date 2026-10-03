import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:myerp/features/home/home.cntrl.dart';
import 'package:myerp/theme/app.colors.dart';

Widget profileTab(bool dark) {
  final HomeController homeController = Get.put(HomeController());
  final rows = <(IconData, String)>[
    (Icons.edit_outlined, 'Edit profile'),
    (Icons.description_outlined, 'My resume'),
    (Icons.work_outline_rounded, 'My applications'),
    (Icons.settings_outlined, 'Settings'),
  ];

  return ListView(
    padding: const EdgeInsets.all(16),
    children: [
      const SizedBox(height: 8),
      Center(
        child: CircleAvatar(
          radius: 42,
          backgroundColor: AppColors.appColor,
          child: Text(
            homeController.userName[0],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      const SizedBox(height: 12),
      Center(
        child: Text(
          homeController.userName,
          style: TextStyle(
            color: AppColors.text(dark),
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      const SizedBox(height: 2),
      Center(
        child: Text(
          homeController.userEmail,
          style: TextStyle(color: AppColors.subText(dark), fontSize: 13.5),
        ),
      ),
      const SizedBox(height: 24),
      Container(
        decoration: BoxDecoration(
          color: AppColors.surface(dark),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border(dark)),
        ),
        child: Column(
          children: [
            for (int i = 0; i < rows.length; i++) ...[
              ListTile(
                leading: Icon(rows[i].$1, color: AppColors.appColor, size: 22),
                title: Text(
                  rows[i].$2,
                  style: TextStyle(
                    color: AppColors.text(dark),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.subText(dark),
                ),
                onTap: () {},
              ),
              if (i != rows.length - 1)
                Divider(height: 1, indent: 56, color: AppColors.border(dark)),
            ],
          ],
        ),
      ),
    ],
  );
}

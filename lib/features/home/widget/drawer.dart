import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myerp/features/home/home.cntrl.dart';
import 'package:myerp/theme/app.colors.dart';
import 'package:myerp/theme/app.theme.dart';

Widget drawer(bool dark) {
  final theme = Get.find<ThemeController>();
  final c = Get.find<HomeController>();
  Widget item(IconData icon, String label, VoidCallback onTap) => ListTile(
    leading: Icon(icon, size: 22, color: AppColors.text(dark)),
    title: Text(
      label,
      style: TextStyle(
        color: AppColors.text(dark),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
    onTap: () {
      Get.back();
      onTap();
    },
  );

  return Drawer(
    backgroundColor: AppColors.surface(dark),
    child: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 12, 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.appColor,
                  child: Text(
                    c.userName[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c.userName,
                        style: TextStyle(
                          color: AppColors.text(dark),
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        c.userEmail,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.subText(dark),
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Edit profile',
                  onPressed: () {
                    Get.back();
                    c.bottomIndex.value = 4;
                  },
                  icon: const Icon(
                    Icons.edit_outlined,
                    size: 20,
                    color: AppColors.appColor,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: AppColors.border(dark)),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 6),
              children: [
                item(
                  Icons.person_outline_rounded,
                  'My profile',
                  () => c.bottomIndex.value = 4,
                ),
                item(Icons.work_outline_rounded, 'My applications', () {}),
                item(
                  Icons.bookmark_border_rounded,
                  'Saved jobs',
                  () => c.bottomIndex.value = 3,
                ),
                item(Icons.description_outlined, 'Resume', () {}),
                item(Icons.settings_outlined, 'Settings', () {}),
                Obx(
                  () => SwitchListTile(
                    secondary: Icon(
                      theme.isDark.value
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      size: 22,
                      color: AppColors.text(dark),
                    ),
                    title: Text(
                      'Dark mode',
                      style: TextStyle(
                        color: AppColors.text(dark),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    value: theme.isDark.value,
                    onChanged: theme.toggle,
                  ),
                ),
                item(Icons.help_outline_rounded, 'Help & support', () {}),
              ],
            ),
          ),
          Divider(height: 1, color: AppColors.border(dark)),
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              size: 22,
              color: AppColors.error,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: AppColors.error,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Get.back();
              // TODO: Get.offAll(() => LoginScreen());
            },
          ),
          const SizedBox(height: 6),
        ],
      ),
    ),
  );
}

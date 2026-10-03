import 'package:flutter/material.dart';
import 'package:myerp/theme/app.colors.dart';

Widget emptyState(bool dark, IconData icon, String title, String sub) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: AppColors.subText(dark)),
          const SizedBox(height: 14),
          Text(
            title,
            style: TextStyle(
              color: AppColors.text(dark),
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            sub,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.subText(dark), fontSize: 13.5),
          ),
        ],
      ),
    ),
  );
}

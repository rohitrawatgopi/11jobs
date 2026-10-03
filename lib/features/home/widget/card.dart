import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:myerp/features/home/home.cntrl.dart';
import 'package:myerp/features/home/opportunity_model.dart';
import 'package:myerp/theme/app.colors.dart';

Widget card(OpportunityModel o, bool dark, {double? width}) {
  final isCourse = o.type == OppType.course;
  final tags = o.tags.take(2).toList();
  final HomeController c = Get.put(HomeController());
  return Container(
    width: width,
    margin: width == null ? const EdgeInsets.only(bottom: 12) : null,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: AppColors.surface(dark),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.border(dark)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: o.color.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                o.company[0],
                style: TextStyle(
                  color: o.color,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    o.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.text(dark),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${o.company} · ${o.location}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.subText(dark),
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              final saved = c.savedIds.contains(o.id);
              return GestureDetector(
                onTap: () => c.toggleSave(o.id),
                child: Icon(
                  saved
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  size: 22,
                  color: saved ? AppColors.appColor : AppColors.subText(dark),
                ),
              );
            }),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              o.pay,
              style: TextStyle(
                color: AppColors.text(dark),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            if (isCourse) ...[
              const Icon(
                Icons.star_rounded,
                color: Color(0xFFF59E0B),
                size: 16,
              ),
              const SizedBox(width: 3),
              Text(
                '${o.rating}',
                style: TextStyle(
                  color: AppColors.text(dark),
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10),
            ],
            Text(
              o.duration,
              style: TextStyle(color: AppColors.subText(dark), fontSize: 12.5),
            ),
          ],
        ),
        if (tags.isNotEmpty) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              _tag(_typeLabel(o.type), dark, filled: true),
              for (final t in tags) ...[
                const SizedBox(width: 6),
                _tag(t, dark),
              ],
            ],
          ),
        ],
      ],
    ),
  );
}

Widget _tag(String text, bool dark, {bool filled = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      color: filled ? AppColors.appColor.withValues(alpha: 0.12) : null,
      borderRadius: BorderRadius.circular(6),
      border: filled ? null : Border.all(color: AppColors.border(dark)),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: filled ? AppColors.appColor : AppColors.subText(dark),
        fontSize: 11.5,
        fontWeight: filled ? FontWeight.w600 : FontWeight.w500,
      ),
    ),
  );
}

// ================= CARD =================
String _typeLabel(OppType t) {
  switch (t) {
    case OppType.job:
      return 'Job';
    case OppType.internship:
      return 'Internship';
    case OppType.course:
      return 'Course';
  }
}

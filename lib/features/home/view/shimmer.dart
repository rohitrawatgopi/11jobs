import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmer(bool dark) {
  final base = dark ? const Color(0xFF1F2937) : const Color(0xFFDCE6F5);
  final highlight = dark ? const Color(0xFF374151) : const Color(0xFFF1F5F9);

  Widget box(double h, {double? w, double r = 12}) => Container(
    height: h,
    width: w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(r),
    ),
  );

  return Shimmer.fromColors(
    baseColor: base,
    highlightColor: highlight,
    child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        box(66, r: 14),
        const SizedBox(height: 24),
        box(16, w: 150, r: 4),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              box(140, w: 285, r: 14),
              const SizedBox(width: 12),
              box(140, w: 285, r: 14),
            ],
          ),
        ),
        const SizedBox(height: 24),
        box(16, w: 110, r: 4),
        const SizedBox(height: 12),
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: box(112, r: 14),
          ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myerp/features/home/home.cntrl.dart';
import 'package:myerp/theme/app.colors.dart';

Widget searchBar(bool dark) {
  final c = Get.find<HomeController>();
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.surface(dark),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border(dark)),
      ),
      child: TextField(
        controller: c.searchController,
        onChanged: c.onSearch,
        textInputAction: TextInputAction.search,
        style: TextStyle(color: AppColors.text(dark), fontSize: 15),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search jobs, internships, courses',
          hintStyle: TextStyle(color: AppColors.subText(dark), fontSize: 14),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: AppColors.subText(dark),
          ),
          suffixIcon: Obx(
            () => c.query.value.isEmpty
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.tune_rounded,
                      size: 20,
                      color: AppColors.subText(dark),
                    ),
                  )
                : IconButton(
                    onPressed: c.clearSearch,
                    icon: Icon(
                      Icons.close_rounded,
                      size: 20,
                      color: AppColors.subText(dark),
                    ),
                  ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
        ),
      ),
    ),
  );
}

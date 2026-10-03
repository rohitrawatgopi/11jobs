import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:myerp/features/home/home.cntrl.dart';
import 'package:myerp/features/home/view/shimmer.dart';
import 'package:myerp/features/home/widget/card.dart';
import 'package:myerp/features/home/widget/empty.card.dart';

Widget savedTab(bool dark) {
  final HomeController homeController = Get.put(HomeController());
  return Obx(() {
    if (homeController.isLoading.value) return shimmer(dark);
    final items = homeController.all
        .where((o) => homeController.savedIds.contains(o.id))
        .toList();
    if (items.isEmpty) {
      return emptyState(
        dark,
        Icons.bookmark_border_rounded,
        'No saved items',
        'Tap the bookmark on any job, internship or course to keep it here.',
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      itemCount: items.length,
      itemBuilder: (_, i) => card(items[i], dark),
    );
  });
}

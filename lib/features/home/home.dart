import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myerp/features/home/home.cntrl.dart';
import 'package:myerp/features/home/view/jobs.saved.dart';
import 'package:myerp/features/home/view/profile.dart';
import 'package:myerp/features/home/view/shimmer.dart';
import 'package:myerp/features/home/widget/card.dart';
import 'package:myerp/features/home/widget/drawer.dart';
import 'package:myerp/features/home/widget/empty.card.dart';
import 'package:myerp/features/home/widget/home.appbar.dart';
import 'package:myerp/features/home/widget/nav.bar.dart';
import 'package:myerp/features/home/widget/sarch.bar.dart';
import 'package:myerp/theme/app.colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: AppColors.pageBg(dark),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: drawer(dark),
        body: SafeArea(
          child: Column(
            children: [
              topBar(dark),
              Expanded(child: Obx(() => _body(dark))),
            ],
          ),
        ),
        bottomNavigationBar: bottomNav(dark),
      ),
    );
  }

  Widget _body(bool dark) {
    switch (homeController.bottomIndex.value) {
      case 3:
        return savedTab(dark);
      case 4:
        return profileTab(dark);
      default:
        return _feedTab(dark);
    }
  }

  Widget _feedTab(bool dark) {
    return Column(
      children: [
        searchBar(dark),
        _categoryChips(dark),
        const SizedBox(height: 10),
        Expanded(
          child: Obx(() {
            if (homeController.isLoading.value) return shimmer(dark);
            return RefreshIndicator(
              color: AppColors.appColor,
              onRefresh: homeController.loadData,
              child: homeController.isFiltering
                  ? _filteredList(dark)
                  : _dashboard(dark),
            );
          }),
        ),
      ],
    );
  }

  Widget _categoryChips(bool dark) {
    return SizedBox(
      height: 38,
      child: Obx(() {
        final selected = homeController.selectedCategory.value;
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: homeController.categories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, i) {
            final sel = selected == i;
            return ChoiceChip(
              label: Text(homeController.categories[i]),
              selected: sel,
              showCheckmark: false,
              onSelected: (_) => homeController.selectCategory(i),
              backgroundColor: AppColors.surface(dark),
              selectedColor: AppColors.appColor,
              labelStyle: TextStyle(
                color: sel ? Colors.white : AppColors.text(dark),
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
              side: BorderSide(
                color: sel ? AppColors.appColor : AppColors.border(dark),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        );
      }),
    );
  }

  // ================= DASHBOARD =================
  Widget _dashboard(bool dark) {
    final rec = homeController.recommended;
    final jobs = homeController.jobs.take(3).toList();
    final interns = homeController.internships.take(3).toList();
    final courses = homeController.courses.take(3).toList();

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        _statsStrip(dark),
        const SizedBox(height: 22),
        _sectionHeader('Recommended for you', dark, null),
        SizedBox(
          height: 152,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: rec.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) => card(rec[i], dark, width: 285),
          ),
        ),
        const SizedBox(height: 22),
        _sectionHeader(
          'Latest jobs',
          dark,
          () => homeController.selectCategory(1),
        ),
        ...jobs.map((o) => card(o, dark)),
        const SizedBox(height: 10),
        _sectionHeader(
          'Internships',
          dark,
          () => homeController.selectCategory(2),
        ),
        ...interns.map((o) => card(o, dark)),
        const SizedBox(height: 10),
        _sectionHeader('Courses', dark, () => homeController.selectCategory(3)),
        ...courses.map((o) => card(o, dark)),
      ],
    );
  }

  Widget _statsStrip(bool dark) {
    Widget item(String value, String label) => Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: AppColors.text(dark),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(color: AppColors.subText(dark), fontSize: 12),
          ),
        ],
      ),
    );

    Widget divider() =>
        Container(width: 1, height: 30, color: AppColors.border(dark));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface(dark),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border(dark)),
      ),
      child: Obx(
        () => Row(
          children: [
            item('${homeController.applied}', 'Applied'),
            divider(),
            item('${homeController.savedIds.length}', 'Saved'),
            divider(),
            item('${homeController.interviews}', 'Interviews'),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, bool dark, VoidCallback? onViewAll) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.text(dark),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (onViewAll != null)
            GestureDetector(
              onTap: onViewAll,
              child: const Text(
                'View all',
                style: TextStyle(
                  color: AppColors.appColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _filteredList(bool dark) {
    final list = homeController.filtered;

    if (list.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 320,
            child: emptyState(
              dark,
              Icons.search_off_rounded,
              'Nothing found',
              'Try a different keyword or category.',
            ),
          ),
        ],
      );
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      itemCount: list.length + 1,
      itemBuilder: (_, i) {
        if (i == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              '${list.length} results',
              style: TextStyle(color: AppColors.subText(dark), fontSize: 13),
            ),
          );
        }
        return card(list[i - 1], dark);
      },
    );
  }
}

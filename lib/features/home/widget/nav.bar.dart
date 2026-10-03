import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myerp/features/home/home.cntrl.dart';
import 'package:myerp/theme/app.colors.dart';

class _NavData {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavData(this.icon, this.activeIcon, this.label);
}

const _items = [
  _NavData(Icons.home_outlined, Icons.home_rounded, 'Home'),
  _NavData(Icons.work_outline_rounded, Icons.work_rounded, 'Jobs'),
  _NavData(Icons.school_outlined, Icons.school_rounded, 'Courses'),
  _NavData(Icons.bookmark_border_rounded, Icons.bookmark_rounded, 'Saved'),
  _NavData(Icons.person_outline_rounded, Icons.person_rounded, 'Profile'),
];

Widget bottomNav(bool dark) {
  final HomeController c = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  const barHeight = 64.0;
  const duration = Duration(milliseconds: 320);
  const curve = Curves.easeOutCubic;

  return Container(
    decoration: BoxDecoration(
      color: AppColors.surface(dark),
      border: Border(top: BorderSide(color: AppColors.border(dark))),
    ),
    child: SafeArea(
      top: false,
      child: SizedBox(
        height: barHeight,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth / _items.length;

            return Obx(() {
              final sel = c.bottomIndex.value;

              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: duration,
                    curve: curve,
                    left: sel * w,
                    top: 0,
                    width: w,
                    height: barHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.appColor.withValues(
                              alpha: dark ? 0.22 : 0.12,
                            ),
                            AppColors.appColor.withValues(alpha: 0),
                          ],
                        ),
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    duration: duration,
                    curve: curve,
                    left: sel * w + (w - 32) / 2,
                    top: 0,
                    width: 32,
                    height: 3,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      for (int i = 0; i < _items.length; i++)
                        Expanded(
                          child: _NavTile(
                            data: _items[i],
                            selected: sel == i,
                            dark: dark,
                            onTap: () {
                              if (sel != i) HapticFeedback.selectionClick();
                              c.onBottomTap(i);
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              );
            });
          },
        ),
      ),
    ),
  );
}

class _NavTile extends StatelessWidget {
  final _NavData data;
  final bool selected;
  final bool dark;
  final VoidCallback onTap;

  const _NavTile({
    required this.data,
    required this.selected,
    required this.dark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.appColor : AppColors.subText(dark);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
            scale: selected ? 1.15 : 1.0,
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOutBack,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, anim) =>
                  FadeTransition(opacity: anim, child: child),
              child: Icon(
                selected ? data.activeIcon : data.icon,
                key: ValueKey(selected),
                size: 24,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 4),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              color: color,
            ),
            child: Text(data.label),
          ),
        ],
      ),
    );
  }
}

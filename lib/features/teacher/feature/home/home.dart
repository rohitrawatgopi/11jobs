import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myerp/features/teacher/feature/home/controllers/teacher_home_controller.dart';
import 'package:myerp/theme/app.colors.dart';
import 'package:myerp/utils/app.toast.dart';
import 'package:myerp/widgets/app.text.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject or find TeacherHomeController
    final TeacherHomeController controller =
        Get.isRegistered<TeacherHomeController>()
        ? Get.find<TeacherHomeController>()
        : Get.put(TeacherHomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: _buildCustomTeacherAppBar(controller),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        color: AppColors.appColor,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Next Upcoming Class Live Banner
              _buildUpcomingClassBanner(controller),
              SizedBox(height: 18.h),

              // Today's Quick Stats Row
              _buildQuickStatsSection(controller),
              SizedBox(height: 22.h),

              // Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    title: "Class & Academic Services",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1E293B),
                  ),
                  InkWell(
                    onTap: () {
                      AppToast.info("All services are shown below");
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 2.h,
                      ),
                      child: Text(
                        "Manage",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.appColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Main Action Cards Grid (Attendance, Class, Homework, Exams, etc.)
              _buildTeacherCardsGrid(context),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  /// Custom Top App Bar showing School Name, Teacher Name, and Notifications
  PreferredSize _buildCustomTeacherAppBar(TeacherHomeController controller) {
    return PreferredSize(
      preferredSize: Size.fromHeight(88.h),
      child: Container(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 42.h,
          bottom: 12.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Teacher Avatar
            Container(
              width: 46.w,
              height: 46.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.appColor,
                    AppColors.appColor.withOpacity(0.75),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.appColor.withOpacity(0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "RS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // School Name & Teacher Name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // School Name
                  Obx(
                    () => Row(
                      children: [
                        Icon(
                          Icons.account_balance_rounded,
                          size: 13.sp,
                          color: AppColors.appColor,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            controller.schoolName.value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF64748B),
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),

                  // Teacher Name
                  Obx(
                    () => Text(
                      controller.teacherName.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),

                  // Teacher Designation
                  Obx(
                    () => Text(
                      controller.teacherDesignation.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textLightColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Notification Bell with Badge
            Obx(
              () => Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1F5F9),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        size: 20.sp,
                        color: const Color(0xFF334155),
                      ),
                      onPressed: () {
                        AppToast.info(
                          "You have ${controller.unreadNotifications.value} new circulars",
                        );
                      },
                    ),
                  ),
                  if (controller.unreadNotifications.value > 0)
                    Positioned(
                      top: 2,
                      right: 2,
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16.w,
                          minHeight: 16.h,
                        ),
                        child: Center(
                          child: Text(
                            "${controller.unreadNotifications.value}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Live banner for next upcoming class with quick action
  Widget _buildUpcomingClassBanner(TeacherHomeController controller) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF334155)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.appColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppColors.appColor.withOpacity(0.4),
                    width: 0.8,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.h,
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "UPCOMING CLASS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Text(
                  controller.nextClass["status"] ?? "",
                  style: TextStyle(
                    color: const Color(0xFFFDBA74),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Class details
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.nextClass["classGrade"]} • ${controller.nextClass["subject"]}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 13.sp,
                            color: const Color(0xFF94A3B8),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            controller.nextClass["time"] ?? "",
                            style: TextStyle(
                              color: const Color(0xFF94A3B8),
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Icon(
                            Icons.meeting_room_outlined,
                            size: 13.sp,
                            color: const Color(0xFF94A3B8),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            controller.nextClass["room"] ?? "",
                            style: TextStyle(
                              color: const Color(0xFF94A3B8),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppToast.success("Opening Class 10-A Attendance Sheet");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                  ),
                  child: Text(
                    "Take Attendance",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Quick Stats overview (Total students, today's classes, attendance marked)
  Widget _buildQuickStatsSection(TeacherHomeController controller) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: _QuickStatCard(
              title: "Students",
              value: "${controller.totalStudents.value}",
              subtitle: "Total enrolled",
              icon: Icons.groups_outlined,
              iconColor: const Color(0xFF2563EB),
              bgColor: const Color(0xFFEFF6FF),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: _QuickStatCard(
              title: "Classes",
              value: "${controller.classesToday.value}",
              subtitle: "Scheduled today",
              icon: Icons.calendar_today_outlined,
              iconColor: const Color(0xFF059669),
              bgColor: const Color(0xFFECFDF5),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: _QuickStatCard(
              title: "Attendance",
              value: "${controller.attendanceCompleted.value}/4",
              subtitle: "Completed",
              icon: Icons.task_alt_rounded,
              iconColor: const Color(0xFFD97706),
              bgColor: const Color(0xFFFFFBEB),
            ),
          ),
        ],
      ),
    );
  }

  /// Grid of Teacher action cards: Attendance, Classes, Homework, Exams, etc.
  Widget _buildTeacherCardsGrid(BuildContext context) {
    final List<TeacherCardItem> cards = [
      TeacherCardItem(
        title: "Attendance",
        subtitle: "Mark & view daily records",
        badgeText: "Daily Active",
        icon: Icons.fact_check_rounded,
        primaryColor: const Color(0xFFFF6F00), // App primary orange
        bgColor: const Color(0xFFFFF7ED),
        onTap: () {
          AppToast.info("Attendance: Select class to mark attendance");
        },
      ),
      TeacherCardItem(
        title: "My Classes",
        subtitle: "Timetable, batch & rooms",
        badgeText: "4 Today",
        icon: Icons.meeting_room_rounded,
        primaryColor: const Color(0xFF2563EB), // Blue
        bgColor: const Color(0xFFEFF6FF),
        onTap: () {
          AppToast.info("My Classes: Viewing weekly timetable");
        },
      ),
      TeacherCardItem(
        title: "Homework",
        subtitle: "Create & grade assignments",
        badgeText: "12 Pending",
        icon: Icons.assignment_rounded,
        primaryColor: const Color(0xFF7C3AED), // Purple
        bgColor: const Color(0xFFF5F3FF),
        onTap: () {
          AppToast.info("Homework: 12 assignments pending review");
        },
      ),
      TeacherCardItem(
        title: "Examinations",
        subtitle: "Marks entry & grade sheets",
        badgeText: "Term 1",
        icon: Icons.military_tech_rounded,
        primaryColor: const Color(0xFF059669), // Emerald Green
        bgColor: const Color(0xFFECFDF5),
        onTap: () {
          AppToast.info("Exams: Select exam to upload student marks");
        },
      ),
      TeacherCardItem(
        title: "Leave Requests",
        subtitle: "Student leaves & approvals",
        badgeText: "2 Pending",
        icon: Icons.event_busy_rounded,
        primaryColor: const Color(0xFFDC2626), // Red
        bgColor: const Color(0xFFFEF2F2),
        onTap: () {
          AppToast.info("Leave Requests: 2 student leave applications pending");
        },
      ),
      TeacherCardItem(
        title: "Notice Board",
        subtitle: "School circulars & news",
        badgeText: "New Circular",
        icon: Icons.campaign_rounded,
        primaryColor: const Color(0xFF0284C7), // Sky Blue
        bgColor: const Color(0xFFF0F9FF),
        onTap: () {
          AppToast.info("Notice Board: Latest staff & school announcements");
        },
      ),
      TeacherCardItem(
        title: "Syllabus Tracker",
        subtitle: "Curriculum & lesson plans",
        badgeText: "78% Complete",
        icon: Icons.auto_stories_rounded,
        primaryColor: const Color(0xFFEA580C), // Dark Orange
        bgColor: const Color(0xFFFFF7ED),
        onTap: () {
          AppToast.info("Syllabus: Class 10-A Maths is on schedule");
        },
      ),
      TeacherCardItem(
        title: "Student Directory",
        subtitle: "Roll numbers & guardians",
        badgeText: "148 Students",
        icon: Icons.groups_rounded,
        primaryColor: const Color(0xFF475569), // Slate
        bgColor: const Color(0xFFF8FAFC),
        onTap: () {
          AppToast.info("Student Directory: Viewing Class 10-A roster");
        },
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1.12,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return _TeacherActionCard(item: cards[index]);
      },
    );
  }
}

/// Model for Teacher Dashboard Cards
class TeacherCardItem {
  final String title;
  final String subtitle;
  final String badgeText;
  final IconData icon;
  final Color primaryColor;
  final Color bgColor;
  final VoidCallback onTap;

  TeacherCardItem({
    required this.title,
    required this.subtitle,
    required this.badgeText,
    required this.icon,
    required this.primaryColor,
    required this.bgColor,
    required this.onTap,
  });
}

/// Interactive Card Widget for Teacher actions
class _TeacherActionCard extends StatelessWidget {
  final TeacherCardItem item;

  const _TeacherActionCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(16.r),
        splashColor: item.primaryColor.withOpacity(0.12),
        highlightColor: item.primaryColor.withOpacity(0.06),
        child: Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Row: Icon Container & Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: item.bgColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      item.icon,
                      color: item.primaryColor,
                      size: 24.sp,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: item.primaryColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      item.badgeText,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w700,
                        color: item.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              // Bottom Section: Title, Subtitle, and small arrow
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1E293B),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 11.sp,
                        color: const Color(0xFF94A3B8),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    item.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Small Quick Stat Card Widget
class _QuickStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  const _QuickStatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 0.8.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, size: 16.sp, color: iconColor),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF0F172A),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF334155),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 9.sp, color: const Color(0xFF94A3B8)),
          ),
        ],
      ),
    );
  }
}

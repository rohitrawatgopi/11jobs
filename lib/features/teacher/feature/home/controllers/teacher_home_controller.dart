import 'package:get/get.dart';

class TeacherHomeController extends GetxController {
  // School & Teacher Info
  final RxString schoolName = "Delhi Public International School".obs;
  final RxString teacherName = "Prof. Rajesh Sharma".obs;
  final RxString teacherDesignation = "Senior Faculty • Class 10-A".obs;
  final RxString employeeId = "TCH-2024-042".obs;

  // Notification count
  final RxInt unreadNotifications = 3.obs;

  // Selected date / academic session
  
  // Today's Stats
  final RxInt totalStudents = 148.obs;
  final RxInt classesToday = 4.obs;
  final RxInt attendanceCompleted = 3.obs;
  final RxInt pendingSubmissions = 12.obs;

  // Next Upcoming Class Info
  final RxMap<String, String> nextClass = <String, String>{
    "subject": "Mathematics",
    "classGrade": "Class 10-A",
    "time": "10:30 AM - 11:15 AM",
    "room": "Room 204",
    "status": "In 25 mins",
  }.obs;

  // Is data refreshing
  final RxBool isRefreshing = false.obs;

  /// Refresh dashboard data
  Future<void> refreshData() async {
    isRefreshing.value = true;
    await Future.delayed(const Duration(milliseconds: 800));
    isRefreshing.value = false;
  }
}

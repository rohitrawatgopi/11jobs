import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'opportunity_model.dart';

class HomeController extends GetxController {
  final String userName = 'Rohit';
  final String userEmail = 'rohit@example.com';

  final TextEditingController searchController = TextEditingController();
  final RxBool isLoading = true.obs;
  final RxInt selectedCategory = 0.obs;
  final RxInt bottomIndex = 0.obs;
  final RxString query = ''.obs;
  final RxSet<String> savedIds = <String>{}.obs;
  final RxList<OpportunityModel> all = <OpportunityModel>[].obs;

  final List<String> categories = const [
    'All',
    'Jobs',
    'Internships',
    'Courses',
  ];

  final int applied = 12;
  final int interviews = 3;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1400));
    all.assignAll(_staticData);
    isLoading.value = false;
  }

  List<OpportunityModel> get jobs =>
      all.where((o) => o.type == OppType.job).toList();
  List<OpportunityModel> get internships =>
      all.where((o) => o.type == OppType.internship).toList();
  List<OpportunityModel> get courses =>
      all.where((o) => o.type == OppType.course).toList();
  List<OpportunityModel> get recommended => jobs.take(5).toList();

  bool get isFiltering =>
      query.value.trim().isNotEmpty || selectedCategory.value != 0;

  List<OpportunityModel> get filtered {
    final q = query.value.trim().toLowerCase();
    final cat = selectedCategory.value;
    return all.where((o) {
      final catOk = cat == 0 || o.type == OppType.values[cat - 1];
      final searchOk =
          q.isEmpty ||
          o.title.toLowerCase().contains(q) ||
          o.company.toLowerCase().contains(q) ||
          o.tags.any((t) => t.toLowerCase().contains(q));
      return catOk && searchOk;
    }).toList();
  }

  void onSearch(String v) => query.value = v;

  void clearSearch() {
    searchController.clear();
    query.value = '';
  }

  void selectCategory(int i) {
    selectedCategory.value = i;
    if (bottomIndex.value <= 2) {
      bottomIndex.value = i == 1 ? 1 : (i == 3 ? 2 : 0);
    }
  }

  void onBottomTap(int i) {
    bottomIndex.value = i;
    if (i == 0) selectedCategory.value = 0;
    if (i == 1) selectedCategory.value = 1;
    if (i == 2) selectedCategory.value = 3;
  }

  void toggleSave(String id) {
    if (savedIds.contains(id)) {
      savedIds.remove(id);
    } else {
      savedIds.add(id);
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  static const List<OpportunityModel> _staticData = [
    OpportunityModel(
      id: 'j1',
      type: OppType.job,
      title: 'Flutter Developer',
      company: 'TechNova',
      location: 'Bengaluru',
      pay: '₹8-14 LPA',
      duration: 'Full-time',
      tags: ['Flutter', 'Dart'],
      color: Color(0xFF2563EB),
    ),
    OpportunityModel(
      id: 'j2',
      type: OppType.job,
      title: 'Node.js Backend Developer',
      company: 'CloudNest',
      location: 'Remote',
      pay: '₹10-16 LPA',
      duration: 'Full-time',
      tags: ['Node.js', 'MongoDB'],
      color: Color(0xFF16A34A),
    ),
    OpportunityModel(
      id: 'j3',
      type: OppType.job,
      title: 'Full Stack Developer',
      company: 'Appify Labs',
      location: 'Bengaluru',
      pay: '₹12-20 LPA',
      duration: 'Full-time',
      tags: ['React', 'Node.js'],
      color: Color(0xFFF59E0B),
    ),
    OpportunityModel(
      id: 'j4',
      type: OppType.job,
      title: 'UI/UX Designer',
      company: 'PixelCraft',
      location: 'Hybrid',
      pay: '₹6-10 LPA',
      duration: 'Full-time',
      tags: ['Figma', 'Design'],
      color: Color(0xFF9333EA),
    ),
    OpportunityModel(
      id: 'j5',
      type: OppType.job,
      title: 'Android TV Developer',
      company: 'StreamBox',
      location: 'Remote',
      pay: '₹9-15 LPA',
      duration: 'Contract',
      tags: ['Flutter', 'TV'],
      color: Color(0xFFDC2626),
    ),
    // Internships
    OpportunityModel(
      id: 'i1',
      type: OppType.internship,
      title: 'Flutter Intern',
      company: 'TechNova',
      location: 'Remote',
      pay: '₹15k/month',
      duration: '3 months',
      tags: ['Flutter'],
      color: Color(0xFF2563EB),
    ),
    OpportunityModel(
      id: 'i2',
      type: OppType.internship,
      title: 'Backend Intern',
      company: 'CloudNest',
      location: 'Bengaluru',
      pay: '₹12k/month',
      duration: '6 months',
      tags: ['Node.js'],
      color: Color(0xFF16A34A),
    ),
    OpportunityModel(
      id: 'i3',
      type: OppType.internship,
      title: 'Digital Marketing Intern',
      company: 'GrowthHub',
      location: 'Hybrid',
      pay: '₹8k/month',
      duration: '2 months',
      tags: ['Marketing', 'SEO'],
      color: Color(0xFFF59E0B),
    ),
    OpportunityModel(
      id: 'i4',
      type: OppType.internship,
      title: 'UI Design Intern',
      company: 'PixelCraft',
      location: 'Remote',
      pay: '₹10k/month',
      duration: '3 months',
      tags: ['Figma'],
      color: Color(0xFF9333EA),
    ),
    // Courses
    OpportunityModel(
      id: 'c1',
      type: OppType.course,
      title: 'Flutter Complete Bootcamp',
      company: 'CodeAcademy',
      location: 'Online',
      pay: '₹499',
      duration: '40 hours',
      rating: 4.8,
      tags: ['Flutter'],
      color: Color(0xFF2563EB),
    ),
    OpportunityModel(
      id: 'c2',
      type: OppType.course,
      title: 'Node.js & Express Masterclass',
      company: 'DevSchool',
      location: 'Online',
      pay: '₹699',
      duration: '32 hours',
      rating: 4.7,
      tags: ['Node.js'],
      color: Color(0xFF16A34A),
    ),
    OpportunityModel(
      id: 'c3',
      type: OppType.course,
      title: 'UI/UX Design Fundamentals',
      company: 'DesignLab',
      location: 'Online',
      pay: 'Free',
      duration: '12 hours',
      rating: 4.6,
      tags: ['Figma', 'Design'],
      color: Color(0xFF9333EA),
    ),
    OpportunityModel(
      id: 'c4',
      type: OppType.course,
      title: 'Data Structures in Dart',
      company: 'CodeAcademy',
      location: 'Online',
      pay: '₹399',
      duration: '20 hours',
      rating: 4.5,
      tags: ['DSA', 'Dart'],
      color: Color(0xFFDC2626),
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myerp/features/home/home.dart';
import 'package:myerp/features/question/question.cnntrl.dart';
import 'package:myerp/theme/app.colors.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});

  final QuizController c = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.bg(dark),
      appBar: AppBar(
        backgroundColor: AppColors.bg(dark),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.text(dark)),
        title: Text(
          'Quick GK Quiz',
          style: TextStyle(
            color: AppColors.text(dark),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(dark),
            Expanded(
              child: PageView.builder(
                controller: c.pageController,
                onPageChanged: c.onPageChanged,
                itemCount: c.total,
                itemBuilder: (_, i) => _buildQuestionPage(i, dark),
              ),
            ),
            _buildBottomBar(context, dark),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool dark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
      child: Obx(() {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${c.currentIndex.value + 1} of ${c.total}',
                  style: TextStyle(
                    color: AppColors.subText(dark),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.appColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_rounded,
                        size: 16,
                        color: AppColors.appColor,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Attempted ${c.attempted}/${c.total}',
                        style: const TextStyle(
                          color: AppColors.appColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            Row(
              children: List.generate(c.total, (i) {
                final answered = c.selectedAnswers.containsKey(i);
                final active = i <= c.currentIndex.value;
                return Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 6,
                    margin: EdgeInsets.only(right: i == c.total - 1 ? 0 : 6),
                    decoration: BoxDecoration(
                      color: answered
                          ? AppColors.success
                          : active
                          ? AppColors.appColor
                          : AppColors.border(dark),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildQuestionPage(int qIndex, bool dark) {
    final q = c.questions[qIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.appColor.withOpacity(0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'General Knowledge',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  q.question,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    height: 1.35,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Obx(() {
            final selected = c.selectedAnswers[qIndex];
            return Column(
              children: List.generate(q.options.length, (oIndex) {
                return _optionTile(
                  dark: dark,
                  label: String.fromCharCode(65 + oIndex), // A B C D
                  text: q.options[oIndex],
                  isSelected: selected == oIndex,
                  onTap: () => c.selectOption(qIndex, oIndex),
                );
              }),
            );
          }),
        ],
      ),
    );
  }

  Widget _optionTile({
    required bool dark,
    required String label,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.appColor.withOpacity(dark ? 0.2 : 0.08)
              : AppColors.surface(dark),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.appColor : AppColors.border(dark),
            width: isSelected ? 1.8 : 1,
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.appColor : AppColors.border(dark),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : Text(
                      label,
                      style: TextStyle(
                        color: AppColors.subText(dark),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.text(dark),
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, bool dark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      decoration: BoxDecoration(
        color: AppColors.surface(dark),
        border: Border(top: BorderSide(color: AppColors.border(dark))),
      ),
      child: Obx(() {
        final showBack = c.currentIndex.value > 0;
        return Row(
          children: [
            if (showBack) ...[
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  onPressed: c.previous,
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                    side: const BorderSide(color: AppColors.appColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: AppColors.appColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  if (c.isLast) {
                    _showResult(context, dark);
                  } else {
                    c.next();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appColor,
                  elevation: 0,
                  minimumSize: const Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  c.isLast ? 'Submit' : 'Next',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _showResult(BuildContext context, bool dark) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.surface(dark),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.emoji_events_rounded,
                color: AppColors.success,
                size: 38,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Quiz Completed!',
              style: TextStyle(
                color: AppColors.text(dark),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Attempted ${c.attempted}/${c.total}',
              style: TextStyle(color: AppColors.subText(dark), fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              'Score: ${c.score}/${c.total}',
              style: const TextStyle(
                color: AppColors.appColor,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back(); // close dialog
                Get.offAll(() => HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appColor,
                elevation: 0,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Go to Home',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
                c.reset();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }
}

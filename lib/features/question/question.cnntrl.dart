import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myerp/features/question/question.model.dart';

class QuizController extends GetxController {
  final PageController pageController = PageController();

  final List<QuestionModel> questions = const [
    QuestionModel(
      question: 'What is the capital of India?',
      options: ['Mumbai', 'New Delhi', 'Kolkata', 'Chennai'],
      correctIndex: 1,
    ),
    QuestionModel(
      question: 'What is the capital of Australia?',
      options: ['Sydney', 'Melbourne', 'Canberra', 'Perth'],
      correctIndex: 2,
    ),
    QuestionModel(
      question: 'Which planet is known as the Red Planet?',
      options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
      correctIndex: 1,
    ),
    QuestionModel(
      question: 'Who wrote the national anthem of India?',
      options: [
        'Bankim Chandra Chatterjee',
        'Rabindranath Tagore',
        'Sarojini Naidu',
        'Subramania Bharati',
      ],
      correctIndex: 1,
    ),
  ];

  final RxInt currentIndex = 0.obs;

  final RxMap<int, int> selectedAnswers = <int, int>{}.obs;

  int get total => questions.length;
  int get attempted => selectedAnswers.length;
  bool get isLast => currentIndex.value == total - 1;
  double get progress => (currentIndex.value + 1) / total;

  int get score {
    int s = 0;
    selectedAnswers.forEach((q, o) {
      if (questions[q].correctIndex == o) s++;
    });
    return s;
  }

  void selectOption(int questionIndex, int optionIndex) {
    selectedAnswers[questionIndex] = optionIndex;
  }

  void onPageChanged(int index) => currentIndex.value = index;

  void next() {
    if (!isLast) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previous() {
    if (currentIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void reset() {
    selectedAnswers.clear();
    currentIndex.value = 0;
    if (pageController.hasClients) pageController.jumpToPage(0);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/lesson_app_bar.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/question_slide.dart';
import 'package:badihi/presentation/screens/lesson_results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestsPage extends StatefulWidget {
  const TestsPage({super.key});

  @override
  State<TestsPage> createState() => _TestsPageState();
}

class _TestsPageState extends State<TestsPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> slides = [
    QuestionSlide(
      questionsTitle: "ما السبب الرئيسي الذي يجعل لغة بايثون مناسبة للمبتدئين؟",
      iconName: 'python-icon',
      questionsList: [
        'تعتمد على كتابة أكواد طويلة',
        'تعتمد على كتابة أكواد طويلة',
        'تعتمد على كتابة أكواد طويلة',
        'تعتمد على كتابة أكواد طويلة',
      ],
      insightfulText: "لغة بايثون هي لغة سهلة القراءة والكتابة وقريبة من اللغة البشرية.",
    ),
    QuestionSlide(
      questionsTitle: "ما السبب الرئيسي الذي يجعل لغة بايثون مناسبة للمبتدئين؟",
      questionsList: [
        'تعتمد على كتابة أكواد طويلة',
        'تعتمد على كتابة أكواد طويلة',
        'تعتمد على كتابة أكواد طويلة',
        'تعتمد على كتابة أكواد طويلة',
      ],
      insightfulText: "لغة بايثون هي لغة سهلة القراءة والكتابة وقريبة من اللغة البشرية.",
    ),
    QuestionSlide(
      questionsTitle: "ما السبب الرئيسي الذي يجعل لغة بايثون مناسبة للمبتدئين؟",
      questionsList: [
        'تعتمد على كتابة أكواد طويلة',
        'تعتمد على كتابة أكواد طويلة',
        'تعتمد على كتابة أكواد طويلة',
        'تعتمد على كتابة أكواد طويلة',
      ],
      insightfulText: "لغة بايثون هي لغة سهلة القراءة والكتابة وقريبة من اللغة البشرية.",
    ),
  ];

  double get progress => (_currentIndex + 1) / slides.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LessonAppBar(
        appbarTitle: "اختبار الدرس",
        elevationIconName: "x-close",
        slidesNumber: slides.length,
        currentSlide: _currentIndex + 1,
        lessonProgress: progress,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing4XL,
        ),
        child: PageView.builder(
          controller: _pageController,
          itemCount: slides.length,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          itemBuilder: (context, index) {
            final slide = slides[index];
            return slide;
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            AppSpacing.spacing2XL,
            AppSpacing.spacingXL,
            AppSpacing.spacing2XL,
            AppSpacing.spacing4XL,
          ),
          child: MainButton(
            text: _currentIndex == slides.length - 1 ? "إنهاء الاختبار" : "السؤال التالي",
            iconName: "icons/arrow-narrow-left",
            iconColor: _currentIndex == slides.length - 1
                ? context.appColors.fgDisabledSubtle
                : context.appColors.buttonPrimaryIcon,
            isPrefixIcon: false,
            // isDisabled: _currentIndex == slides.length - 1 ? true : false,
            onTap: () {
              if (_currentIndex < slides.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return LessonResultsPage(
                        totalQuestions: 3,
                        correctQuestions: 1,
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

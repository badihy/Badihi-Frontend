import 'dart:async';

import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/confirmation_bottom_sheet.dart';
import 'package:badihi/presentation/components/custom_bottom_sheet.dart';
import 'package:badihi/presentation/components/lesson_app_bar.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/question_slide.dart';
import 'package:badihi/presentation/components/quotation_slide.dart';
import 'package:badihi/presentation/components/secondary_button.dart';
import 'package:badihi/presentation/components/main_slide.dart';
import 'package:badihi/presentation/screens/tests_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonPage extends StatefulWidget {
  final List<String> slidesIds;
  const LessonPage({super.key, required this.slidesIds});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> slides = [
    MainSlide(
      slideTitle: 'مقدمة الدرس 1',
      iconName: 'python-icon',
      introdutionTexts: [
        'هذا الدرس يقدم نظرة شاملة حول لغة بايثون، وأسباب انتشارها الكبير، ولماذا أصبحت الخيار الأول للمبتدئين والمحترفين في العديد من المجالات التقنية.',
        ' تعتبر بايثون اليوم واحدة من أكثر اللغات قوة وانتشرًا حول العالم، وتمتاز بسهولة القراءة والكتابة والبساطة في بناء البرامج، مما تجعلها نقطة بداية ممتازة لأي شخص يدخل عالم البرمجة.',
      ],
    ),
    MainSlide(
      slideTitle: 'مقدمة الدرس 2',
      iconName: 'python-icon',
      introdutionTexts: [
        'هذا الدرس يقدم نظرة شاملة حول لغة بايثون، وأسباب انتشارها الكبير، ولماذا أصبحت الخيار الأول للمبتدئين والمحترفين في العديد من المجالات التقنية.',
        ' تعتبر بايثون اليوم واحدة من أكثر اللغات قوة وانتشرًا حول العالم، وتمتاز بسهولة القراءة والكتابة والبساطة في بناء البرامج، مما تجعلها نقطة بداية ممتازة لأي شخص يدخل عالم البرمجة.',
      ],
    ),
    MainSlide(
      slideTitle: 'مقدمة الدرس 3',
      introdutionTexts: [
        'هذا الدرس يقدم نظرة شاملة حول لغة بايثون، وأسباب انتشارها الكبير، ولماذا أصبحت الخيار الأول للمبتدئين والمحترفين في العديد من المجالات التقنية.',
        ' تعتبر بايثون اليوم واحدة من أكثر اللغات قوة وانتشرًا حول العالم، وتمتاز بسهولة القراءة والكتابة والبساطة في بناء البرامج، مما تجعلها نقطة بداية ممتازة لأي شخص يدخل عالم البرمجة.',
      ],
      goldInfo: "يبلغ متوسط الراتب السنوي لمطور بايثون في القاهرة حوالي 195,472 جنيه مصري",
    ),
    QuotationSlide(),
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
  ];

  double get progress => (_currentIndex + 1) / slides.length;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Show confirmation bottom sheet when user tries to exit
  Future<bool> _showExitConfirmation() async {
    final completer = Completer<bool>();
    showCustomBottomSheet(
      context,
      ConfirmationBottomSheet(
        onConfirm: () {
          Navigator.of(context).pop();
          completer.complete(true);
        },
        iconName: "log-out-04",
        titleText: 'هل أنت متأكد أنك تريد الخروج من الدرس؟',
        subTitleText: 'لا تقلق، سيبقى تقدمك محفوظاً إذا قمت بالعودة مرة أخرى لإكمال الدرس',
        buttonText1: "إكمال الدرس",
        buttonText2: "الخروج وعدم الإكمال",
      ),
    );

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final shouldExit = await _showExitConfirmation();
        if (shouldExit && mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: LessonAppBar(
          appbarTitle: "مقدمة إلى لغة بايثون ولماذا نستخدمها",
          slidesNumber: slides.length,
          currentSlide: _currentIndex + 1,
          lessonProgress: progress,
        ),
        body: PageView.builder(
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
        bottomNavigationBar: SafeArea(
          top: false,
          child: Container(
            margin: const EdgeInsets.fromLTRB(
              AppSpacing.spacing2XL,
              AppSpacing.spacingXL,
              AppSpacing.spacing2XL,
              AppSpacing.spacing4XL,
            ),
            child: Row(
              children: [
                _currentIndex == 0
                    ? const SizedBox()
                    : SecondaryButton(
                        text: "الشريحة السابقة",
                        iconName: "icons/arrow-narrow-right",
                        iconColor: context.appColors.borderPrimary,
                        onTap: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                const Spacer(),
                MainButton(
                  text: _currentIndex == slides.length - 1 ? "ابدأ اختبار الدرس" : "الشريحة التالية",
                  iconName: "icons/arrow-narrow-left",
                  bgColor: _currentIndex == slides.length - 1
                      ? context.appColors.utilityWarning500
                      : Colors.transparent,
                  iconColor: _currentIndex == slides.length - 1
                      ? context.appColors.utilityWarning100
                      : context.appColors.buttonPrimaryIcon,
                  isPrefixIcon: false,
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
                            return TestsPage();
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

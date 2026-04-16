import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/custom_bottom_sheet.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/models/get_course_details_by_id_model.dart';
import 'package:badihi/presentation/screens/lesson_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChapterCardDetails extends StatefulWidget {
  final int index;
  final String chapterId;
  final String chapterTitle;
  final List<LessonDetails> chapterLessons;
  final bool isExpandedByDefault;
  const ChapterCardDetails({
    super.key,
    required this.index,
    required this.chapterId,
    required this.chapterTitle,
    required this.chapterLessons,
    this.isExpandedByDefault = false,
  });

  @override
  State<ChapterCardDetails> createState() => _ChapterCardDetailsState();
}

class _ChapterCardDetailsState extends State<ChapterCardDetails> {
  bool _isExpanded = false;
  bool _isCurrentLessonFetched = false;
  int getCurrentLessonIndex() {
    for (int i = 0; i < widget.chapterLessons.length; i++) {
      if (!widget.chapterLessons[i].isCompleted) {
        return i;
      }
    }
    return widget.chapterLessons.length; // all completed
  }

  void toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpandedByDefault;
  }

  @override
  Widget build(BuildContext context) {
    void openChapterLesson() {
      showCustomBottomSheet(
        context,
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.spacingXL),
                decoration: ShapeDecoration(
                  color: context.appColors.bgBrandPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                child: SvgPicture.asset(
                  "assets/images/icons/layers-three-01.svg",
                  width: 40,
                  height: 40,
                  colorFilter: ColorFilter.mode(context.appColors.borderBrand, BlendMode.srcIn),
                ),
              ),
              SizedBox(height: AppSpacing.spacingXL),
              Text(
                'فصل أساسيات بايثون - الدرس الأول',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: context.appColors.textSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
              Text(
                'مقدمة إلى لغة بايثون ولماذا نستخدمها ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: context.appColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                ),
              ),
              SizedBox(height: AppSpacing.spacingXL),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/grid-01.svg",
                          width: 16,
                          height: 16,
                          colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
                        ),
                        SizedBox(width: AppSpacing.spacingXS),
                        Text(
                          'مبتديء',
                          style: TextStyle(
                            color: context.appColors.textSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.43,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: AppSpacing.spacingLG),
                  Container(
                    width: 1,
                    height: 20,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: context.appColors.borderSecondary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppSpacing.spacingLG),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/clock.svg",
                          width: 16,
                          height: 16,
                          colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
                        ),
                        SizedBox(width: AppSpacing.spacingXS),
                        Text(
                          '4 ساعات',
                          style: TextStyle(
                            color: context.appColors.textSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.43,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.spacingXL),
              MainButton(
                onTap: () {
                  Navigator.of(context).pop(); // closes the bottom sheet
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return LessonPage(
                          // Use /slides endpoint
                          // Solve
                          slidesIds: widget.chapterLessons[0].slideIds,
                        );
                      },
                    ),
                  );
                  showCustomBottomSheet(
                    context,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/swipe.gif',
                          width: 72,
                          height: 72,
                          // color: context.appColors.textPrimary,
                        ),
                        SizedBox(height: AppSpacing.spacingXL),
                        Text(
                          'اسحب يمينًا أو يسارًا',
                          style: TextStyle(
                            color:
                                context.appColors.textPrimary /* context.appColors-Text-text-primary-(900) */,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.50,
                          ),
                        ),
                        SizedBox(height: AppSpacing.spacingMD),
                        Text(
                          'للتنقّل بين الشرائح بسهولة',
                          style: TextStyle(
                            color: context
                                .appColors.textSecondary /* context.appColors-Text-text-secondary-(700) */,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                        SizedBox(height: AppSpacing.spacingXL),
                        MainButton(
                            text: "فهمت",
                            onTap: () {
                              Navigator.of(context).pop(); // closes the bottom sheet
                            }),
                        SizedBox(height: AppSpacing.spacing5XL),
                      ],
                    ),
                  );
                },
                text: "ابدأ الدرس",
                btnHorizontalPadding: AppSpacing.spacingXL,
                btnVerticalPadding: 10,
              ),
              SizedBox(height: AppSpacing.spacing5XL),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: toggleExpanded,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chapterId,
                        style: TextStyle(
                          color: context.appColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                      ),
                      Text(
                        widget.chapterTitle,
                        style: TextStyle(
                          color: context.appColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 1.56,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    _isExpanded
                        ? "assets/images/icons/chevron-up.svg"
                        : "assets/images/icons/chevron-down.svg",
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
                  ),
                ],
              ),
            ),
          ),
        ),
        _isExpanded ? SizedBox(height: AppSpacing.spacingXL) : const SizedBox.shrink(),
        // Expandable content
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: _isExpanded
              ? ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.chapterLessons.length,
                  itemBuilder: (context, index) {
                    final currentIndex = getCurrentLessonIndex();
                    final lesson = widget.chapterLessons[index];

                    final isCompleted = lesson.isCompleted;

                    final isCurrent = index == currentIndex;

                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index < widget.chapterLessons.length - 1
                            ? AppSpacing.spacingLG
                            : AppSpacing.spacing3XL,
                      ),
                      child: Material(
                        color: context.appColors.bgPrimary,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: context.appColors.borderSecondary,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            if (isCurrent || isCompleted) {
                              openChapterLesson();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: ShapeDecoration(
                                    color: context.appColors.bgDisabled,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    index < 9 ? '0${index + 1}' : '${index + 1}',
                                    style: TextStyle(
                                      color: context.appColors.textPrimary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(width: AppSpacing.spacingMD),
                                Expanded(
                                  child: Text(
                                    widget.chapterLessons[index].title,
                                    style: TextStyle(
                                      color: context.appColors.textPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                if (isCompleted)
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: ShapeDecoration(
                                      color: context.appColors.fgSuccessPrimary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/images/icons/check.svg",
                                      width: 20,
                                      height: 20,
                                      colorFilter: ColorFilter.mode(
                                        context.appColors.fgWhite,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  )
                                else if (isCurrent)
                                  MainButton(
                                    text: "ابدأ",
                                    onTap: openChapterLesson,
                                    btnHorizontalPadding: AppSpacing.spacingLG,
                                    btnVerticalPadding: 0,
                                  )
                                else
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: ShapeDecoration(
                                      color: widget.chapterLessons[index].isCompleted == true
                                          ? context.appColors.fgSuccessPrimary
                                          : context.appColors.bgSecondary_hover,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      widget.chapterLessons[index].isCompleted == true
                                          ? "assets/images/icons/check.svg"
                                          : "assets/images/icons/lock-01.svg",
                                      width: 20,
                                      height: 20,
                                      colorFilter: ColorFilter.mode(
                                        widget.chapterLessons[index].isCompleted == true
                                            ? context.appColors.fgWhite
                                            : context.appColors.fgQuaternary_hover,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

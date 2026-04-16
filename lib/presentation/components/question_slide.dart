import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/golden_and_insightful_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionSlide extends StatefulWidget {
  final String questionsTitle;
  final List<String> questionsList;
  final String iconName;
  final String insightfulText;

  const QuestionSlide({
    super.key,
    required this.questionsTitle,
    required this.questionsList,
    this.iconName = "",
    this.insightfulText = "",
  });

  @override
  State<QuestionSlide> createState() => _QuestionSlideState();
}

class _QuestionSlideState extends State<QuestionSlide> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return ListView(
      children: [
        Text(
          widget.questionsTitle,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: colors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: 1.33,
          ),
        ),
        SizedBox(height: AppSpacing.spacing3XL),
        widget.iconName != ""
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.spacing6XL),
                decoration: ShapeDecoration(
                  color: context.appColors.bgDisabled /* Colors-Background-bg-disabled */,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/${widget.iconName}.svg",
                    width: 56,
                    height: 56,
                  ),
                ),
              )
            : SizedBox(),
        widget.iconName == "" ? SizedBox() : SizedBox(height: AppSpacing.spacing3XL),
        Column(
          children: List.generate(
            widget.questionsList.length,
            (index) {
              final isSelected = selectedIndex == index;

              return Padding(
                padding: EdgeInsets.only(bottom: AppSpacing.spacing2XL),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: isSelected ? colors.utilitySuccess50 : colors.bgPrimary,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: isSelected ? colors.utilitySuccess500 : colors.borderSecondary,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.questionsList[index],
                            style: TextStyle(
                              color: colors.textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.56,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? colors.utilitySuccess500 : colors.borderPrimary,
                              width: 1,
                            ),
                            color: isSelected ? colors.bgSuccessSolid : Colors.transparent,
                          ),
                          child: isSelected
                              ? SvgPicture.asset(
                                  'assets/images/icons/check.svg',
                                  width: 16,
                                  height: 16,
                                  colorFilter: ColorFilter.mode(
                                    colors.fgWhite,
                                    BlendMode.srcIn,
                                  ),
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        widget.insightfulText != ""
            ? GoldenAndInsightfulInfo(
                infoText: widget.insightfulText,
                isGoldenInfo: false,
              )
            : SizedBox()
      ],
    );
  }
}

import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/golden_and_insightful_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainSlide extends StatelessWidget {
  final String slideTitle;
  final String iconName;
  final List<String> introdutionTexts;
  final String goldInfo;
  const MainSlide({
    super.key,
    required this.slideTitle,
    this.iconName = "",
    required this.introdutionTexts,
    this.goldInfo = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSpacing.spacing5XL),
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppSpacing.spacing2XL,
              vertical: 0,
            ),
            child: Text(
              slideTitle,
              style: TextStyle(
                color: context.appColors.textPrimary /* Colors-Text-text-primary-(900) */,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 1.33,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.spacing3XL),
          iconName != ""
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.spacing6XL),
                  decoration: ShapeDecoration(
                    color: context.appColors.bgDisabled /* Colors-Background-bg-disabled */,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/$iconName.svg",
                      width: 56,
                      height: 56,
                    ),
                  ),
                )
              : SizedBox(),
          iconName == "" ? SizedBox() : SizedBox(height: AppSpacing.spacing3XL),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppSpacing.spacing2XL,
              vertical: 0,
            ),
            child: Column(
              children: introdutionTexts.map((text) {
                return Container(
                  margin: EdgeInsets.only(bottom: AppSpacing.spacing3XL),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: context.appColors.textPrimary /* Colors-Text-text-primary-(900) */,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.56,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          goldInfo != "" ? GoldenAndInsightfulInfo(infoText: goldInfo) : SizedBox()
        ],
      ),
    );
  }
}

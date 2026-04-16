import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/secondary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonResultsPage extends StatelessWidget {
  final int totalQuestions;
  final int correctQuestions;
  const LessonResultsPage({
    super.key,
    required this.totalQuestions,
    required this.correctQuestions,
  });

  @override
  Widget build(BuildContext context) {
    bool success = true;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing4XL,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 192,
                  height: 192,
                  child: CircularProgressIndicator(
                    value: 0.3,
                    strokeWidth: 22,
                    strokeCap: StrokeCap.round,
                    backgroundColor: success
                        ? context.appColors.bgSuccessPrimary
                        : context.appColors.borderError.withValues(alpha: .2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      success ? context.appColors.fgSuccessPrimary : context.appColors.borderError,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '0$totalQuestions/',
                      style: TextStyle(
                        color: success
                            ? context.appColors.fgSuccessPrimary
                            : context
                                .appColors.textErrorPrimaryHover /* Colors-Text-text-error-primary_hover */,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        height: 1.27,
                      ),
                    ),
                    Text(
                      '0$correctQuestions ',
                      style: TextStyle(
                        color: success
                            ? context.appColors.fgSuccessPrimary
                            : context
                                .appColors.textErrorPrimaryHover /* Colors-Text-text-error-primary_hover */,
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        height: 1.17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppSpacing.spacing4XL),
            Text(
              success ? 'أحسنت!' : 'حاول مرة أخرى!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.appColors.textPrimary /* Colors-Text-text-primary-(900) */,
                fontSize: 36,
                fontWeight: FontWeight.w600,
                height: 1.22,
                letterSpacing: -0.72,
              ),
            ),
            SizedBox(height: AppSpacing.spacingLG),
            Text(
              success
                  ? 'أجبت بشكل صحيح على معظم الأسئلة.'
                  : 'بعض الإجابات كانت غير صحيحة. لا تقلق، يمكنك المحاولة مجددًا.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.appColors.textSecondary /* Colors-Text-text-secondary-(700) */,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                height: 1.33,
              ),
            ),
            Spacer(),
            MainButton(
              onTap: () {},
              text: success ? "الدرس التالي" : "إعادة الاختبار",
              isPrefixIcon: false,
              iconName: success ? "icons/arrow-narrow-left" : "icons/repeat-01",
              iconColor: context.appColors.utilityBrand300,
            ),
            SizedBox(height: AppSpacing.spacingLG),
            SecondaryButton(
              onTap: () {},
              text: success ? "العودة إلى تفاصيل الدورة" : "إعادة الدرس",
              iconName: success ? "" : "icons/arrow-narrow-right",
              iconColor: context.appColors.borderPrimary,
            ),
          ],
        ),
      ),
    );
  }
}

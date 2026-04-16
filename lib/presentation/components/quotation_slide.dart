import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';

class QuotationSlide extends StatelessWidget {
  const QuotationSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quotes.png',
          width: 56,
          height: 56,
        ),
        SizedBox(height: AppSpacing.spacing3XL),
        Text(
          textAlign: TextAlign.center,
          '“ واحدة من أهم أسباب انتشار بايثون هو بساطتها. فالقواعد فيها قليلة ولا تحتاج إلى كتابة الكثير من الكود لتحقيق فكرة بسيطة. “',
          style: TextStyle(
            color: context.appColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
        ),
        SizedBox(height: AppSpacing.spacing3XL),
        Text(
          '— ضياء محمد',
          style: TextStyle(
            color: context.appColors.textPrimary /* Colors-Text-text-primary-(900) */,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.56,
          ),
        ),
        Text(
          'مؤسس تطبيق بديهي',
          style: TextStyle(
            color: context.appColors.textSecondary /* Colors-Text-text-secondary-(700) */,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
        )
      ],
    );
  }
}

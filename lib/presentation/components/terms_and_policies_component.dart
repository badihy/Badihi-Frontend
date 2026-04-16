import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/contact_us_by_email.dart';
import 'package:flutter/cupertino.dart';

class TermsAndPoliciesComponent extends StatelessWidget {
  final int index;
  final String title;
  final String subTitle;
  final List<String> desciptionPoints;
  final bool isContact;

  const TermsAndPoliciesComponent({
    super.key,
    required this.index,
    required this.title,
    required this.desciptionPoints,
    this.subTitle = "",
    this.isContact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$index. $title',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: context.appColors.textPrimary /* Colors-Text-text-primary-(900) */,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.56,
          ),
        ),
        SizedBox(height: AppSpacing.spacingMD),
        subTitle != ""
            ? Text(
                subTitle,
                style: TextStyle(
                  color: context.appColors.textSecondary /* Colors-Text-text-secondary-(700) */,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              )
            : SizedBox(),
        // Description points
        subTitle != "" ? SizedBox(height: AppSpacing.spacingMD) : SizedBox(),
        Column(
          children: desciptionPoints.map((point) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.spacingSM),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bullet
                  Container(
                    width: 5,
                    height: 5,
                    margin: const EdgeInsets.only(
                      top: AppSpacing.spacingMD,
                      right: 6,
                    ), // align with first line of text
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.appColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.spacingLG),
                  // Text
                  isContact
                      ? Row(
                          children: [
                            Text(
                              'البريد الإلكتروني: ',
                              style: TextStyle(
                                color: context.appColors.textSecondary /* Colors-Text-text-secondary-(700) */,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                            ContactUsByEmail(
                              btnText: "badihy.edu@gmail.com",
                            ),
                          ],
                        )
                      : Expanded(
                          child: Text(
                            point,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: context.appColors.textSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.50,
                            ),
                          ),
                        ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

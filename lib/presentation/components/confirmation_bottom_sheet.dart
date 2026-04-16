import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final VoidCallback onConfirm;
  final String iconName;
  final String titleText;
  final String subTitleText;
  final String buttonText1;
  final String buttonText2;
  final bool isMainButton;
  final bool isWarning;

  const ConfirmationBottomSheet({
    super.key,
    required this.onConfirm,
    required this.iconName,
    required this.titleText,
    required this.subTitleText,
    required this.buttonText1,
    required this.buttonText2,
    this.isMainButton = true,
    this.isWarning = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: isWarning ? context.appColors.bgErrorPrimary : context.appColors.bgBrandPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          child: SvgPicture.asset(
            'assets/images/icons/$iconName.svg',
            width: 40,
            height: 40,
            colorFilter: ColorFilter.mode(
              isWarning ? context.appColors.borderError : context.appColors.borderBrand,
              BlendMode.srcIn,
            ),
          ),
        ),
        SizedBox(height: AppSpacing.spacingXL),
        Text(
          titleText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: context.appColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.50,
          ),
        ),
        SizedBox(height: AppSpacing.spacingMD),
        Text(
          subTitleText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: context.appColors.textSecondary,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
        ),
        SizedBox(height: AppSpacing.spacingXL),
        Row(
          children: [
            Expanded(
              child: isMainButton
                  ? MainButton(
                      text: buttonText1,
                      btnHorizontalPadding: AppSpacing.spacingXL,
                      btnVerticalPadding: 10,
                      onTap: () => Navigator.pop(context),
                    )
                  : SecondaryButton(
                      text: buttonText1,
                      onTap: () {
                        Navigator.pop(context); // close sheet
                      },
                    ),
            ),
            SizedBox(width: AppSpacing.spacingMD),
            Expanded(
                child: MainButton(
              text: buttonText2,
              bgColor: isWarning ? context.appColors.bgErrorSolid : Colors.transparent,
              btnHorizontalPadding: AppSpacing.spacingXL,
              btnVerticalPadding: 10,
              onTap: () {
                Navigator.pop(context); // close sheet
                onConfirm(); // custom action
              },
            )),
          ],
        ),
        SizedBox(height: AppSpacing.spacing5XL),
      ],
    );
  }
}

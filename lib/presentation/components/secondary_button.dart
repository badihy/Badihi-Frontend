import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final String? iconName;
  final Color iconColor;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.iconName = "",
    this.iconColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: AppSpacing.spacingLG),
          side: BorderSide(
            color: context.appColors.borderPrimary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.radiusMD),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconName != ""
                ? SvgPicture.asset(
                    "assets/images/$iconName.svg",
                    width: 20,
                    colorFilter:
                        iconColor != Colors.transparent ? ColorFilter.mode(iconColor, BlendMode.srcIn) : null,
                  )
                : SizedBox(),
            iconName != "" ? SizedBox(width: 8) : SizedBox(),
            Text(
              text!,
              style: TextStyle(
                color: context.appColors.textSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.50,
              ),
            ),
          ],
        ));
  }
}

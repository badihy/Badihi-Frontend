import 'package:badihy/core/extensions/app_mode_colors_extension.dart';
import 'package:badihy/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final String? svgPath;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.svgPath = "",
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>();
    return OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: AppSpacing.spacingLG),
          side: BorderSide(
            color: colors!.borderPrimary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.radiusMD),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            svgPath != ""
                ? SvgPicture.asset(
                    "$svgPath",
                    width: 20,
                  )
                : SizedBox(),
            svgPath != "" ? SizedBox(width: 8) : SizedBox(),
            Text(
              text!,
              style: TextStyle(
                color: colors.textSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.50,
              ),
            ),
          ],
        ));
  }
}

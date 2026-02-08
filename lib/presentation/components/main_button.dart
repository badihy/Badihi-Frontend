import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final String? iconName;
  final Color iconColor;
  final Color bgColor;
  final bool isLoading;
  final bool isDisabled;
  final bool isPrefixIcon;
  final double btnHorizontalPadding;
  final double btnVerticalPadding;

  const MainButton({
    super.key,
    required this.text,
    required this.onTap,
    this.iconName = "",
    this.iconColor = Colors.transparent,
    this.bgColor = Colors.transparent,
    this.isLoading = false,
    this.isDisabled = false,
    this.isPrefixIcon = true,
    this.btnHorizontalPadding = 18,
    this.btnVerticalPadding = AppSpacing.spacingLG,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading || isDisabled ? () {} : onTap, // prevent double taps
      style: ElevatedButton.styleFrom(
        splashFactory: isDisabled ? NoSplash.splashFactory : null,
        padding: EdgeInsets.symmetric(
          horizontal: btnHorizontalPadding,
          vertical: btnVerticalPadding,
        ),
        backgroundColor: isDisabled
            ? context.appColors.bgDisabled
            : isLoading
                ? context.appColors.bgBrandSolidHover
                : bgColor != Colors.transparent
                    ? bgColor
                    : context.appColors.bgBrandSolid,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.radiusMD)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isPrefixIcon && iconName != ""
              ? SvgPicture.asset(
                  "assets/images/$iconName.svg",
                  width: 20,
                  colorFilter:
                      iconColor != Colors.transparent ? ColorFilter.mode(iconColor, BlendMode.srcIn) : null,
                )
              : SizedBox(),
          isPrefixIcon && iconName != "" ? SizedBox(width: AppSpacing.spacingSM) : SizedBox(),
          // Loader (only when loading)
          if (isLoading) ...[
            // const SizedBox(width: 12),
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2, // thin ring
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.brand500,
                ),
                backgroundColor: AppColors.brand300,
              ),
            ),
          ],
          isLoading ? SizedBox(width: AppSpacing.spacingSM) : SizedBox(),
          Text(
            text!,
            style: TextStyle(
              color: isDisabled ? context.appColors.fgDisabled : context.appColors.textWhite,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          !isPrefixIcon && iconName != "" ? SizedBox(width: AppSpacing.spacingSM) : SizedBox(),
          !isPrefixIcon && iconName != ""
              ? SvgPicture.asset(
                  "assets/images/$iconName.svg",
                  width: 20,
                  colorFilter:
                      iconColor != Colors.transparent ? ColorFilter.mode(iconColor, BlendMode.srcIn) : null,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

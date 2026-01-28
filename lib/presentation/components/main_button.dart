import 'package:badihy/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final String? svgPath;
  final bool isLoading;

  const MainButton({
    super.key,
    required this.text,
    required this.onTap,
    this.svgPath = "",
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onTap, // prevent double taps
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: AppSpacing.spacingLG),
        backgroundColor: isLoading ? AppColors.brand700 : AppColors.brand600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.radiusMD)),
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
          svgPath != "" ? SizedBox(width: AppSpacing.spacingSM) : SizedBox(),
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
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

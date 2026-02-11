import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final bool isBasicBar;
  final bool isHomeBar;
  const CustomAppBar({
    super.key,
    required this.appBarTitle,
    this.isBasicBar = true,
    this.isHomeBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isBasicBar ? true : false,
      backgroundColor: context.appColors.bgPrimary,
      surfaceTintColor: Colors.transparent,
      leading: isBasicBar
          ? IconButton(
              icon: SvgPicture.asset(
                'assets/images/icons/arrow-narrow-right.svg',
                colorFilter: ColorFilter.mode(context.appColors.fgPrimary, BlendMode.srcIn),
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      elevation: 0,
      titleSpacing: isBasicBar ? 0 : AppSpacing.spacing2XL,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            appBarTitle,
            style: TextStyle(
              color: context.appColors.textPrimary /* Colors-Text-text-primary-(900) */,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 1.56,
            ),
          ),
          isHomeBar
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.spacingMD,
                    vertical: AppSpacing.spacingXXS,
                  ),
                  decoration: ShapeDecoration(
                    color: context.appColors.bgPrimary /* Colors-Background-bg-primary */,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: context.appColors.borderPrimary /* Colors-Border-border-primary */,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: ShapeDecoration(
                          color: context.appColors
                              .utilityIndigo600 /* Component-colors-Utility-Indigo-utility-indigo-600 */,
                          shape: OvalBorder(),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'نسخة أولية',
                        style: TextStyle(
                          color: context.appColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.43,
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Divider(
          height: 0,
          thickness: 2, // Adjust thickness of the divider under the home bar
          color: context.appColors.borderSecondary,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSpacing.spacing7XL);
}

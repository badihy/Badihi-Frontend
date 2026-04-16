import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/theme/theme_cubit.dart';
import 'package:badihi/cubit/theme/theme_state.dart';
import 'package:badihi/presentation/components/toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileActionLink extends StatelessWidget {
  final VoidCallback onTap;
  final String iconName;
  final String settingTitle;
  final bool drawDivider;
  final bool isDarkModeButton;
  final bool isContactLink;

  const ProfileActionLink({
    super.key,
    required this.onTap,
    required this.iconName,
    required this.settingTitle,
    this.drawDivider = false,
    this.isDarkModeButton = false,
    this.isContactLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing2XL,
            vertical: 0,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: isDarkModeButton ? null : onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/$iconName.svg',
                    width: 24,
                    height: 24,
                    colorFilter: isContactLink
                        ? null
                        : ColorFilter.mode(
                            context.appColors.fgSecondary,
                            BlendMode.srcIn,
                          ),
                  ),
                  SizedBox(width: AppSpacing.spacingLG),
                  Text(
                    settingTitle,
                    style: TextStyle(
                      color: context.appColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.56,
                    ),
                  ),
                  Spacer(),
                  isDarkModeButton
                      ? BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, state) {
                            final isDark = ThemeCubit.get(context).isDarkMode(context);

                            return ToggleButton(
                              initialValue: isDark,
                              onChanged: (value) {
                                ThemeCubit.get(context).toggleTheme();
                              },
                            );
                          },
                        )
                      : SvgPicture.asset(
                          isContactLink
                              ? 'assets/images/icons/arrow-up-left.svg'
                              : 'assets/images/icons/chevron-left.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            context.appColors.fgSecondary,
                            BlendMode.srcIn,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
        drawDivider ? SizedBox(height: AppSpacing.spacingMD) : SizedBox(),
        drawDivider
            ? Divider(
                color: context.appColors.borderSecondary,
              )
            : SizedBox(),
        SizedBox(height: AppSpacing.spacingMD),
      ],
    );
  }
}

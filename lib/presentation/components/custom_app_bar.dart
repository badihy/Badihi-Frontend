import 'package:badihy/core/extensions/app_mode_colors_extension.dart';
import 'package:badihy/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const CustomAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>();
    return AppBar(
        backgroundColor: colors?.bgPrimary,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            Text(
              appBarTitle,
              style: TextStyle(
                color: colors?.textPrimary /* Colors-Text-text-primary-(900) */,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.56,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: preferredSize,
          child: Divider(
            height: 0,
            thickness: 2, // Adjust thickness of the divider under the home bar
            color: colors!.borderSecondary,
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSpacing.spacing7XL);
}

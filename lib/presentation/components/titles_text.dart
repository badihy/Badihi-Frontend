import 'package:badihy/core/extensions/app_mode_colors_extension.dart';
import 'package:flutter/material.dart';

class TitlesText extends StatelessWidget {
  final String text;
  final String IsL_M_S;
  const TitlesText({super.key, required this.text, required this.IsL_M_S});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>();
    return Text(
      text,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: colors!.textSecondary /* Colors-Text-text-secondary-(700) */,
        fontSize: IsL_M_S == "L"
            ? 18
            : IsL_M_S == "M"
                ? 16
                : 14,
        fontWeight: IsL_M_S == "S" ? FontWeight.w500 : FontWeight.w400,
        height: IsL_M_S == "S" ? 1.43 : 1.56,
      ),
    );
  }
}

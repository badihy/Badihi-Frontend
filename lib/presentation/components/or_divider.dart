import 'package:badihi/core/extensions/app_mode_colors_extension.dart';
import 'package:badihi/presentation/components/titles_text.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>();
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: colors!.borderSecondary,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TitlesText(text: "أو", IsL_M_S: "L"),
        ),
        Expanded(
          child: Divider(
            color: colors.borderSecondary,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

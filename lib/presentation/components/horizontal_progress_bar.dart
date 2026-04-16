import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalProgressBar extends StatelessWidget {
  final double progress;
  const HorizontalProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9999),
            child: LinearProgressIndicator(
              minHeight: 8,
              backgroundColor: context.appColors.bgQuaternary,
              color: context.appColors.fgBrandPrimary,
              value: progress,
            ),
          ),
        ),
        SizedBox(width: AppSpacing.spacingMD),
        Text(
          '${(progress * 100).toInt()}%',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: context.appColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.43,
          ),
        )
      ],
    );
  }
}

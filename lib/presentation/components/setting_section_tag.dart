import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';

class SettingSectionTag extends StatelessWidget {
  final String sectionTitle;
  const SettingSectionTag({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing2XL,
        vertical: 0,
      ),
      child: Text(
        sectionTitle,
        style: TextStyle(
          color: context.appColors.textSecondary /* Colors-Text-text-secondary-(700) */,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.50,
        ),
      ),
    );
  }
}

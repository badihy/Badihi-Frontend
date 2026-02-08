import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.appColors.borderSecondary,
            thickness: 1,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'أو',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: context.appColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            )),
        Expanded(
          child: Divider(
            color: context.appColors.borderSecondary,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

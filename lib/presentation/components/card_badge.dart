import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardBadge extends StatelessWidget {
  final String badgeText;
  final bool isBusiness;
  const CardBadge({
    super.key,
    required this.badgeText,
    this.isBusiness = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: ShapeDecoration(
        color: isBusiness ? context.appColors.utilityBlueLight50 : context.appColors.utilitySuccess50,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: isBusiness ? context.appColors.utilityBlueLight200 : context.appColors.utilitySuccess200,
          ),
          borderRadius: BorderRadius.circular(9999),
        ),
      ),
      child: Text(
        isBusiness ? "أعمال" : badgeText,
        style: TextStyle(
          color: isBusiness ? context.appColors.utilityBlueLight700 : context.appColors.utilitySuccess700,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.43,
        ),
      ),
    );
  }
}

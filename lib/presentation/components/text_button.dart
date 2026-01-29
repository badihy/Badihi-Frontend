import 'package:badihi/core/extensions/app_mode_colors_extension.dart';
import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  final String? btnText;
  final VoidCallback? onTap;
  final bool isLight;

  const TextBtn({
    super.key,
    required this.btnText,
    required this.onTap,
    this.isLight = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>();
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // إزالة padding الافتراضي
        minimumSize: Size.zero, // إزالة الحجم الأدنى
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // تصغير مساحة اللمس
      ),
      child: Text(
        btnText!,
        style: TextStyle(
          color: colors!.textBrandSecondary,
          fontSize: isLight ? 14 : 16,
          fontWeight: isLight ? FontWeight.w400 : FontWeight.w600,
          height: 1.50,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

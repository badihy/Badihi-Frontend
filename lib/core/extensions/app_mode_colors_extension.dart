import 'package:flutter/material.dart';

@immutable
class AppModeColorsExtension extends ThemeExtension<AppModeColorsExtension> {
  /* ───────────────────── Text ───────────────────── */
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textQuaternary;
  final Color textDisabled;
  final Color textWhite;
  final Color textPlaceholder;
  final Color textPlaceholderSubtle;

  final Color textBrandPrimary;
  final Color textBrandSecondary;
  final Color textBrandTertiary;
  final Color textBrandTertiaryAlt;

  final Color textErrorPrimary;
  final Color textErrorHover;
  final Color textWarningPrimary;
  final Color textSuccessPrimary;

  /* ───────────────────── Border ───────────────────── */
  final Color borderPrimary;
  final Color borderSecondary;
  final Color borderTertiary;
  final Color borderDisabled;
  final Color borderDisabledSubtle;
  final Color borderBrand;
  final Color borderBrandAlt;
  final Color borderError;
  final Color borderErrorSubtle;
  final Color borderSecondaryAlt;

  /* ───────────────────── Background ───────────────────── */
  final Color bgPrimary;
  final Color bgSecondary;
  final Color bgTertiary;
  final Color bgQuaternary;

  final Color bgBrandPrimary;
  final Color bgBrandSecondary;
  final Color bgBrandSolid;
  final Color bgBrandSolidHover;

  final Color bgErrorPrimary;
  final Color bgErrorSecondary;
  final Color bgErrorSolid;
  final Color bgErrorSolidHover;

  final Color bgWarningPrimary;
  final Color bgWarningSecondary;
  final Color bgWarningSolid;

  final Color bgSuccessPrimary;
  final Color bgSuccessSecondary;
  final Color bgSuccessSolid;

  final Color bgDisabled;
  final Color bgDisabledSubtle;
  final Color bgOverlay;

  /* ───────────────────── Foreground ───────────────────── */
  final Color fgPrimary;
  final Color fgSecondary;
  final Color fgTertiary;
  final Color fgQuaternary;
  final Color fgDisabled;
  final Color fgWhite;

  final Color fgBrandPrimary;
  final Color fgBrandSecondary;

  final Color fgErrorPrimary;
  final Color fgErrorSecondary;
  final Color fgWarningPrimary;
  final Color fgWarningSecondary;
  final Color fgSuccessPrimary;
  final Color fgSuccessSecondary;

  /* ───────────────────── Effects / Focus ───────────────────── */
  final Color focusRing;
  final Color focusRingError;

  /* ───────────────────── Alpha ───────────────────── */
  final Color alphaWhite90;
  final Color alphaWhite80;
  final Color alphaWhite70;
  final Color alphaWhite60;
  final Color alphaWhite50;
  final Color alphaWhite40;
  final Color alphaWhite30;
  final Color alphaWhite20;
  final Color alphaWhite10;

  final Color alphaBlack10;
  final Color alphaBlack20;
  final Color alphaBlack30;
  final Color alphaBlack40;
  final Color alphaBlack50;
  final Color alphaBlack60;
  final Color alphaBlack70;
  final Color alphaBlack80;
  final Color alphaBlack90;
  final Color alphaBlack100;

  const AppModeColorsExtension({
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textQuaternary,
    required this.textDisabled,
    required this.textWhite,
    required this.textPlaceholder,
    required this.textPlaceholderSubtle,
    required this.textBrandPrimary,
    required this.textBrandSecondary,
    required this.textBrandTertiary,
    required this.textBrandTertiaryAlt,
    required this.textErrorPrimary,
    required this.textErrorHover,
    required this.textWarningPrimary,
    required this.textSuccessPrimary,
    required this.borderPrimary,
    required this.borderSecondary,
    required this.borderTertiary,
    required this.borderDisabled,
    required this.borderDisabledSubtle,
    required this.borderBrand,
    required this.borderBrandAlt,
    required this.borderError,
    required this.borderErrorSubtle,
    required this.borderSecondaryAlt,
    required this.bgPrimary,
    required this.bgSecondary,
    required this.bgTertiary,
    required this.bgQuaternary,
    required this.bgBrandPrimary,
    required this.bgBrandSecondary,
    required this.bgBrandSolid,
    required this.bgBrandSolidHover,
    required this.bgErrorPrimary,
    required this.bgErrorSecondary,
    required this.bgErrorSolid,
    required this.bgErrorSolidHover,
    required this.bgWarningPrimary,
    required this.bgWarningSecondary,
    required this.bgWarningSolid,
    required this.bgSuccessPrimary,
    required this.bgSuccessSecondary,
    required this.bgSuccessSolid,
    required this.bgDisabled,
    required this.bgDisabledSubtle,
    required this.bgOverlay,
    required this.fgPrimary,
    required this.fgSecondary,
    required this.fgTertiary,
    required this.fgQuaternary,
    required this.fgDisabled,
    required this.fgWhite,
    required this.fgBrandPrimary,
    required this.fgBrandSecondary,
    required this.fgErrorPrimary,
    required this.fgErrorSecondary,
    required this.fgWarningPrimary,
    required this.fgWarningSecondary,
    required this.fgSuccessPrimary,
    required this.fgSuccessSecondary,
    required this.focusRing,
    required this.focusRingError,
    required this.alphaWhite90,
    required this.alphaWhite80,
    required this.alphaWhite70,
    required this.alphaWhite60,
    required this.alphaWhite50,
    required this.alphaWhite40,
    required this.alphaWhite30,
    required this.alphaWhite20,
    required this.alphaWhite10,
    required this.alphaBlack10,
    required this.alphaBlack20,
    required this.alphaBlack30,
    required this.alphaBlack40,
    required this.alphaBlack50,
    required this.alphaBlack60,
    required this.alphaBlack70,
    required this.alphaBlack80,
    required this.alphaBlack90,
    required this.alphaBlack100,
  });

  @override
  AppModeColorsExtension copyWith() => this;

  @override
  AppModeColorsExtension lerp(ThemeExtension<AppModeColorsExtension>? other, double t) => this;
}

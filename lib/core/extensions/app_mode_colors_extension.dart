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

  // Add these missing text colors
  final Color textSecondaryHover;
  final Color textTertiaryHover;
  final Color textPrimaryOnBrand;
  final Color textSecondaryOnBrand;
  final Color textTertiaryOnBrand;
  final Color textQuaternaryOnBrand;
  final Color textBrandSecondaryHover;
  final Color textErrorPrimaryHover;

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
  final Color bgSecondary_hover;
  final Color bgTertiary;
  final Color bgActive;
  final Color bgQuaternary;

  final Color bgBrandPrimary;
  final Color bgBrandPrimaryAlt;
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

  // Add these missing background colors
  final Color bgSecondarySolid;
  final Color bgPrimaryHover;
  final Color bgPrimaryAlt;
  final Color bgSecondaryAlt;
  final Color bgSecondarySubtle;
  final Color bgBrandSection;
  final Color bgBrandSectionSubtle;
  final Color bgPrimarySolid;

  /* ───────────────────── Foreground ───────────────────── */
  final Color fgPrimary;
  final Color fgSecondary;
  final Color fgTertiary;
  final Color fgQuaternary;
  final Color fgQuaternary_hover;
  final Color fgDisabled;
  final Color fgDisabledSubtle;
  final Color fgWhite;

  final Color fgBrandPrimary;
  final Color fgBrandSecondary;

  final Color fgErrorPrimary;
  final Color fgErrorSecondary;
  final Color fgWarningPrimary;
  final Color fgWarningSecondary;
  final Color fgSuccessPrimary;
  final Color fgSuccessSecondary;

  // Add these missing foreground colors
  final Color fgBrandSecondaryAlt;
  final Color fgBrandSecondaryHover;
  final Color fgBrandPrimaryAlt;
  final Color fgSecondaryHover;
  final Color fgTertiaryHover;

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

  // Add these missing alpha colors
  final Color alphaWhite100;

  /* ───────────────────── Shadow Colors ───────────────────── */
  final Color shadowXs;
  final Color shadowSm01;
  final Color shadowSm02;
  final Color shadowMd01;
  final Color shadowMd02;
  final Color shadowLg01;
  final Color shadowLg02;
  final Color shadowLg03;
  final Color shadowXl01;
  final Color shadowXl02;
  final Color shadowXl03;
  final Color shadow2xl01;
  final Color shadow2xl02;
  final Color shadow3xl01;
  final Color shadow3xl02;
  final Color shadowSkeumorphicInner;
  final Color shadowSkeumorphicInnerBorder;
  final Color shadowMainCentreMd;
  final Color shadowMainCentreLg;
  final Color shadowOverlayLg;
  final Color shadowGridMd;

  /* ───────────────────── Utility Colors ───────────────────── */

  // Blue
  final Color utilityBlue50;
  final Color utilityBlue100;
  final Color utilityBlue200;
  final Color utilityBlue300;
  final Color utilityBlue400;
  final Color utilityBlue500;
  final Color utilityBlue600;
  final Color utilityBlue700;

  // Brand
  final Color utilityBrand50;
  final Color utilityBrand100;
  final Color utilityBrand200;
  final Color utilityBrand300;
  final Color utilityBrand400;
  final Color utilityBrand500;
  final Color utilityBrand600;
  final Color utilityBrand700;
  final Color utilityBrand800;
  final Color utilityBrand900;
  final Color utilityBrand50Alt;
  final Color utilityBrand100Alt;
  final Color utilityBrand200Alt;
  final Color utilityBrand300Alt;
  final Color utilityBrand400Alt;
  final Color utilityBrand500Alt;
  final Color utilityBrand600Alt;
  final Color utilityBrand700Alt;
  final Color utilityBrand800Alt;
  final Color utilityBrand900Alt;

  // Gray
  final Color utilityGray50;
  final Color utilityGray100;
  final Color utilityGray200;
  final Color utilityGray300;
  final Color utilityGray400;
  final Color utilityGray500;
  final Color utilityGray600;
  final Color utilityGray700;
  final Color utilityGray800;
  final Color utilityGray900;

  // Error
  final Color utilityError50;
  final Color utilityError100;
  final Color utilityError200;
  final Color utilityError300;
  final Color utilityError400;
  final Color utilityError500;
  final Color utilityError600;
  final Color utilityError700;

  // Warning
  final Color utilityWarning50;
  final Color utilityWarning100;
  final Color utilityWarning200;
  final Color utilityWarning300;
  final Color utilityWarning400;
  final Color utilityWarning500;
  final Color utilityWarning600;
  final Color utilityWarning700;

  // Success
  final Color utilitySuccess50;
  final Color utilitySuccess100;
  final Color utilitySuccess200;
  final Color utilitySuccess300;
  final Color utilitySuccess400;
  final Color utilitySuccess500;
  final Color utilitySuccess600;
  final Color utilitySuccess700;

  // Orange
  final Color utilityOrange50;
  final Color utilityOrange100;
  final Color utilityOrange200;
  final Color utilityOrange300;
  final Color utilityOrange400;
  final Color utilityOrange500;
  final Color utilityOrange600;
  final Color utilityOrange700;

  // Blue Dark
  final Color utilityBlueDark50;
  final Color utilityBlueDark100;
  final Color utilityBlueDark200;
  final Color utilityBlueDark300;
  final Color utilityBlueDark400;
  final Color utilityBlueDark500;
  final Color utilityBlueDark600;
  final Color utilityBlueDark700;

  // Indigo
  final Color utilityIndigo50;
  final Color utilityIndigo100;
  final Color utilityIndigo200;
  final Color utilityIndigo300;
  final Color utilityIndigo400;
  final Color utilityIndigo500;
  final Color utilityIndigo600;
  final Color utilityIndigo700;

  // Fuchsia
  final Color utilityFuchsia50;
  final Color utilityFuchsia100;
  final Color utilityFuchsia200;
  final Color utilityFuchsia300;
  final Color utilityFuchsia400;
  final Color utilityFuchsia500;
  final Color utilityFuchsia600;
  final Color utilityFuchsia700;

  // Pink
  final Color utilityPink50;
  final Color utilityPink100;
  final Color utilityPink200;
  final Color utilityPink300;
  final Color utilityPink400;
  final Color utilityPink500;
  final Color utilityPink600;
  final Color utilityPink700;

  // Purple
  final Color utilityPurple50;
  final Color utilityPurple100;
  final Color utilityPurple200;
  final Color utilityPurple300;
  final Color utilityPurple400;
  final Color utilityPurple500;
  final Color utilityPurple600;
  final Color utilityPurple700;

  // Orange Dark
  final Color utilityOrangeDark50;
  final Color utilityOrangeDark100;
  final Color utilityOrangeDark200;
  final Color utilityOrangeDark300;
  final Color utilityOrangeDark400;
  final Color utilityOrangeDark500;
  final Color utilityOrangeDark600;
  final Color utilityOrangeDark700;

  // Blue Light
  final Color utilityBlueLight50;
  final Color utilityBlueLight100;
  final Color utilityBlueLight200;
  final Color utilityBlueLight300;
  final Color utilityBlueLight400;
  final Color utilityBlueLight500;
  final Color utilityBlueLight600;
  final Color utilityBlueLight700;

  // Gray Blue
  final Color utilityGrayBlue50;
  final Color utilityGrayBlue100;
  final Color utilityGrayBlue200;
  final Color utilityGrayBlue300;
  final Color utilityGrayBlue400;
  final Color utilityGrayBlue500;
  final Color utilityGrayBlue600;
  final Color utilityGrayBlue700;

  // Green
  final Color utilityGreen50;
  final Color utilityGreen100;
  final Color utilityGreen200;
  final Color utilityGreen300;
  final Color utilityGreen400;
  final Color utilityGreen500;
  final Color utilityGreen600;
  final Color utilityGreen700;

  // Yellow
  final Color utilityYellow50;
  final Color utilityYellow100;
  final Color utilityYellow200;
  final Color utilityYellow300;
  final Color utilityYellow400;
  final Color utilityYellow500;
  final Color utilityYellow600;
  final Color utilityYellow700;

  /* ───────────────────── Component Colors ───────────────────── */
  final Color tooltipSupportingText;
  final Color textEditorIconFg;
  final Color textEditorIconFgActive;
  final Color featuredIconLightFgBrand;
  final Color featuredIconLightFgGray;
  final Color featuredIconLightFgError;
  final Color featuredIconLightFgWarning;
  final Color featuredIconLightFgSuccess;
  final Color iconFgBrand;
  final Color iconFgBrandOnBrand;
  final Color sliderHandleBorder;
  final Color sliderHandleBg;
  final Color screenMockupBorder;
  final Color footerButtonFg;
  final Color footerButtonFgHover;
  final Color appStoreBadgeBorder;
  final Color toggleButtonFgDisabled;
  final Color toggleBorder;
  final Color toggleSlimBorderPressed;
  final Color toggleSlimBorderPressedHover;
  final Color avatarStylesBgNeutral;
  final Color buttonPrimaryIcon;
  final Color buttonPrimaryIconHover;
  final Color buttonDestructivePrimaryIcon;
  final Color buttonDestructivePrimaryIconHover;

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
    // Add these missing text parameters
    required this.textSecondaryHover,
    required this.textTertiaryHover,
    required this.textPrimaryOnBrand,
    required this.textSecondaryOnBrand,
    required this.textTertiaryOnBrand,
    required this.textQuaternaryOnBrand,
    required this.textBrandSecondaryHover,
    required this.textErrorPrimaryHover,
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
    // Add this missing border parameter
    required this.bgPrimary,
    required this.bgSecondary,
    required this.bgSecondary_hover,
    required this.bgTertiary,
    required this.bgActive,
    required this.bgQuaternary,
    required this.bgBrandPrimary,
    required this.bgBrandPrimaryAlt,
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
    // Add these missing background parameters
    required this.bgSecondarySolid,
    required this.bgPrimaryHover,
    required this.bgPrimaryAlt,
    required this.bgSecondaryAlt,
    required this.bgSecondarySubtle,
    required this.bgBrandSection,
    required this.bgBrandSectionSubtle,
    required this.bgPrimarySolid,
    required this.fgPrimary,
    required this.fgSecondary,
    required this.fgTertiary,
    required this.fgQuaternary,
    required this.fgQuaternary_hover,
    required this.fgDisabled,
    required this.fgDisabledSubtle,
    required this.fgWhite,
    required this.fgBrandPrimary,
    required this.fgBrandSecondary,
    required this.fgErrorPrimary,
    required this.fgErrorSecondary,
    required this.fgWarningPrimary,
    required this.fgWarningSecondary,
    required this.fgSuccessPrimary,
    required this.fgSuccessSecondary,
    // Add these missing foreground parameters
    required this.fgBrandSecondaryAlt,
    required this.fgBrandSecondaryHover,
    required this.fgBrandPrimaryAlt,
    required this.fgSecondaryHover,
    required this.fgTertiaryHover,
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
    // Add these missing alpha parameters
    required this.alphaWhite100,

    // Shadow parameters
    required this.shadowXs,
    required this.shadowSm01,
    required this.shadowSm02,
    required this.shadowMd01,
    required this.shadowMd02,
    required this.shadowLg01,
    required this.shadowLg02,
    required this.shadowLg03,
    required this.shadowXl01,
    required this.shadowXl02,
    required this.shadowXl03,
    required this.shadow2xl01,
    required this.shadow2xl02,
    required this.shadow3xl01,
    required this.shadow3xl02,
    required this.shadowSkeumorphicInner,
    required this.shadowSkeumorphicInnerBorder,
    required this.shadowMainCentreMd,
    required this.shadowMainCentreLg,
    required this.shadowOverlayLg,
    required this.shadowGridMd,

    // Utility Colors
    required this.utilityBlue50,
    required this.utilityBlue100,
    required this.utilityBlue200,
    required this.utilityBlue300,
    required this.utilityBlue400,
    required this.utilityBlue500,
    required this.utilityBlue600,
    required this.utilityBlue700,
    required this.utilityBrand50,
    required this.utilityBrand100,
    required this.utilityBrand200,
    required this.utilityBrand300,
    required this.utilityBrand400,
    required this.utilityBrand500,
    required this.utilityBrand600,
    required this.utilityBrand700,
    required this.utilityBrand800,
    required this.utilityBrand900,
    required this.utilityBrand50Alt,
    required this.utilityBrand100Alt,
    required this.utilityBrand200Alt,
    required this.utilityBrand300Alt,
    required this.utilityBrand400Alt,
    required this.utilityBrand500Alt,
    required this.utilityBrand600Alt,
    required this.utilityBrand700Alt,
    required this.utilityBrand800Alt,
    required this.utilityBrand900Alt,
    required this.utilityGray50,
    required this.utilityGray100,
    required this.utilityGray200,
    required this.utilityGray300,
    required this.utilityGray400,
    required this.utilityGray500,
    required this.utilityGray600,
    required this.utilityGray700,
    required this.utilityGray800,
    required this.utilityGray900,
    required this.utilityError50,
    required this.utilityError100,
    required this.utilityError200,
    required this.utilityError300,
    required this.utilityError400,
    required this.utilityError500,
    required this.utilityError600,
    required this.utilityError700,
    required this.utilityWarning50,
    required this.utilityWarning100,
    required this.utilityWarning200,
    required this.utilityWarning300,
    required this.utilityWarning400,
    required this.utilityWarning500,
    required this.utilityWarning600,
    required this.utilityWarning700,
    required this.utilitySuccess50,
    required this.utilitySuccess100,
    required this.utilitySuccess200,
    required this.utilitySuccess300,
    required this.utilitySuccess400,
    required this.utilitySuccess500,
    required this.utilitySuccess600,
    required this.utilitySuccess700,
    required this.utilityOrange50,
    required this.utilityOrange100,
    required this.utilityOrange200,
    required this.utilityOrange300,
    required this.utilityOrange400,
    required this.utilityOrange500,
    required this.utilityOrange600,
    required this.utilityOrange700,
    required this.utilityBlueDark50,
    required this.utilityBlueDark100,
    required this.utilityBlueDark200,
    required this.utilityBlueDark300,
    required this.utilityBlueDark400,
    required this.utilityBlueDark500,
    required this.utilityBlueDark600,
    required this.utilityBlueDark700,
    required this.utilityIndigo50,
    required this.utilityIndigo100,
    required this.utilityIndigo200,
    required this.utilityIndigo300,
    required this.utilityIndigo400,
    required this.utilityIndigo500,
    required this.utilityIndigo600,
    required this.utilityIndigo700,
    required this.utilityFuchsia50,
    required this.utilityFuchsia100,
    required this.utilityFuchsia200,
    required this.utilityFuchsia300,
    required this.utilityFuchsia400,
    required this.utilityFuchsia500,
    required this.utilityFuchsia600,
    required this.utilityFuchsia700,
    required this.utilityPink50,
    required this.utilityPink100,
    required this.utilityPink200,
    required this.utilityPink300,
    required this.utilityPink400,
    required this.utilityPink500,
    required this.utilityPink600,
    required this.utilityPink700,
    required this.utilityPurple50,
    required this.utilityPurple100,
    required this.utilityPurple200,
    required this.utilityPurple300,
    required this.utilityPurple400,
    required this.utilityPurple500,
    required this.utilityPurple600,
    required this.utilityPurple700,
    required this.utilityOrangeDark50,
    required this.utilityOrangeDark100,
    required this.utilityOrangeDark200,
    required this.utilityOrangeDark300,
    required this.utilityOrangeDark400,
    required this.utilityOrangeDark500,
    required this.utilityOrangeDark600,
    required this.utilityOrangeDark700,
    required this.utilityBlueLight50,
    required this.utilityBlueLight100,
    required this.utilityBlueLight200,
    required this.utilityBlueLight300,
    required this.utilityBlueLight400,
    required this.utilityBlueLight500,
    required this.utilityBlueLight600,
    required this.utilityBlueLight700,
    required this.utilityGrayBlue50,
    required this.utilityGrayBlue100,
    required this.utilityGrayBlue200,
    required this.utilityGrayBlue300,
    required this.utilityGrayBlue400,
    required this.utilityGrayBlue500,
    required this.utilityGrayBlue600,
    required this.utilityGrayBlue700,
    required this.utilityGreen50,
    required this.utilityGreen100,
    required this.utilityGreen200,
    required this.utilityGreen300,
    required this.utilityGreen400,
    required this.utilityGreen500,
    required this.utilityGreen600,
    required this.utilityGreen700,
    required this.utilityYellow50,
    required this.utilityYellow100,
    required this.utilityYellow200,
    required this.utilityYellow300,
    required this.utilityYellow400,
    required this.utilityYellow500,
    required this.utilityYellow600,
    required this.utilityYellow700,

    // Component Colors parameters
    required this.tooltipSupportingText,
    required this.textEditorIconFg,
    required this.textEditorIconFgActive,
    required this.featuredIconLightFgBrand,
    required this.featuredIconLightFgGray,
    required this.featuredIconLightFgError,
    required this.featuredIconLightFgWarning,
    required this.featuredIconLightFgSuccess,
    required this.iconFgBrand,
    required this.iconFgBrandOnBrand,
    required this.sliderHandleBorder,
    required this.sliderHandleBg,
    required this.screenMockupBorder,
    required this.footerButtonFg,
    required this.footerButtonFgHover,
    required this.appStoreBadgeBorder,
    required this.toggleButtonFgDisabled,
    required this.toggleBorder,
    required this.toggleSlimBorderPressed,
    required this.toggleSlimBorderPressedHover,
    required this.avatarStylesBgNeutral,
    required this.buttonPrimaryIcon,
    required this.buttonPrimaryIconHover,
    required this.buttonDestructivePrimaryIcon,
    required this.buttonDestructivePrimaryIconHover,
  });

  @override
  AppModeColorsExtension copyWith() => this;

  @override
  AppModeColorsExtension lerp(ThemeExtension<AppModeColorsExtension>? other, double t) => this;
}

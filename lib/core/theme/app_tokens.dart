import 'package:badihy/core/extensions/app_mode_colors_extension.dart';
import 'package:flutter/material.dart';

class AppColors {
// Base Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00FFFFFF);

// Gray (light mode)
  static const Color gray25 = Color(0xFFFDFDFD);
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFE9EAEB);
  static const Color gray300 = Color(0xFFD5D7DA);
  static const Color gray400 = Color(0xFFA4A7AE);
  static const Color gray500 = Color(0xFF717680);
  static const Color gray600 = Color(0xFF535862);
  static const Color gray700 = Color(0xFF414651);
  static const Color gray800 = Color(0xFF252B37);
  static const Color gray900 = Color(0xFF181D27);
  static const Color gray950 = Color(0xFF0A0D12);

// Gray blue
  static const Color grayBlue25 = Color(0xFFFCFCFD);
  static const Color grayBlue50 = Color(0xFFF8F9FC);
  static const Color grayBlue100 = Color(0xFFEAECF5);
  static const Color grayBlue200 = Color(0xFFD5D9EB);
  static const Color grayBlue300 = Color(0xFFB3B8DB);
  static const Color grayBlue400 = Color(0xFF717BBC);
  static const Color grayBlue500 = Color(0xFF4E5BA6);
  static const Color grayBlue600 = Color(0xFF3E4784);
  static const Color grayBlue700 = Color(0xFF363F72);
  static const Color grayBlue800 = Color(0xFF293056);
  static const Color grayBlue900 = Color(0xFF101323);
  static const Color grayBlue950 = Color(0xFF0D0F1C);

// Gray cool
  static const Color grayCool25 = Color(0xFFFCFCFD);
  static const Color grayCool50 = Color(0xFFF9F9FB);
  static const Color grayCool100 = Color(0xFFEFF1F5);
  static const Color grayCool200 = Color(0xFFDCDFEA);
  static const Color grayCool300 = Color(0xFFB9C0D4);
  static const Color grayCool400 = Color(0xFF7D89B0);
  static const Color grayCool500 = Color(0xFF5D6B98);
  static const Color grayCool600 = Color(0xFF4A5578);
  static const Color grayCool700 = Color(0xFF404968);
  static const Color grayCool800 = Color(0xFF30374F);
  static const Color grayCool900 = Color(0xFF111322);
  static const Color grayCool950 = Color(0xFF0E101B);

// Gray modern
  static const Color grayModern25 = Color(0xFFFCFCFD);
  static const Color grayModern50 = Color(0xFFF8FAFC);
  static const Color grayModern100 = Color(0xFFEEF2F6);
  static const Color grayModern200 = Color(0xFFE3E8EF);
  static const Color grayModern300 = Color(0xFFCDD5DF);
  static const Color grayModern400 = Color(0xFF9AA4B2);
  static const Color grayModern500 = Color(0xFF697586);
  static const Color grayModern600 = Color(0xFF4B5565);
  static const Color grayModern700 = Color(0xFF364152);
  static const Color grayModern800 = Color(0xFF202939);
  static const Color grayModern900 = Color(0xFF121926);
  static const Color grayModern950 = Color(0xFF0D121C);

// Gray neutral
  static const Color grayNeutral25 = Color(0xFFFCFCFD);
  static const Color grayNeutral50 = Color(0xFFF9FAFB);
  static const Color grayNeutral100 = Color(0xFFF3F4F6);
  static const Color grayNeutral200 = Color(0xFFE5E7EB);
  static const Color grayNeutral300 = Color(0xFFD2D6DB);
  static const Color grayNeutral400 = Color(0xFF9DA4AE);
  static const Color grayNeutral500 = Color(0xFF6C737F);
  static const Color grayNeutral600 = Color(0xFF4D5761);
  static const Color grayNeutral700 = Color(0xFF384250);
  static const Color grayNeutral800 = Color(0xFF1F2A37);
  static const Color grayNeutral900 = Color(0xFF111927);
  static const Color grayNeutral950 = Color(0xFF0D121C);

// Brand
  static const Color brand25 = Color(0xFFF6F2FA);
  static const Color brand50 = Color(0xFFECE3F5);
  static const Color brand100 = Color(0xFFDAC9EB);
  static const Color brand200 = Color(0xFFC1A3DD);
  static const Color brand300 = Color(0xFFA77DCF);
  static const Color brand400 = Color(0xFF8E57C1);
  static const Color brand500 = Color(0xFF6F3AB1);
  static const Color brand600 = Color(0xFF5F2F9D);
  static const Color brand700 = Color(0xFF4F2489);
  static const Color brand800 = Color(0xFF3F1C6F);
  static const Color brand900 = Color(0xFF2D1450);
  static const Color brand950 = Color(0xFF1C0C33);

// Error
  static const Color error25 = Color(0xFFFFFBFA);
  static const Color error50 = Color(0xFFFEF3F2);
  static const Color error100 = Color(0xFFFEE4E2);
  static const Color error200 = Color(0xFFFECDCA);
  static const Color error300 = Color(0xFFFDA29B);
  static const Color error400 = Color(0xFFF97066);
  static const Color error500 = Color(0xFFF04438);
  static const Color error600 = Color(0xFFD92D20);
  static const Color error700 = Color(0xFFB42318);
  static const Color error800 = Color(0xFF912018);
  static const Color error900 = Color(0xFF7A271A);
  static const Color error950 = Color(0xFF55160C);

// Warning
  static const Color warning25 = Color(0xFFFFFCF5);
  static const Color warning50 = Color(0xFFFFFAEB);
  static const Color warning100 = Color(0xFFFEF0C7);
  static const Color warning200 = Color(0xFFFEDF89);
  static const Color warning300 = Color(0xFFFEC84B);
  static const Color warning400 = Color(0xFFFDB022);
  static const Color warning500 = Color(0xFFF79009);
  static const Color warning600 = Color(0xFFDC6803);
  static const Color warning700 = Color(0xFFB54708);
  static const Color warning800 = Color(0xFF93370D);
  static const Color warning900 = Color(0xFF7A2E0E);
  static const Color warning950 = Color(0xFF4E1D09);

// Success
  static const Color success25 = Color(0xFFF6FEF9);
  static const Color success50 = Color(0xFFECFDF3);
  static const Color success100 = Color(0xFFDCFAE6);
  static const Color success200 = Color(0xFFABEFC6);
  static const Color success300 = Color(0xFF75E0A7);
  static const Color success400 = Color(0xFF47CD89);
  static const Color success500 = Color(0xFF17B26A);
  static const Color success600 = Color(0xFF079455);
  static const Color success700 = Color(0xFF067647);
  static const Color success800 = Color(0xFF085D3A);
  static const Color success900 = Color(0xFF074D31);
  static const Color success950 = Color(0xFF053321);

// Green
  static const Color green25 = Color(0xFFF6FEF9);
  static const Color green50 = Color(0xFFEDFCF2);
  static const Color green100 = Color(0xFFD3F8DF);
  static const Color green200 = Color(0xFFAAF0C4);
  static const Color green300 = Color(0xFF73E2A3);
  static const Color green400 = Color(0xFF3CCB7F);
  static const Color green500 = Color(0xFF16B364);
  static const Color green600 = Color(0xFF099250);
  static const Color green700 = Color(0xFF087443);
  static const Color green800 = Color(0xFF095C37);
  static const Color green900 = Color(0xFF084C2E);
  static const Color green950 = Color(0xFF052E1C);

// Gray iron
  static const Color grayIron25 = Color(0xFFFCFCFC);
  static const Color grayIron50 = Color(0xFFFAFAFA);
  static const Color grayIron100 = Color(0xFFF4F4F5);
  static const Color grayIron200 = Color(0xFFE4E4E7);
  static const Color grayIron300 = Color(0xFFD1D1D6);
  static const Color grayIron400 = Color(0xFFA0A0AB);
  static const Color grayIron500 = Color(0xFF70707B);
  static const Color grayIron600 = Color(0xFF51525C);
  static const Color grayIron700 = Color(0xFF3F3F46);
  static const Color grayIron800 = Color(0xFF26272B);
  static const Color grayIron900 = Color(0xFF1A1A1E);
  static const Color grayIron950 = Color(0xFF131316);

// Gray true
  static const Color grayTrue25 = Color(0xFFFCFCFC);
  static const Color grayTrue50 = Color(0xFFF7F7F7);
  static const Color grayTrue100 = Color(0xFFF5F5F5);
  static const Color grayTrue200 = Color(0xFFE5E5E5);
  static const Color grayTrue300 = Color(0xFFD6D6D6);
  static const Color grayTrue400 = Color(0xFFA3A3A3);
  static const Color grayTrue500 = Color(0xFF737373);
  static const Color grayTrue600 = Color(0xFF525252);
  static const Color grayTrue700 = Color(0xFF424242);
  static const Color grayTrue800 = Color(0xFF292929);
  static const Color grayTrue900 = Color(0xFF141414);
  static const Color grayTrue950 = Color(0xFF0F0F0F);

// Gray warm
  static const Color grayWarm25 = Color(0xFFFDFDFC);
  static const Color grayWarm50 = Color(0xFFFAFAF9);
  static const Color grayWarm100 = Color(0xFFF5F5F4);
  static const Color grayWarm200 = Color(0xFFE7E5E4);
  static const Color grayWarm300 = Color(0xFFD7D3D0);
  static const Color grayWarm400 = Color(0xFFA9A29D);
  static const Color grayWarm500 = Color(0xFF79716B);
  static const Color grayWarm600 = Color(0xFF57534E);
  static const Color grayWarm700 = Color(0xFF44403C);
  static const Color grayWarm800 = Color(0xFF292524);
  static const Color grayWarm900 = Color(0xFF1C1917);
  static const Color grayWarm950 = Color(0xFF171412);

// Moss
  static const Color moss25 = Color(0xFFFAFDF7);
  static const Color moss50 = Color(0xFFF5FBEE);
  static const Color moss100 = Color(0xFFE6F4D7);
  static const Color moss200 = Color(0xFFCEEAB0);
  static const Color moss300 = Color(0xFFACDC79);
  static const Color moss400 = Color(0xFF86CB3C);
  static const Color moss500 = Color(0xFF669F2A);
  static const Color moss600 = Color(0xFF4F7A21);
  static const Color moss700 = Color(0xFF3F621A);
  static const Color moss800 = Color(0xFF335015);
  static const Color moss900 = Color(0xFF2B4212);
  static const Color moss950 = Color(0xFF1A280B);

// Green light
  static const Color greenLight25 = Color(0xFFFAFEF5);
  static const Color greenLight50 = Color(0xFFF3FEE7);
  static const Color greenLight100 = Color(0xFFE3FBCC);
  static const Color greenLight200 = Color(0xFFD0F8AB);
  static const Color greenLight300 = Color(0xFFA6EF67);
  static const Color greenLight400 = Color(0xFF85E13A);
  static const Color greenLight500 = Color(0xFF66C61C);
  static const Color greenLight600 = Color(0xFF4CA30D);
  static const Color greenLight700 = Color(0xFF3B7C0F);
  static const Color greenLight800 = Color(0xFF326212);
  static const Color greenLight900 = Color(0xFF2B5314);
  static const Color greenLight950 = Color(0xFF15290A);

// Teal
  static const Color teal25 = Color(0xFFF6FEFC);
  static const Color teal50 = Color(0xFFF0FDF9);
  static const Color teal100 = Color(0xFFCCFBEF);
  static const Color teal200 = Color(0xFF99F6E0);
  static const Color teal300 = Color(0xFF5FE9D0);
  static const Color teal400 = Color(0xFF2ED3B7);
  static const Color teal500 = Color(0xFF15B79E);
  static const Color teal600 = Color(0xFF0E9384);
  static const Color teal700 = Color(0xFF107569);
  static const Color teal800 = Color(0xFF125D56);
  static const Color teal900 = Color(0xFF134E48);
  static const Color teal950 = Color(0xFF0A2926);

// Cyan
  static const Color cyan25 = Color(0xFFF5FEFF);
  static const Color cyan50 = Color(0xFFECFDFF);
  static const Color cyan100 = Color(0xFFCFF9FE);
  static const Color cyan200 = Color(0xFFA5F0FC);
  static const Color cyan300 = Color(0xFF67E3F9);
  static const Color cyan400 = Color(0xFF22CCEE);
  static const Color cyan500 = Color(0xFF06AED4);
  static const Color cyan600 = Color(0xFF088AB2);
  static const Color cyan700 = Color(0xFF0E7090);
  static const Color cyan800 = Color(0xFF155B75);
  static const Color cyan900 = Color(0xFF164C63);
  static const Color cyan950 = Color(0xFF0D2D3A);

// Blue light
  static const Color blueLight25 = Color(0xFFF5FBFF);
  static const Color blueLight50 = Color(0xFFF0F9FF);
  static const Color blueLight100 = Color(0xFFE0F2FE);
  static const Color blueLight200 = Color(0xFFB9E6FE);
  static const Color blueLight300 = Color(0xFF7CD4FD);
  static const Color blueLight400 = Color(0xFF36BFFA);
  static const Color blueLight500 = Color(0xFF0BA5EC);
  static const Color blueLight600 = Color(0xFF0086C9);
  static const Color blueLight700 = Color(0xFF026AA2);
  static const Color blueLight800 = Color(0xFF065986);
  static const Color blueLight900 = Color(0xFF0B4A6F);
  static const Color blueLight950 = Color(0xFF062C41);

// Blue
  static const Color blue25 = Color(0xFFF5FAFF);
  static const Color blue50 = Color(0xFFEFF8FF);
  static const Color blue100 = Color(0xFFD1E9FF);
  static const Color blue200 = Color(0xFFB2DDFF);
  static const Color blue300 = Color(0xFF84CAFF);
  static const Color blue400 = Color(0xFF53B1FD);
  static const Color blue500 = Color(0xFF2E90FA);
  static const Color blue600 = Color(0xFF1570EF);
  static const Color blue700 = Color(0xFF175CD3);
  static const Color blue800 = Color(0xFF1849A9);
  static const Color blue900 = Color(0xFF194185);
  static const Color blue950 = Color(0xFF102A56);

// Blue dark
  static const Color blueDark25 = Color(0xFFF5F8FF);
  static const Color blueDark50 = Color(0xFFEFF4FF);
  static const Color blueDark100 = Color(0xFFD1E0FF);
  static const Color blueDark200 = Color(0xFFB2CCFF);
  static const Color blueDark300 = Color(0xFF84ADFF);
  static const Color blueDark400 = Color(0xFF528BFF);
  static const Color blueDark500 = Color(0xFF2970FF);
  static const Color blueDark600 = Color(0xFF155EEF);
  static const Color blueDark700 = Color(0xFF004EEB);
  static const Color blueDark800 = Color(0xFF0040C1);
  static const Color blueDark900 = Color(0xFF00359E);
  static const Color blueDark950 = Color(0xFF002266);

// Indigo
  static const Color indigo25 = Color(0xFFF5F8FF);
  static const Color indigo50 = Color(0xFFEEF4FF);
  static const Color indigo100 = Color(0xFFE0EAFF);
  static const Color indigo200 = Color(0xFFC7D7FE);
  static const Color indigo300 = Color(0xFFA4BCFD);
  static const Color indigo400 = Color(0xFF8098F9);
  static const Color indigo500 = Color(0xFF6172F3);
  static const Color indigo600 = Color(0xFF444CE7);
  static const Color indigo700 = Color(0xFF3538CD);
  static const Color indigo800 = Color(0xFF2D31A6);
  static const Color indigo900 = Color(0xFF2D3282);
  static const Color indigo950 = Color(0xFF1F235B);

// Violet
  static const Color violet25 = Color(0xFFFBFAFF);
  static const Color violet50 = Color(0xFFF5F3FF);
  static const Color violet100 = Color(0xFFECE9FE);
  static const Color violet200 = Color(0xFFDDD6FE);
  static const Color violet300 = Color(0xFFC3B5FD);
  static const Color violet400 = Color(0xFFA48AFB);
  static const Color violet500 = Color(0xFF875BF7);
  static const Color violet600 = Color(0xFF7839EE);
  static const Color violet700 = Color(0xFF6927DA);
  static const Color violet800 = Color(0xFF5720B7);
  static const Color violet900 = Color(0xFF491C96);
  static const Color violet950 = Color(0xFF2E125E);

// Purple
  static const Color purple25 = Color(0xFFFAFAFF);
  static const Color purple50 = Color(0xFFF4F3FF);
  static const Color purple100 = Color(0xFFEBE9FE);
  static const Color purple200 = Color(0xFFD9D6FE);
  static const Color purple300 = Color(0xFFBDB4FE);
  static const Color purple400 = Color(0xFF9B8AFB);
  static const Color purple500 = Color(0xFF7A5AF8);
  static const Color purple600 = Color(0xFF6938EF);
  static const Color purple700 = Color(0xFF5925DC);
  static const Color purple800 = Color(0xFF4A1FB8);
  static const Color purple900 = Color(0xFF3E1C96);
  static const Color purple950 = Color(0xFF27115F);

// Fuchsia
  static const Color fuchsia25 = Color(0xFFFEFAFF);
  static const Color fuchsia50 = Color(0xFFFDF4FF);
  static const Color fuchsia100 = Color(0xFFFBE8FF);
  static const Color fuchsia200 = Color(0xFFF6D0FE);
  static const Color fuchsia300 = Color(0xFFEEAAFD);
  static const Color fuchsia400 = Color(0xFFE478FA);
  static const Color fuchsia500 = Color(0xFFD444F1);
  static const Color fuchsia600 = Color(0xFFBA24D5);
  static const Color fuchsia700 = Color(0xFF9F1AB1);
  static const Color fuchsia800 = Color(0xFF821890);
  static const Color fuchsia900 = Color(0xFF6F1877);
  static const Color fuchsia950 = Color(0xFF47104C);

// Pink
  static const Color pink25 = Color(0xFFFEF6FB);
  static const Color pink50 = Color(0xFFFDF2FA);
  static const Color pink100 = Color(0xFFFCE7F6);
  static const Color pink200 = Color(0xFFFCCEEE);
  static const Color pink300 = Color(0xFFFAA7E0);
  static const Color pink400 = Color(0xFFF670C7);
  static const Color pink500 = Color(0xFFEE46BC);
  static const Color pink600 = Color(0xFFDD2590);
  static const Color pink700 = Color(0xFFC11574);
  static const Color pink800 = Color(0xFF9E165F);
  static const Color pink900 = Color(0xFF851651);
  static const Color pink950 = Color(0xFF4E0D30);

// Rosé
  static const Color rose25 = Color(0xFFFFF5F6);
  static const Color rose50 = Color(0xFFFFF1F3);
  static const Color rose100 = Color(0xFFFFE4E8);
  static const Color rose200 = Color(0xFFFECDD6);
  static const Color rose300 = Color(0xFFFEA3B4);
  static const Color rose400 = Color(0xFFFD6F8E);
  static const Color rose500 = Color(0xFFF63D68);
  static const Color rose600 = Color(0xFFE31B54);
  static const Color rose700 = Color(0xFFC01048);
  static const Color rose800 = Color(0xFFA11043);
  static const Color rose900 = Color(0xFF89123E);
  static const Color rose950 = Color(0xFF510B24);

// Orange dark
  static const Color orangeDark25 = Color(0xFFFFF9F5);
  static const Color orangeDark50 = Color(0xFFFFF4ED);
  static const Color orangeDark100 = Color(0xFFFFE6D5);
  static const Color orangeDark200 = Color(0xFFFFD6AE);
  static const Color orangeDark300 = Color(0xFFFF9C66);
  static const Color orangeDark400 = Color(0xFFFF692E);
  static const Color orangeDark500 = Color(0xFFFF4405);
  static const Color orangeDark600 = Color(0xFFE62E05);
  static const Color orangeDark700 = Color(0xFFBC1B06);
  static const Color orangeDark800 = Color(0xFF97180C);
  static const Color orangeDark900 = Color(0xFF771A0D);
  static const Color orangeDark950 = Color(0xFF57130A);

// Orange
  static const Color orange25 = Color(0xFFFEFAF5);
  static const Color orange50 = Color(0xFFFEF6EE);
  static const Color orange100 = Color(0xFFFDEAD7);
  static const Color orange200 = Color(0xFFF9DBAF);
  static const Color orange300 = Color(0xFFF7B27A);
  static const Color orange400 = Color(0xFFF38744);
  static const Color orange500 = Color(0xFFEF6820);
  static const Color orange600 = Color(0xFFE04F16);
  static const Color orange700 = Color(0xFFB93815);
  static const Color orange800 = Color(0xFF932F19);
  static const Color orange900 = Color(0xFF772917);
  static const Color orange950 = Color(0xFF511C10);

// Yellow
  static const Color yellow25 = Color(0xFFFEFDF0);
  static const Color yellow50 = Color(0xFFFEFBE8);
  static const Color yellow100 = Color(0xFFFEF7C3);
  static const Color yellow200 = Color(0xFFFEEE95);
  static const Color yellow300 = Color(0xFFFDE272);
  static const Color yellow400 = Color(0xFFFAC515);
  static const Color yellow500 = Color(0xFFEAAA08);
  static const Color yellow600 = Color(0xFFCA8504);
  static const Color yellow700 = Color(0xFFA15C07);
  static const Color yellow800 = Color(0xFF854A0E);
  static const Color yellow900 = Color(0xFF713B12);
  static const Color yellow950 = Color(0xFF542C0D);

// Gray (dark mode alpha)
  static const Color grayDarkModeAlpha25 = Color(0xFAFFFFFF);
  static const Color grayDarkModeAlpha50 = Color(0xF5FFFFFF);
  static const Color grayDarkModeAlpha100 = Color(0xF0FFFFFF);
  static const Color grayDarkModeAlpha200 = Color(0xEBFFFFFF);
  static const Color grayDarkModeAlpha300 = Color(0xCCFFFFFF);
  static const Color grayDarkModeAlpha400 = Color(0x8FFFFFFF);
  static const Color grayDarkModeAlpha500 = Color(0x80FFFFFF);
  static const Color grayDarkModeAlpha600 = Color(0x59FFFFFF);
  static const Color grayDarkModeAlpha700 = Color(0x29FFFFFF);
  static const Color grayDarkModeAlpha800 = Color(0x14FFFFFF);
  static const Color grayDarkModeAlpha900 = Color(0x0AFFFFFF);
  static const Color grayDarkModeAlpha950 = Color(0x00FFFFFF);

// Gray (dark mode)
  static const Color grayDarkMode25 = Color(0xFFFAFAFA);
  static const Color grayDarkMode50 = Color(0xFFF7F7F7);
  static const Color grayDarkMode100 = Color(0xFFF0F0F1);
  static const Color grayDarkMode200 = Color(0xFFECECED);
  static const Color grayDarkMode300 = Color(0xFFCECFD2);
  static const Color grayDarkMode400 = Color(0xFF94979C);
  static const Color grayDarkMode500 = Color(0xFF85888E);
  static const Color grayDarkMode600 = Color(0xFF61656C);
  static const Color grayDarkMode700 = Color(0xFF373A41);
  static const Color grayDarkMode800 = Color(0xFF22262F);
  static const Color grayDarkMode900 = Color(0xFF13161B);
  static const Color grayDarkMode950 = Color(0xFF0C0E12);

  // Border
  static const Color secondary = Color(0xFFE9E9EB);
}

class AppSpacing {
// Spacing
  // Semantic Spacing
  static const double spacingNone = 0.0;
  static const double spacingXXS = 2.0;
  static const double spacingXS = 4.0;
  static const double spacingSM = 6.0;
  static const double spacingMD = 8.0;
  static const double spacingLG = 12.0;
  static const double spacingXL = 16.0;
  static const double spacing2XL = 20.0;
  static const double spacing3XL = 24.0;
  static const double spacing4XL = 32.0;
  static const double spacing5XL = 40.0;
  static const double spacing6XL = 48.0;
  static const double spacing7XL = 64.0;
  static const double spacing8XL = 80.0;
  static const double spacing9XL = 96.0;
  static const double spacing10XL = 128.0;
  static const double spacing11XL = 160.0;
}

class AppRadius {
  // Border Radius
  static const double radiusNone = 0.0;
  static const double radiusXXS = 2.0;
  static const double radiusXS = 4.0;
  static const double radiusSM = 6.0;
  static const double radiusMD = 8.0;
  static const double radiusLG = 10.0;
  static const double radiusXL = 12.0;
  static const double radius2XL = 16.0;
  static const double radius3XL = 20.0;
  static const double radius4XL = 24.0;
  static const double radiusFull = 9999.0;
}

const appLightColors = AppModeColorsExtension(
  textPrimary: Color(0xFF181D27),
  textSecondary: Color(0xFF414651),
  textTertiary: Color(0xFF535862),
  textQuaternary: Color(0xFF717680),
  textDisabled: Color(0xFF717680),
  textWhite: Color(0xFFFFFFFF),
  textPlaceholder: Color(0xFF717680),
  textPlaceholderSubtle: Color(0xFFD5D7DA),
  textBrandPrimary: Color(0xFF2D1450),
  textBrandSecondary: Color(0xFF4F2489),
  textBrandTertiary: Color(0xFF5F2F9D),
  textBrandTertiaryAlt: Color(0xFF5F2F9D),
  textErrorPrimary: Color(0xFFD92D20),
  textErrorHover: Color(0xFFB42318),
  textWarningPrimary: Color(0xFFDC6803),
  textSuccessPrimary: Color(0xFF079455),
  borderPrimary: Color(0xFFD5D7DA),
  borderSecondary: Color(0xFFE9EAEB),
  borderTertiary: Color(0xFFF5F5F5),
  borderDisabled: Color(0xFFD5D7DA),
  borderDisabledSubtle: Color(0xFFE9EAEB),
  borderBrand: Color(0xFF6F3AB1),
  borderBrandAlt: Color(0xFF5F2F9D),
  borderError: Color(0xFFF04438),
  borderErrorSubtle: Color(0xFFFDA29B),
  borderSecondaryAlt: Color(0x14000000),
  bgPrimary: Color(0xFFFFFFFF),
  bgSecondary: Color(0xFFFAFAFA),
  bgTertiary: Color(0xFFF5F5F5),
  bgQuaternary: Color(0xFFE9EAEB),
  bgBrandPrimary: Color(0xFFECE3F5),
  bgBrandSecondary: Color(0xFFDAC9EB),
  bgBrandSolid: Color(0xFF5F2F9D),
  bgBrandSolidHover: Color(0xFF4F2489),
  bgErrorPrimary: Color(0xFFFEF3F2),
  bgErrorSecondary: Color(0xFFFEE4E2),
  bgErrorSolid: Color(0xFFD92D20),
  bgErrorSolidHover: Color(0xFFB42318),
  bgWarningPrimary: Color(0xFFFFFAEB),
  bgWarningSecondary: Color(0xFFFEF0C7),
  bgWarningSolid: Color(0xFFDC6803),
  bgSuccessPrimary: Color(0xFFECFDF3),
  bgSuccessSecondary: Color(0xFFDCFAE6),
  bgSuccessSolid: Color(0xFF079455),
  bgDisabled: Color(0xFFF5F5F5),
  bgDisabledSubtle: Color(0xFFFAFAFA),
  bgOverlay: Color(0xFF0A0D12),
  fgPrimary: Color(0xFF181D27),
  fgSecondary: Color(0xFF414651),
  fgTertiary: Color(0xFF535862),
  fgQuaternary: Color(0xFFA4A7AE),
  fgDisabled: Color(0xFFA4A7AE),
  fgWhite: Color(0xFFFFFFFF),
  fgBrandPrimary: Color(0xFF5F2F9D),
  fgBrandSecondary: Color(0xFF6F3AB1),
  fgErrorPrimary: Color(0xFFD92D20),
  fgErrorSecondary: Color(0xFFF04438),
  fgWarningPrimary: Color(0xFFDC6803),
  fgWarningSecondary: Color(0xFFF79009),
  fgSuccessPrimary: Color(0xFF079455),
  fgSuccessSecondary: Color(0xFF17B26A),
  focusRing: Color(0xFF6F3AB1),
  focusRingError: Color(0xFFF04438),
  alphaWhite90: Color(0xE6FFFFFF),
  alphaWhite80: Color(0xCCFFFFFF),
  alphaWhite70: Color(0xB3FFFFFF),
  alphaWhite60: Color(0x99FFFFFF),
  alphaWhite50: Color(0x80FFFFFF),
  alphaWhite40: Color(0x66FFFFFF),
  alphaWhite30: Color(0x4DFFFFFF),
  alphaWhite20: Color(0x33FFFFFF),
  alphaWhite10: Color(0x1AFFFFFF),
  alphaBlack10: Color(0x1A000000),
  alphaBlack20: Color(0x33000000),
  alphaBlack30: Color(0x4D000000),
  alphaBlack40: Color(0x66000000),
  alphaBlack50: Color(0x80000000),
  alphaBlack60: Color(0x99000000),
  alphaBlack70: Color(0xB3000000),
  alphaBlack80: Color(0xCC000000),
  alphaBlack90: Color(0xE6000000),
  alphaBlack100: Color(0xFF000000),
);

const appDarkColors = AppModeColorsExtension(
  // Text colors
  textPrimary: Color(0xFFF7F7F7),
  textSecondary: Color(0xFFCECFD2),
  textTertiary: Color(0xFF94979C),
  textQuaternary: Color(0xFF94979C),
  textDisabled: Color(0xFF85888E),
  textWhite: Color(0xFFFFFFFF),
  textPlaceholder: Color(0xFF85888E),
  textPlaceholderSubtle: Color(0xFF373A41),
  textBrandPrimary: Color(0xFFF7F7F7),
  textBrandSecondary: Color(0xFFCECFD2),
  textBrandTertiary: Color(0xFF94979C),
  textBrandTertiaryAlt: Color(0xFFF7F7F7),
  textErrorPrimary: Color(0xFFF97066),
  textErrorHover: Color(0xFFFDA29B),
  textWarningPrimary: Color(0xFFFDB022),
  textSuccessPrimary: Color(0xFF47CD89),

  // Border colors
  borderPrimary: Color(0xFF373A41),
  borderSecondary: Color(0xFF22262F),
  borderTertiary: Color(0xFF22262F),
  borderDisabled: Color(0xFF373A41),
  borderDisabledSubtle: Color(0xFF22262F),
  borderBrand: Color(0xFF8E57C1),
  borderBrandAlt: Color(0xFF373A41),
  borderSecondaryAlt: Color(0xFF22262F),
  borderError: Color(0xFFF97066),
  borderErrorSubtle: Color(0xFFF04438),

  // Background colors
  bgPrimary: Color(0xFF12151B),
  bgSecondary: Color(0xFF13161B),
  bgTertiary: Color(0xFF22262F),
  bgQuaternary: Color(0xFF373A41),
  bgBrandPrimary: Color(0xFF6F3AB1),
  bgBrandSecondary: Color(0xFF5F2F9D),
  bgBrandSolid: Color(0xFF5F2F9D),
  bgBrandSolidHover: Color(0xFF6F3AB1),
  bgErrorPrimary: Color(0xFF55160C),
  bgErrorSecondary: Color(0xFFD92D20),
  bgErrorSolid: Color(0xFFD92D20),
  bgErrorSolidHover: Color(0xFFF04438),
  bgWarningPrimary: Color(0xFF4E1D09),
  bgWarningSecondary: Color(0xFFDC6803),
  bgWarningSolid: Color(0xFFDC6803),
  bgSuccessPrimary: Color(0xFF053321),
  bgSuccessSecondary: Color(0xFF079455),
  bgSuccessSolid: Color(0xFF079455),
  bgDisabled: Color(0xFF22262F),
  bgDisabledSubtle: Color(0xFF13161B),
  bgOverlay: Color(0xFF22262F),

  // Foreground colors
  fgPrimary: Color(0xFFFFFFFF),
  fgSecondary: Color(0xFFCECFD2),
  fgTertiary: Color(0xFF94979C),
  fgQuaternary: Color(0xFF61656C),
  fgDisabled: Color(0xFF85888E),
  fgWhite: Color(0xFFFFFFFF),
  fgBrandPrimary: Color(0xFF6F3AB1),
  fgBrandSecondary: Color(0xFF6F3AB1),
  fgErrorPrimary: Color(0xFFF04438),
  fgErrorSecondary: Color(0xFFF97066),
  fgWarningPrimary: Color(0xFFF79009),
  fgWarningSecondary: Color(0xFFFDB022),
  fgSuccessPrimary: Color(0xFF17B26A),
  fgSuccessSecondary: Color(0xFF47CD89),

  // Effects
  focusRing: Color(0xFF6F3AB1),
  focusRingError: Color(0xFFF04438),

  // Alpha colors
  alphaWhite90: Color(0xE6FFFFFF),
  alphaWhite80: Color(0xCCFFFFFF),
  alphaWhite70: Color(0xB3FFFFFF),
  alphaWhite60: Color(0x99FFFFFF),
  alphaWhite50: Color(0x80FFFFFF),
  alphaWhite40: Color(0x66FFFFFF),
  alphaWhite30: Color(0x4DFFFFFF),
  alphaWhite20: Color(0x33FFFFFF),
  alphaWhite10: Color(0x1AFFFFFF),

  alphaBlack10: Color(0x1A000000),
  alphaBlack20: Color(0x33000000),
  alphaBlack30: Color(0x4D000000),
  alphaBlack40: Color(0x66000000),
  alphaBlack50: Color(0x80000000),
  alphaBlack60: Color(0x99000000),
  alphaBlack70: Color(0xB3000000),
  alphaBlack80: Color(0xCC000000),
  alphaBlack90: Color(0xE6000000),
  alphaBlack100: Color(0xFF000000),
);

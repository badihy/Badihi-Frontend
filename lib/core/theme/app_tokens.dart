import 'package:badihi/core/extensions/app_mode_colors_extension.dart';
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
  bgSecondary_hover: Color(0xFFF5F5F5),
  fgBrandPrimaryAlt: Color(0xFF5F2F9D),
  fgSecondaryHover: Color(0xFF30343E),
  fgTertiaryHover: Color(0xFF414651),
  textErrorPrimaryHover: Color(0xFFB42318),
  bgTertiary: Color(0xFFF5F5F5),
  bgActive: Color(0xFFFAFAFA),
  bgQuaternary: Color(0xFFE9EAEB),
  bgBrandPrimary: Color(0xFFECE3F5),
  bgBrandPrimaryAlt: Color(0xFFECE3F5),
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
  fgQuaternary_hover: Color(0xFF717680),
  fgDisabled: Color(0xFFA4A7AE),
  fgDisabledSubtle: Color(0xFFD5D6D9),
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
  // New Utility Blue Colors
  utilityBlue50: Color(0xFFEFF6FF),
  utilityBlue100: Color(0xFFDBEAFE),
  utilityBlue200: Color(0xFFBFDBFE),
  utilityBlue300: Color(0xFF93C5FD),
  utilityBlue400: Color(0xFF60A5FA),
  utilityBlue500: Color(0xFF3B82F6),
  utilityBlue600: Color(0xFF2563EB),
  utilityBlue700: Color(0xFF1D4ED8),

  // New Utility Brand Colors (based on existing brand colors)
  utilityBrand50: Color(0xFFECE3F5),
  utilityBrand100: Color(0xFFDAC9EB),
  utilityBrand200: Color(0xFFC5A8E0),
  utilityBrand300: Color(0xFFAF87D5),
  utilityBrand400: Color(0xFF9966CA),
  utilityBrand500: Color(0xFF8345BF),
  utilityBrand600: Color(0xFF6F3AB1),
  utilityBrand700: Color(0xFF5F2F9D),
  utilityBrand800: Color(0xFF4F2489),
  utilityBrand900: Color(0xFF3F1A75),
  utilityBrand50Alt: Color(0xFFECE3F5),
  utilityBrand100Alt: Color(0xFFDAC9EB),
  utilityBrand200Alt: Color(0xFFC5A8E0),
  utilityBrand300Alt: Color(0xFFAF87D5),
  utilityBrand400Alt: Color(0xFF9966CA),
  utilityBrand500Alt: Color(0xFF8345BF),
  utilityBrand600Alt: Color(0xFF6F3AB1),
  utilityBrand700Alt: Color(0xFF5F2F9D),
  utilityBrand800Alt: Color(0xFF4F2489),
  utilityBrand900Alt: Color(0xFF3F1A75),

  // New Utility Gray Colors (matching existing text/background colors)
  utilityGray50: Color(0xFFFAFAFA),
  utilityGray100: Color(0xFFF5F5F5),
  utilityGray200: Color(0xFFE9EAEB),
  utilityGray300: Color(0xFFD5D7DA),
  utilityGray400: Color(0xFFA4A7AE),
  utilityGray500: Color(0xFF717680),
  utilityGray600: Color(0xFF535862),
  utilityGray700: Color(0xFF414651),
  utilityGray800: Color(0xFF30343E),
  utilityGray900: Color(0xFF181D27),

  // New Utility Error Colors (based on existing error colors)
  utilityError50: Color(0xFFFEF3F2),
  utilityError100: Color(0xFFFEE4E2),
  utilityError200: Color(0xFFFECDCA),
  utilityError300: Color(0xFFFDA29B),
  utilityError400: Color(0xFFF97066),
  utilityError500: Color(0xFFF04438),
  utilityError600: Color(0xFFD92D20),
  utilityError700: Color(0xFFB42318),

  // New Utility Warning Colors (based on existing warning colors)
  utilityWarning50: Color(0xFFFFFAEB),
  utilityWarning100: Color(0xFFFEF0C7),
  utilityWarning200: Color(0xFFFEDF89),
  utilityWarning300: Color(0xFFFEC84B),
  utilityWarning400: Color(0xFFFDB022),
  utilityWarning500: Color(0xFFF79009),
  utilityWarning600: Color(0xFFDC6803),
  utilityWarning700: Color(0xFFB54708),

  // New Utility Success Colors (based on existing success colors)
  utilitySuccess50: Color(0xFFECFDF3),
  utilitySuccess100: Color(0xFFDCFAE6),
  utilitySuccess200: Color(0xFFABEFC6),
  utilitySuccess300: Color(0xFF75E0A7),
  utilitySuccess400: Color(0xFF47CD89),
  utilitySuccess500: Color(0xFF17B26A),
  utilitySuccess600: Color(0xFF079455),
  utilitySuccess700: Color(0xFF067647),

  // New Utility Orange Colors
  utilityOrange50: Color(0xFFFFFAF5),
  utilityOrange100: Color(0xFFFFF0E6),
  utilityOrange200: Color(0xFFFFE0CC),
  utilityOrange300: Color(0xFFFFD1B3),
  utilityOrange400: Color(0xFFFFB380),
  utilityOrange500: Color(0xFFFF944D),
  utilityOrange600: Color(0xFFFF751A),
  utilityOrange700: Color(0xFFE65C00),

  // New Utility Blue Dark Colors
  utilityBlueDark50: Color(0xFFE6F0FF),
  utilityBlueDark100: Color(0xFFCCE0FF),
  utilityBlueDark200: Color(0xFF99C2FF),
  utilityBlueDark300: Color(0xFF66A3FF),
  utilityBlueDark400: Color(0xFF3385FF),
  utilityBlueDark500: Color(0xFF0066FF),
  utilityBlueDark600: Color(0xFF0052CC),
  utilityBlueDark700: Color(0xFF003D99),

  // New Utility Indigo Colors
  utilityIndigo50: Color(0xFFF0F4FF),
  utilityIndigo100: Color(0xFFE0E8FF),
  utilityIndigo200: Color(0xFFC7D2FE),
  utilityIndigo300: Color(0xFFA5B4FC),
  utilityIndigo400: Color(0xFF818CF8),
  utilityIndigo500: Color(0xFF6366F1),
  utilityIndigo600: Color(0xFF4F46E5),
  utilityIndigo700: Color(0xFF4338CA),

  // New Utility Fuchsia Colors
  utilityFuchsia50: Color(0xFFFDF4FF),
  utilityFuchsia100: Color(0xFFFAE8FF),
  utilityFuchsia200: Color(0xFFF5D0FE),
  utilityFuchsia300: Color(0xFFF0ABFC),
  utilityFuchsia400: Color(0xFFE879F9),
  utilityFuchsia500: Color(0xFFD946EF),
  utilityFuchsia600: Color(0xFFC026D3),
  utilityFuchsia700: Color(0xFFA21CAF),

  // New Utility Pink Colors
  utilityPink50: Color(0xFFFDF2F8),
  utilityPink100: Color(0xFFFCE7F3),
  utilityPink200: Color(0xFFFBCFE8),
  utilityPink300: Color(0xFFF9A8D4),
  utilityPink400: Color(0xFFF472B6),
  utilityPink500: Color(0xFFEC4899),
  utilityPink600: Color(0xFFDB2777),
  utilityPink700: Color(0xFFBE185D),

  // New Utility Purple Colors
  utilityPurple50: Color(0xFFFAF5FF),
  utilityPurple100: Color(0xFFF3E8FF),
  utilityPurple200: Color(0xFFE9D5FF),
  utilityPurple300: Color(0xFFD8B4FE),
  utilityPurple400: Color(0xFFC084FC),
  utilityPurple500: Color(0xFFA855F7),
  utilityPurple600: Color(0xFF9333EA),
  utilityPurple700: Color(0xFF7E22CE),

  // New Utility Orange Dark Colors
  utilityOrangeDark50: Color(0xFFFFF7ED),
  utilityOrangeDark100: Color(0xFFFFEDD5),
  utilityOrangeDark200: Color(0xFFFED7AA),
  utilityOrangeDark300: Color(0xFFFDBA74),
  utilityOrangeDark400: Color(0xFFFB923C),
  utilityOrangeDark500: Color(0xFFF97316),
  utilityOrangeDark600: Color(0xFFEA580C),
  utilityOrangeDark700: Color(0xFFC2410C),

  // New Utility Blue Light Colors
  utilityBlueLight50: Color(0xFFF0F9FF),
  utilityBlueLight100: Color(0xFFE0F2FE),
  utilityBlueLight200: Color(0xFFBAE6FD),
  utilityBlueLight300: Color(0xFF7DD3FC),
  utilityBlueLight400: Color(0xFF38BDF8),
  utilityBlueLight500: Color(0xFF0EA5E9),
  utilityBlueLight600: Color(0xFF0284C7),
  utilityBlueLight700: Color(0xFF0369A1),

  // New Utility Gray Blue Colors
  utilityGrayBlue50: Color(0xFFF8FAFC),
  utilityGrayBlue100: Color(0xFFF1F5F9),
  utilityGrayBlue200: Color(0xFFE2E8F0),
  utilityGrayBlue300: Color(0xFFCBD5E1),
  utilityGrayBlue400: Color(0xFF94A3B8),
  utilityGrayBlue500: Color(0xFF64748B),
  utilityGrayBlue600: Color(0xFF475569),
  utilityGrayBlue700: Color(0xFF334155),

  // New Utility Green Colors
  utilityGreen50: Color(0xFFF0FDF4),
  utilityGreen100: Color(0xFFDCFCE7),
  utilityGreen200: Color(0xFFBBF7D0),
  utilityGreen300: Color(0xFF86EFAC),
  utilityGreen400: Color(0xFF4ADE80),
  utilityGreen500: Color(0xFF22C55E),
  utilityGreen600: Color(0xFF16A34A),
  utilityGreen700: Color(0xFF15803D),

  // New Utility Yellow Colors
  utilityYellow50: Color(0xFFFEFCE8),
  utilityYellow100: Color(0xFFFEF9C3),
  utilityYellow200: Color(0xFFFEF08A),
  utilityYellow300: Color(0xFFFDE047),
  utilityYellow400: Color(0xFFFACC15),
  utilityYellow500: Color(0xFFEAB308),
  utilityYellow600: Color(0xFFCA8A04),
  utilityYellow700: Color(0xFFA16207),

  // Tooltips
  tooltipSupportingText: Color(0xFFD5D7DA),
  textEditorIconFg: Color(0xFFA4A7AE),
  textEditorIconFgActive: Color(0xFF717680),
  featuredIconLightFgBrand: Color(0xFF6F3AB1),
  featuredIconLightFgGray: Color(0xFF717680),
  featuredIconLightFgError: Color(0xFFD92D20),
  featuredIconLightFgWarning: Color(0xFFDC6803),
  featuredIconLightFgSuccess: Color(0xFF079455),
  iconFgBrand: Color(0xFF6F3AB1),
  iconFgBrandOnBrand: Color(0xFFC5A8E0),
  sliderHandleBorder: Color(0xFF6F3AB1),
  sliderHandleBg: Color(0xFFFFFFFF),
  screenMockupBorder: Color(0xFF181D27),
  footerButtonFg: Color(0xFFC5A8E0),
  footerButtonFgHover: Color(0xFFFFFFFF),
  appStoreBadgeBorder: Color(0xFFA6A6A6),
  toggleButtonFgDisabled: Color(0xFFFAFAFA),
  toggleBorder: Color(0xFFD5D7DA),
  toggleSlimBorderPressed: Color(0xFF5F2F9D),
  toggleSlimBorderPressedHover: Color(0xFF4F2489),
  avatarStylesBgNeutral: Color(0xFFE0E0E0),
  buttonPrimaryIcon: Color(0xFFAF87D5),
  buttonPrimaryIconHover: Color(0xFFC5A8E0),
  buttonDestructivePrimaryIcon: Color(0xFFFDA29B),
  buttonDestructivePrimaryIconHover: Color(0xFFFECDCA),
  // Add these missing colors to your appLightColors:

// Text Colors
  textSecondaryHover: Color(0xFF30343E), // Gray.800 equivalent
  textTertiaryHover: Color(0xFF414651), // Gray.700 equivalent
  textPrimaryOnBrand: Color(0xFFFFFFFF), // Base.white
  textSecondaryOnBrand: Color(0xFFC5A8E0), // Brand.200 equivalent
  textTertiaryOnBrand: Color(0xFFC5A8E0), // Brand.200 equivalent
  textQuaternaryOnBrand: Color(0xFFAF87D5), // Brand.300 equivalent
  textBrandSecondaryHover: Color(0xFF4F2489), // Brand.800 equivalent

// Background Colors
  bgSecondarySolid: Color(0xFF535862), // Gray.600 equivalent
  bgPrimaryHover: Color(0xFFFAFAFA), // Gray.50 equivalent
  bgPrimaryAlt: Color(0xFFFFFFFF), // Base.white
  bgSecondaryAlt: Color(0xFFFAFAFA), // Gray.50 equivalent
  bgSecondarySubtle: Color(0xFFFCFCFC), // Gray.25 equivalent (approximated)
  bgBrandSection: Color(0xFF4F2489), // Brand.800 equivalent
  bgBrandSectionSubtle: Color(0xFF5F2F9D), // Brand.700 equivalent
  bgPrimarySolid: Color(0xFF0A0D12), // Gray.950 equivalent

// Foreground Colors
  fgBrandSecondaryAlt: Color(0xFF6F3AB1), // Same as fgBrandSecondary
  fgBrandSecondaryHover: Color(0xFF6F3AB1), // Brand.600 equivalent

// Shadow Colors
  shadowXs: Color(0x0D0A0D12),
  shadowSm01: Color(0x1A0A0D12),
  shadowSm02: Color(0x1A0A0D12),
  shadowMd01: Color(0x1A0A0D12),
  shadowMd02: Color(0x0F0A0D12),
  shadowLg01: Color(0x140A0D12),
  shadowLg02: Color(0x080A0D12),
  shadowLg03: Color(0x0A0A0D12),
  shadowXl01: Color(0x140A0D12),
  shadowXl02: Color(0x080A0D12),
  shadowXl03: Color(0x0A0A0D12),
  shadow2xl01: Color(0x2E0A0D12),
  shadow2xl02: Color(0x0A0A0D12),
  shadow3xl01: Color(0x240A0D12),
  shadow3xl02: Color(0x0A0A0D12),
  shadowSkeumorphicInner: Color(0x0D0A0D12),
  shadowSkeumorphicInnerBorder: Color(0x2E0A0D12),

// Portfolio Mockup Shadows
  shadowMainCentreMd: Color(0x240A0D12),
  shadowMainCentreLg: Color(0x2E0A0D12),
  shadowOverlayLg: Color(0x1F0A0D12),
  shadowGridMd: Color(0x140A0D12),

// Alpha Colors
  alphaWhite100: Color(0xFFFFFFFF),
);

const appDarkColors = AppModeColorsExtension(
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
  bgPrimary: Color(0xFF12151B),
  bgSecondary: Color(0xFF13161B),
  bgSecondary_hover: Color(0xFF22262F),
  bgTertiary: Color(0xFF22262F),
  bgQuaternary: Color(0xFF373A41),
  bgActive: Color(0xFF22262F),
  bgBrandPrimary: Color(0xFF6F3AB1),
  bgBrandPrimaryAlt: Color(0xFF12151B),
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
  fgPrimary: Color(0xFFFFFFFF),
  fgSecondary: Color(0xFFCECFD2),
  fgTertiary: Color(0xFF94979C),
  fgQuaternary: Color(0xFF61656C),
  fgQuaternary_hover: Color(0xFF85888E),
  fgDisabled: Color(0xFF85888E),
  fgDisabledSubtle: Color(0xFF61646C),
  fgWhite: Color(0xFFFFFFFF),
  fgBrandPrimary: Color(0xFF6F3AB1),
  fgBrandSecondary: Color(0xFF6F3AB1),
  fgErrorPrimary: Color(0xFFF04438),
  fgErrorSecondary: Color(0xFFF97066),
  fgWarningPrimary: Color(0xFFF79009),
  fgWarningSecondary: Color(0xFFFDB022),
  fgSuccessPrimary: Color(0xFF17B26A),
  fgSuccessSecondary: Color(0xFF47CD89),
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
  utilityBlue50: Color(0xFF0A1A2F),
  utilityBlue100: Color(0xFF0F2442),
  utilityBlue200: Color(0xFF1E3A8A),
  utilityBlue300: Color(0xFF3B82F6),
  utilityBlue400: Color(0xFF2563EB),
  utilityBlue500: Color(0xFF3B82F6),
  utilityBlue600: Color(0xFF60A5FA),
  utilityBlue700: Color(0xFF93C5FD),
  utilityBrand50: Color(0xFF181D27),
  utilityBrand100: Color(0xFF22262F),
  utilityBrand200: Color(0xFF373A41),
  utilityBrand300: Color(0xFF8E57C1),
  utilityBrand400: Color(0xFF6F3AB1),
  utilityBrand500: Color(0xFF5F2F9D),
  utilityBrand600: Color(0xFF9966CA),
  utilityBrand700: Color(0xFFAF87D5),
  utilityBrand800: Color(0xFFC5A8E0),
  utilityBrand900: Color(0xFFDAC9EB),
  utilityBrand50Alt: Color(0xFF181D27),
  utilityBrand100Alt: Color(0xFF22262F),
  utilityBrand200Alt: Color(0xFF373A41),
  utilityBrand300Alt: Color(0xFF61656C),
  utilityBrand400Alt: Color(0xFF85888E),
  utilityBrand500Alt: Color(0xFF94979C),
  utilityBrand600Alt: Color(0xFFCECFD2),
  utilityBrand700Alt: Color(0xFFF7F7F7),
  utilityBrand800Alt: Color(0xFFCECFD2),
  utilityBrand900Alt: Color(0xFFF7F7F7),
  utilityGray50: Color(0xFF12151B),
  utilityGray100: Color(0xFF13161B),
  utilityGray200: Color(0xFF22262F),
  utilityGray300: Color(0xFF22262F),
  utilityGray400: Color(0xFF373A41),
  utilityGray500: Color(0xFF61656C),
  utilityGray600: Color(0xFF85888E),
  utilityGray700: Color(0xFF94979C),
  utilityGray800: Color(0xFFCECFD2),
  utilityGray900: Color(0xFFF7F7F7),
  utilityError50: Color(0xFF2A0D07),
  utilityError100: Color(0xFF3A1109),
  utilityError200: Color(0xFF55160C),
  utilityError300: Color(0xFFF04438),
  utilityError400: Color(0xFFD92D20),
  utilityError500: Color(0xFFF04438),
  utilityError600: Color(0xFFF97066),
  utilityError700: Color(0xFFFDA29B),
  utilityWarning50: Color(0xFF271104),
  utilityWarning100: Color(0xFF351507),
  utilityWarning200: Color(0xFF4E1D09),
  utilityWarning300: Color(0xFFF79009),
  utilityWarning400: Color(0xFFDC6803),
  utilityWarning500: Color(0xFFF79009),
  utilityWarning600: Color(0xFFFDB022),
  utilityWarning700: Color(0xFFFEC84B),
  utilitySuccess50: Color(0xFF022C1C),
  utilitySuccess100: Color(0xFF043924),
  utilitySuccess200: Color(0xFF053321),
  utilitySuccess300: Color(0xFF17B26A),
  utilitySuccess400: Color(0xFF079455),
  utilitySuccess500: Color(0xFF17B26A),
  utilitySuccess600: Color(0xFF47CD89),
  utilitySuccess700: Color(0xFF75E0A7),
  utilityOrange50: Color(0xFF2A1003),
  utilityOrange100: Color(0xFF3A1604),
  utilityOrange200: Color(0xFF552006),
  utilityOrange300: Color(0xFFFF751A),
  utilityOrange400: Color(0xFFE65C00),
  utilityOrange500: Color(0xFFFF751A),
  utilityOrange600: Color(0xFFFF944D),
  utilityOrange700: Color(0xFFFFB380),
  utilityBlueDark50: Color(0xFF001133),
  utilityBlueDark100: Color(0xFF001A4D),
  utilityBlueDark200: Color(0xFF003366),
  utilityBlueDark300: Color(0xFF0066FF),
  utilityBlueDark400: Color(0xFF0052CC),
  utilityBlueDark500: Color(0xFF0066FF),
  utilityBlueDark600: Color(0xFF3385FF),
  utilityBlueDark700: Color(0xFF66A3FF),
  utilityIndigo50: Color(0xFF1A1B3D),
  utilityIndigo100: Color(0xFF25265A),
  utilityIndigo200: Color(0xFF3738A6),
  utilityIndigo300: Color(0xFF6366F1),
  utilityIndigo400: Color(0xFF4F46E5),
  utilityIndigo500: Color(0xFF6366F1),
  utilityIndigo600: Color(0xFF818CF8),
  utilityIndigo700: Color(0xFFA5B4FC),
  utilityFuchsia50: Color(0xFF2D0A33),
  utilityFuchsia100: Color(0xFF3D0E44),
  utilityFuchsia200: Color(0xFF5A1466),
  utilityFuchsia300: Color(0xFFD946EF),
  utilityFuchsia400: Color(0xFFC026D3),
  utilityFuchsia500: Color(0xFFD946EF),
  utilityFuchsia600: Color(0xFFE879F9),
  utilityFuchsia700: Color(0xFFF0ABFC),
  utilityPink50: Color(0xFF2D0719),
  utilityPink100: Color(0xFF3D0A22),
  utilityPink200: Color(0xFF5A0E33),
  utilityPink300: Color(0xFFEC4899),
  utilityPink400: Color(0xFFDB2777),
  utilityPink500: Color(0xFFEC4899),
  utilityPink600: Color(0xFFF472B6),
  utilityPink700: Color(0xFFF9A8D4),
  utilityPurple50: Color(0xFF1A0B2D),
  utilityPurple100: Color(0xFF250F3D),
  utilityPurple200: Color(0xFF37155A),
  utilityPurple300: Color(0xFFA855F7),
  utilityPurple400: Color(0xFF9333EA),
  utilityPurple500: Color(0xFFA855F7),
  utilityPurple600: Color(0xFFC084FC),
  utilityPurple700: Color(0xFFD8B4FE),
  utilityOrangeDark50: Color(0xFF2A1000),
  utilityOrangeDark100: Color(0xFF3A1600),
  utilityOrangeDark200: Color(0xFF552000),
  utilityOrangeDark300: Color(0xFFF97316),
  utilityOrangeDark400: Color(0xFFEA580C),
  utilityOrangeDark500: Color(0xFFF97316),
  utilityOrangeDark600: Color(0xFFFB923C),
  utilityOrangeDark700: Color(0xFFFDBA74),
  utilityBlueLight50: Color(0xFF022235),
  utilityBlueLight100: Color(0xFF033047),
  utilityBlueLight200: Color(0xFF05456A),
  utilityBlueLight300: Color(0xFF0EA5E9),
  utilityBlueLight400: Color(0xFF0284C7),
  utilityBlueLight500: Color(0xFF0EA5E9),
  utilityBlueLight600: Color(0xFF38BDF8),
  utilityBlueLight700: Color(0xFF7DD3FC),
  utilityGrayBlue50: Color(0xFF0F172A),
  utilityGrayBlue100: Color(0xFF1E293B),
  utilityGrayBlue200: Color(0xFF334155),
  utilityGrayBlue300: Color(0xFF64748B),
  utilityGrayBlue400: Color(0xFF475569),
  utilityGrayBlue500: Color(0xFF64748B),
  utilityGrayBlue600: Color(0xFF94A3B8),
  utilityGrayBlue700: Color(0xFFCBD5E1),
  utilityGreen50: Color(0xFF022C15),
  utilityGreen100: Color(0xFF043D1D),
  utilityGreen200: Color(0xFF055428),
  utilityGreen300: Color(0xFF22C55E),
  utilityGreen400: Color(0xFF16A34A),
  utilityGreen500: Color(0xFF22C55E),
  utilityGreen600: Color(0xFF4ADE80),
  utilityGreen700: Color(0xFF86EFAC),
  utilityYellow50: Color(0xFF2D2800),
  utilityYellow100: Color(0xFF3D3500),
  utilityYellow200: Color(0xFF5A4D00),
  utilityYellow300: Color(0xFFEAB308),
  utilityYellow400: Color(0xFFCA8A04),
  utilityYellow500: Color(0xFFEAB308),
  utilityYellow600: Color(0xFFFACC15),
  utilityYellow700: Color(0xFFFDE047),
  tooltipSupportingText: Color(0xFF22262F),
  textEditorIconFg: Color(0xFF85888E),
  textEditorIconFgActive: Color(0xFFFFFFFF),
  featuredIconLightFgBrand: Color(0xFFC5A8E0),
  featuredIconLightFgGray: Color(0xFFCECFD2),
  featuredIconLightFgError: Color(0xFFFECDCA),
  featuredIconLightFgWarning: Color(0xFFFEDF89),
  featuredIconLightFgSuccess: Color(0xFFABEFC6),
  iconFgBrand: Color(0xFF85888E),
  iconFgBrandOnBrand: Color(0xFF85888E),
  sliderHandleBorder: Color(0xFF12151B),
  sliderHandleBg: Color(0xFF6F3AB1),
  screenMockupBorder: Color(0xFF22262F),
  footerButtonFg: Color(0xFFCECFD2),
  footerButtonFgHover: Color(0xFFF7F7F7),
  appStoreBadgeBorder: Color(0xFFFFFFFF),
  toggleButtonFgDisabled: Color(0xFF373A41),
  toggleBorder: Colors.transparent,
  toggleSlimBorderPressed: Colors.transparent,
  toggleSlimBorderPressedHover: Colors.transparent,
  avatarStylesBgNeutral: Color(0xFFE0E0E0),
  buttonPrimaryIcon: Color(0xFFAF87D5),
  buttonPrimaryIconHover: Color(0xFFC5A8E0),
  buttonDestructivePrimaryIcon: Color(0xFFFDA29B),
  buttonDestructivePrimaryIconHover: Color(0xFFFECDCA),
  // Add these missing colors to your appDarkColors:

// Text Colors
  textSecondaryHover: Color(0xFFCECFD2), // Gray.200 equivalent
  textTertiaryHover: Color(0xFFCECFD2), // Gray.300 equivalent
  textPrimaryOnBrand: Color(0xFFF7F7F7), // Gray.50 equivalent
  textSecondaryOnBrand: Color(0xFFCECFD2), // Gray.300 equivalent
  textTertiaryOnBrand: Color(0xFF85888E), // Gray.400 equivalent
  textQuaternaryOnBrand: Color(0xFF85888E), // Gray.400 equivalent
  textBrandSecondaryHover: Color(0xFFCECFD2), // Gray.200 equivalent
  textErrorPrimaryHover: Color(0xFFFDA29B), // Error.300 equivalent

// Background Colors
  bgSecondarySolid: Color(0xFF61656C), // Gray.600 equivalent
  bgPrimaryHover: Color(0xFF22262F), // Gray.800 equivalent
  bgPrimaryAlt: Color(0xFF13161B), // bg-secondary equivalent
  bgSecondaryAlt: Color(0xFF12151B), // bg-primary equivalent
  bgSecondarySubtle: Color(0xFF13161B), // Gray.900 equivalent
  bgBrandSection: Color(0xFF13161B), // bg-secondary equivalent
  bgBrandSectionSubtle: Color(0xFF12151B), // bg-primary equivalent
  bgPrimarySolid: Color(0xFF13161B), // bg-secondary equivalent

// Foreground Colors
  fgBrandSecondaryAlt: Color(0xFF61656C), // Gray.600 equivalent
  fgBrandSecondaryHover: Color(0xFF85888E), // Gray.500 equivalent
  fgBrandPrimaryAlt: Color(0xFFCECFD2), // Gray.300 equivalent

  fgSecondaryHover: Color(0xFFCECFD2),
  fgTertiaryHover: Color(0xFFCECFD2),

// Shadow Colors (mostly transparent in dark mode)
  shadowXs: Colors.transparent,
  shadowSm01: Colors.transparent,
  shadowSm02: Colors.transparent,
  shadowMd01: Colors.transparent,
  shadowMd02: Colors.transparent,
  shadowLg01: Colors.transparent,
  shadowLg02: Colors.transparent,
  shadowLg03: Colors.transparent,
  shadowXl01: Colors.transparent,
  shadowXl02: Colors.transparent,
  shadowXl03: Colors.transparent,
  shadow2xl01: Colors.transparent,
  shadow2xl02: Colors.transparent,
  shadow3xl01: Colors.transparent,
  shadow3xl02: Colors.transparent,
  shadowSkeumorphicInner: Color(0x0D0C0E12),
  shadowSkeumorphicInnerBorder: Color(0x2E0C0E12),

// Portfolio Mockup Shadows (transparent in dark mode)
  shadowMainCentreMd: Colors.transparent,
  shadowMainCentreLg: Colors.transparent,
  shadowOverlayLg: Colors.transparent,
  shadowGridMd: Colors.transparent,

// Alpha Colors (with dark mode values)
  alphaWhite100: Color(0xFF12151B), // Gray.950 equivalent
);

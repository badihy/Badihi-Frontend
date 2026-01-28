import 'package:badihy/presentation/screens/splash_screen.dart';
import 'package:badihy/core/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void main() async {
  runApp(const Badihi());
}

class Badihi extends StatelessWidget {
  const Badihi({super.key});
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        // Font family used in the app
        theme: lightMode,
        darkTheme: darkMode,

        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        // For making the app in Arabic
        title: 'بديهي بالعربى',
        locale: Locale('ar'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar'),
          Locale('en'),
        ],
        home: SplashScreen(),
      ),
    );
  }
}

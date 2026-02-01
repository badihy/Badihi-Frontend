import 'dart:developer';

import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/dio_consumer.dart';
import 'package:badihi/cubit/auth/forget_password_cubit.dart';
import 'package:badihi/cubit/auth/login_cubit.dart';
import 'package:badihi/cubit/auth/register_cubit.dart';
import 'package:badihi/core/services/firebase_options.dart';
import 'package:badihi/presentation/screens/splash_screen.dart';
import 'package:badihi/core/theme/theme.dart';
import 'package:badihi/presentation/screens/reset_password_page.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void main() async {
  // Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Badihi());
}

class Badihi extends StatelessWidget {
  const Badihi({super.key});
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MultiBlocProvider(
        providers: [
          RepositoryProvider<ApiConsumer>(
            create: (context) => DioConsumer(dio: Dio()), // Create ApiConsumer first
          ),
          BlocProvider(
            create: (context) => LoginCubit(context.read<ApiConsumer>()), // Pass ApiConsumer to UserCubit
          ),
          BlocProvider(
            create: (context) => RegisterCubit(context.read<ApiConsumer>()), // Pass ApiConsumer to UserCubit
          ),
          BlocProvider(
            create: (context) =>
                ForgetPasswordCubit(context.read<ApiConsumer>()), // Pass ApiConsumer to UserCubit
          ),
        ],
        child: MaterialApp(
          // App Routes
          // routes: {
          //   '/https://api.badihy.com/reset-password?token=4b985b42ebc194ff6963ea73f55630f99ac153d8': (context) => const ResetPasswordPage(
          //         token: "undefined",
          //       ),
          // },

          // Use onGenerateRoute for dynamic deep links
          onGenerateRoute: (settings) {
            // Parse the route name as a URI
            final uri = Uri.parse(settings.name ?? '');
            log('Generating route for URI: $uri');
            log('Generating route for URI Path: ${uri.path}');

            // Check if path matches reset-password
            if (uri.path == '/https://api.badihy.com/reset-password') {
              log('Here');
              // Extract the token from query parameters
              final token = uri.queryParameters['token'] ?? 'undefined';
              log('Token: $token');

              return CupertinoPageRoute(
                builder: (_) => ResetPasswordPage(token: token),
              );
            }

            // Fallback for other routes
            return CupertinoPageRoute(
              builder: (_) => const Scaffold(
                body: Center(child: Text('Page not found')),
              ),
            );
          },

          // Font family used in the app
          theme: lightMode,
          darkTheme: darkMode,

          // Remove the debug banner
          debugShowCheckedModeBanner: false,
          // For making the app in Arabic
          title: 'بديهي بالعربى',
          locale: const Locale('ar'),
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: SplashScreen(),
        ),
      ),
    );
  }
}

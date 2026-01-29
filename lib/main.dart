import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/dio_consumer.dart';
import 'package:badihi/cubit/auth/forget_password_cubit.dart';
import 'package:badihi/cubit/auth/login_cubit.dart';
import 'package:badihi/cubit/auth/register_cubit.dart';
import 'package:badihi/presentation/screens/splash_screen.dart';
import 'package:badihi/core/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      ),
    );
  }
}

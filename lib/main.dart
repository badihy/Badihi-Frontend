import 'dart:developer';
import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/dio_consumer.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/cubit/auth/forget_password_cubit.dart';
import 'package:badihi/cubit/auth/login_cubit.dart';
import 'package:badihi/cubit/auth/refresh_token_cubit.dart';
import 'package:badihi/cubit/auth/register_cubit.dart';
import 'package:badihi/core/services/firebase_options.dart';
import 'package:badihi/cubit/bookmark/add_to_bookmarks_cubit.dart';
import 'package:badihi/cubit/bookmark/delete_bookmark_cubit.dart';
import 'package:badihi/cubit/bookmark/get_all_bookmarks_cubit.dart';
import 'package:badihi/cubit/categories/get_all_categories_cubit.dart';
import 'package:badihi/cubit/courses/enroll_user_in_a_course_cubit.dart';
import 'package:badihi/cubit/courses/get_all_courses_cubit.dart';
import 'package:badihi/cubit/courses/get_course_by_id_cubit.dart';
import 'package:badihi/cubit/reports/report_problem_cubit.dart';
import 'package:badihi/cubit/theme/theme_cubit.dart';
import 'package:badihi/cubit/theme/theme_state.dart';
import 'package:badihi/cubit/users/delete_user_cubit.dart';
import 'package:badihi/cubit/users/update_user_cubit.dart';
import 'package:badihi/presentation/screens/home_controller.dart';
import 'package:badihi/core/theme/theme.dart';
import 'package:badihi/presentation/screens/reset_password_page.dart';
import 'package:badihi/presentation/screens/splash_screen.dart';
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

  setupServiceLocator();
  await getIt<CacheHelper>().init();

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
            create: (context) => DioConsumer(dio: Dio()),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => ForgetPasswordCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => UpdateUserCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => DeleteUserCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => GetAllCoursesCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => GetAllCategoriesCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => GetCourseByIdCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => AddToBookmarksCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => GetAllBookmarksCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => DeleteBookmarkCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => ReportProblemCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => EnrollUserInACourseCubit(context.read<ApiConsumer>()),
          ),
          BlocProvider(
            create: (context) => RefreshTokenCubit(context.read<ApiConsumer>()),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              theme: lightMode,
              darkTheme: darkMode,
              themeMode: ThemeCubit.get(context).getTheme(),

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
              home: getIt<CacheHelper>().getString("token") != null ? HomeController() : SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}

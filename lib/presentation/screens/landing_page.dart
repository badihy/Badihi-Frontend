import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/auth/google_auth_cubit.dart';
import 'package:badihi/presentation/components/custom_circular_progress_indicator.dart';
import 'package:badihi/presentation/components/google_sign_in_button.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/components/secondary_button.dart';
import 'package:badihi/presentation/components/text_button.dart';
import 'package:badihi/presentation/screens/home_controller.dart';
import 'package:badihi/presentation/screens/login_page.dart';
import 'package:badihi/presentation/screens/privacy_policy_page.dart';
import 'package:badihi/presentation/screens/register_page.dart';
import 'package:badihi/presentation/screens/terms_and_conditions_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GoogleAuthCubit, GoogleAuthState>(
        listener: (context, state) {
          if (state is GoogleAuthSuccess) {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (_) => HomeController()),
            );
          } else if (state is GoogleAuthFailure) {
            showToast(context: context, message: state.errMessage, isError: true);
          }
        },
        child: Container(
          margin:
              const EdgeInsets.symmetric(vertical: AppSpacing.spacing4XL, horizontal: AppSpacing.spacing2XL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo2.svg',
                        width: 64,
                        height: 64,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.spacing5XL),
                  Text(
                    'تعلم بالقراءة، بشكل بديهي',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: context.appColors.textPrimary,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      height: 1.40,
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacingXL),
                  Text(
                    'نقدم محتوى تعليميًا على شكل شرائح موجزة تشرح المفاهيم خطوة بخطوة.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: context.appColors.textSecondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.56,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    textDirection: TextDirection.rtl,
                    spacing: 4, // space between items
                    children: [
                      Text(
                        'بإنشائك للحساب فإنك توافق على',
                        style: TextStyle(
                          color: context.appColors.textTertiary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => TermsAndConditionsPage(),
                            ),
                          );
                        },
                        child: Text(
                          'الشروط والأحكام',
                          style: TextStyle(
                            color: context.appColors.textBrandSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            height: 1.75,
                          ),
                        ),
                      ),
                      Text(
                        'و',
                        style: TextStyle(
                          color: context.appColors.textTertiary,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => PrivacyPolicyPage(),
                            ),
                          );
                        },
                        child: Text(
                          'سياسة الخصوصية',
                          style: TextStyle(
                            color: context.appColors.textBrandSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            height: 1.75,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.spacingLG),
                  BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
                    builder: (context, state) {
                      return state is GoogleAuthLoading
                          ? Center(
                              child: CustomCircularProgressIndicator(),
                            )
                          : GoogleSignInButton();
                    },
                  ),
                  SizedBox(height: AppSpacing.spacingLG),
                  SecondaryButton(
                    text: "إنشاء حساب جديد",
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return RegisterPage();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppSpacing.spacingLG),
                  TextBtn(
                    btnText: "تسجيل الدخول إلى حسابك",
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return LoginPage();
                          },
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

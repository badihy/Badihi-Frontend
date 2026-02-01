import 'package:badihi/core/extensions/app_mode_colors_extension.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/auth/google_auth.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/components/secondary_button.dart';
import 'package:badihi/presentation/components/text_button.dart';
import 'package:badihi/presentation/screens/login_page.dart';
import 'package:badihi/presentation/screens/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _isLoading = false;
  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final userCredentials = await GoogleSignInService.signInWithGoogle();
      if (!mounted) return;
      if (userCredentials != null) {
        if (!mounted) return;
        print('Google Sign-In successful: ${userCredentials.user?.displayName}');
      }
    } catch (error) {
      if (!mounted) return;
      showToast(context: context, message: "خطأ في تسجيل الدخول باستخدام جوجل");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>();
    return Scaffold(
      body: Container(
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
                      width: 48,
                      height: 48,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'بديهي',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colors!.textBrandTertiary,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        height: 1.20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.spacing5XL),
                Text(
                  'تعلم بالقراءة، بشكل بديهي',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.textPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    height: 1.27,
                  ),
                ),
                SizedBox(height: AppSpacing.spacingXL),
                Text(
                  'نقدم محتوى تعليميًا على شكل شرائح موجزة تشرح المفاهيم خطوة بخطوة.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.textSecondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.56,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _isLoading
                    ? CircularProgressIndicator(
                        color: colors.fgBrandPrimary,
                      )
                    : MainButton(
                        text: "تسجيل الدخول باستخدام جوجل",
                        onTap: _signInWithGoogle,
                        svgPath: "assets/images/googleIcon.svg",
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
    );
  }
}

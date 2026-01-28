import 'package:badihy/core/extensions/extensions.dart';
import 'package:badihy/core/theme/app_tokens.dart';
import 'package:badihy/presentation/components/custom_app_bar.dart';
import 'package:badihy/presentation/components/custom_text_form_field.dart';
import 'package:badihy/presentation/components/main_button.dart';
import 'package:badihy/presentation/components/or_divider.dart';
import 'package:badihy/presentation/components/secondary_button.dart';
import 'package:badihy/presentation/components/text_button.dart';
import 'package:badihy/presentation/components/titles_text.dart';
import 'package:badihy/presentation/screens/foget_password_page.dart';
import 'package:badihy/presentation/screens/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  double _keyboardHeight = 0;
  final GlobalKey<FormState> signInFormKey = GlobalKey();
  final TextEditingController signInEmail = TextEditingController();
  final TextEditingController signInPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      _keyboardHeight = bottomInset / MediaQuery.of(context).devicePixelRatio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        appBarTitle: 'تسجيل الدخول إلى حسابك',
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(
                AppSpacing.spacing2XL,
                AppSpacing.spacing2XL,
                AppSpacing.spacing2XL,
                AppSpacing.spacing4XL,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitlesText(
                    text: 'أدخل بريدك الإلكتروني وكلمة المرور لتسجيل الدخول إلى حسابك',
                    IsL_M_S: "L",
                  ),
                  SizedBox(height: AppSpacing.spacingXL),
                  Form(
                    key: signInFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          controller: signInEmail,
                          labelText: 'البريد الإلكتروني*',
                          placeholderText: "example@badihi.com",
                          prefixIcon: "assets/images/icons/mail-01.svg",
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'برجاء إدخال البريد الإلكتروني';
                            }
                            if (!value.isValidEmail) {
                              return 'تأكد من إدخال بريد إلكتروني صحيح';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppSpacing.spacingXL),
                        CustomTextFormField(
                          controller: signInPassword,
                          labelText: 'كلمة المرور*',
                          placeholderText: "",
                          prefixIcon: "assets/images/icons/passcode-lock.svg",
                          isPasswordField: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'برجاء إدخال كلمة المرور';
                            }
                            if (!value.isValidPassword) {
                              return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacingSM),
                  TextBtn(
                    btnText: "هل نسيت كلمة المرور؟",
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return FogetPasswordPage();
                          },
                        ),
                      );
                    },
                    isLight: true,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitlesText(text: "ليس لديك حساب؟ ", IsL_M_S: "M"),
                      TextBtn(
                        btnText: "تسجيل حساب جديد",
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
                    ],
                  ),
                  SizedBox(height: AppSpacing.spacingLG),
                  OrDivider(),
                  SizedBox(height: AppSpacing.spacingLG),
                  SecondaryButton(
                    text: "تسجيل الدخول باستخدام جوجل",
                    onTap: () {},
                    svgPath: "assets/images/googleIcon.svg",
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              left: AppSpacing.spacing2XL,
              right: AppSpacing.spacing2XL,
              bottom: _keyboardHeight > 0 ? _keyboardHeight + AppSpacing.spacingLG : 175,
              child: MainButton(
                text: "تسجيل الدخول",
                onTap: () {
                  if (signInFormKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is valid!')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

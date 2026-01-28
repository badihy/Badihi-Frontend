import 'package:badihy/core/extensions/app_mode_colors_extension.dart';
import 'package:badihy/core/extensions/extensions.dart';
import 'package:badihy/core/theme/app_tokens.dart';
import 'package:badihy/presentation/components/custom_app_bar.dart';
import 'package:badihy/presentation/components/custom_text_form_field.dart';
import 'package:badihy/presentation/components/main_button.dart';
import 'package:badihy/presentation/components/or_divider.dart';
import 'package:badihy/presentation/components/secondary_button.dart';
import 'package:badihy/presentation/components/text_button.dart';
import 'package:badihy/presentation/components/titles_text.dart';
import 'package:badihy/presentation/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>();
    GlobalKey<FormState> registerFormKey = GlobalKey();
    TextEditingController registerName = TextEditingController();
    TextEditingController registerEmail = TextEditingController();
    TextEditingController registerPassword = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        appBarTitle: 'إنشاء حساب جديد',
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
                    text: 'أدخل بياناتك لإتمام إنشاء الحساب',
                    IsL_M_S: "L",
                  ),
                  SizedBox(height: AppSpacing.spacingXL),
                  Form(
                    key: registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          controller: registerName,
                          labelText: 'الاسم *',
                          placeholderText: "اكتب اسمك",
                          prefixIcon: "assets/images/icons/user-01.svg",
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'برجاء إدخال الاسم';
                            }
                            if (!value.isValidName) {
                              return 'تأكد من إدخال إسم صحيح';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppSpacing.spacingXL),
                        CustomTextFormField(
                          controller: registerEmail,
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
                          controller: registerPassword,
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
                  Text(
                    'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل',
                    style: TextStyle(
                      color: colors!.textTertiary /* Colors-Text-text-tertiary_hover */,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.43,
                    ),
                  ),
                  const Spacer(),
                  MainButton(
                    text: 'إنشاء الحساب',
                    onTap: () {
                      if (registerFormKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form is valid!')),
                        );
                      }
                    },
                  ),
                  SizedBox(height: AppSpacing.spacingLG),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitlesText(text: "لديك حساب بالفعل؟ ", IsL_M_S: "M"),
                      TextBtn(
                        btnText: 'سجّل الدخول',
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
          ],
        ),
      ),
    );
  }
}

import 'package:badihy/core/extensions/app_mode_colors_extension.dart';
import 'package:badihy/core/extensions/extensions.dart';
import 'package:badihy/core/theme/app_tokens.dart';
import 'package:badihy/presentation/components/custom_app_bar.dart';
import 'package:badihy/presentation/components/custom_text_form_field.dart';
import 'package:badihy/presentation/components/main_button.dart';
import 'package:badihy/presentation/components/titles_text.dart';
import 'package:badihy/presentation/screens/restore_password_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class FogetPasswordPage extends StatelessWidget {
  const FogetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>();
    GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();
    TextEditingController forgetPasswordEmail = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "استعادة كلمة المرور",
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            AppSpacing.spacing2XL,
            AppSpacing.spacing2XL,
            AppSpacing.spacing2XL,
            AppSpacing.spacing4XL,
          ),
          child: GestureDetector(
            child: Column(
              children: [
                TitlesText(
                    text: "أدخل بريدك الإلكتروني وسنرسل لك رابط التحقق لإعادة تعيين كلمة المرور",
                    IsL_M_S: "L"),
                SizedBox(height: AppSpacing.spacingXL),
                Form(
                  key: forgetPasswordFormKey,
                  child: CustomTextFormField(
                    controller: forgetPasswordEmail,
                    labelText: "البريد الإلكتروني*",
                    placeholderText: "example@badihi.com",
                    prefixIcon: "assets/images/icons/mail-01.svg",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'برجاء إدخال البريد الإلكتروني';
                      }
                      if (!value.isValidEmail) {
                        return 'البريد الإلكتروني غير مسجل';
                      }
                      return null;
                    },
                  ),
                ),
                Spacer(),
                MainButton(
                    text: "التالي",
                    onTap: () {
                      toastification.show(
                        context: context,
                        type: ToastificationType.success,
                        style: ToastificationStyle.flat,
                        backgroundColor: colors!.bgPrimary,
                        title: Text(
                          'أرسلنا رابط استعادة كلمة المرور إلى بريدك الإلكتروني. افتح الرابط لإعادة تعيين كلمة المرور.',
                          style: TextStyle(
                            color: colors.fgPrimary /* Colors-Foreground-fg-primary-(900) */,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.43,
                          ),
                        ),
                        alignment: Alignment.topCenter,
                        borderSide: BorderSide(color: colors.borderSecondaryAlt),
                        borderRadius: BorderRadius.circular(12),
                        icon: Icon(
                          Icons.check,
                          weight: 900,
                        ),
                        closeButton: ToastCloseButton(
                          buttonBuilder: (context, closeToast) {
                            return IconButton(
                              icon: Icon(
                                Icons.close,
                                color: colors.fgQuaternary,
                                size: 20,
                              ),
                              onPressed: closeToast,
                            );
                          },
                        ),
                        padding: EdgeInsets.all(AppSpacing.spacingXL),
                        dragToClose: true,
                      );

                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return RestorePasswordPage();
                          },
                        ),
                      );

                      // if (_formKey.currentState!.validate()) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Form is valid!')),
                      //   );
                      // }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

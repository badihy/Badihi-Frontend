import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/auth/forget_password_cubit.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/custom_text_form_field.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  final String token;
  const ResetPasswordPage({super.key, required this.token});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> resetPasswordFormKey = GlobalKey();
    TextEditingController resetPasswordPassword = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "إنشاء كلمة مرور جديدة",
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              showToast(
                  context: context,
                  message:
                      "تم تحديث كلمة المرور بنجاح، يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة");
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) {
                    return LoginPage();
                  },
                ),
              );
            } else if (state is ResetPasswordFailure) {
              showToast(
                context: context,
                message: state.errMessage,
                isError: true,
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(
              AppSpacing.spacing2XL,
              AppSpacing.spacing2XL,
              AppSpacing.spacing2XL,
              AppSpacing.spacing4XL,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: resetPasswordFormKey,
                  child: CustomTextFormField(
                    controller: resetPasswordPassword,
                    labelText: "كلمة المرور الجديدة*",
                    placeholderText: "",
                    prefixIcon: "passcode-lock",
                    isPasswordField: true,
                    fieldname: 'password',
                  ),
                ),
                SizedBox(height: AppSpacing.spacingSM),
                Text(
                  'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل',
                  style: TextStyle(
                    color: context.appColors.textTertiary /* Colors-Text-text-tertiary_hover */,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.43,
                  ),
                ),
                Spacer(),
                MainButton(
                    text: "تأكيد كلمة المرور الجديدة",
                    isLoading: _isLoading,
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 2));

                      setState(() => _isLoading = false);
                      if (resetPasswordFormKey.currentState!.validate()) {
                        context.read<ForgetPasswordCubit>().resetPassword(
                              token: widget.token,
                              newPassword: resetPasswordPassword.text,
                              confirmNewPassword: resetPasswordPassword.text,
                            );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

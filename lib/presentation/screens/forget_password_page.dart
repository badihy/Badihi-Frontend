import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/auth/forget_password_cubit.dart';
import 'package:badihi/cubit/auth/register_cubit.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/custom_text_form_field.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/components/titles_text.dart';
import 'package:badihi/presentation/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool _isLoading = false;
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();
  TextEditingController forgetPasswordEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "استعادة كلمة المرور",
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            setState(() {
              _isLoading = false;
            });
            if (state is ForgetPasswordSuccess) {
              forgetPasswordEmail.clear();
              showToast(
                  context: context,
                  message:
                      "أرسلنا رابط استعادة كلمة المرور إلى بريدك الإلكتروني. افتح الرابط لإعادة تعيين كلمة المرور.");
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (_) => LoginPage()),
              );
            } else if (state is ForgetPasswordFailure) {
              forgetPasswordFormKey.currentState!.validate();
            } else if (state is ForgetPasswordLoading) {
              setState(() {
                _isLoading = true;
              });
            }
          },
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
                      fieldname: "email",
                    ),
                  ),
                  Spacer(),
                  MainButton(
                    text: "التالي",
                    isLoading: _isLoading,
                    onTap: () {
                      // Restore states to defaults
                      context.read<RegisterCubit>().reset();
                      context.read<ForgetPasswordCubit>().reset();
                      if (forgetPasswordFormKey.currentState!.validate()) {
                        context.read<ForgetPasswordCubit>().forgetPassword(
                              forgetPasswordEmail: forgetPasswordEmail.text,
                            );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

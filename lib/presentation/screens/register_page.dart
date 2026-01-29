import 'package:badihi/core/extensions/app_mode_colors_extension.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/auth/forget_password_cubit.dart';
import 'package:badihi/cubit/auth/register_cubit.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/custom_text_form_field.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/or_divider.dart';
import 'package:badihi/presentation/components/secondary_button.dart';
import 'package:badihi/presentation/components/text_button.dart';
import 'package:badihi/presentation/components/titles_text.dart';
import 'package:badihi/presentation/screens/home_page.dart';
import 'package:badihi/presentation/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  GlobalKey<FormState> registerFormKey = GlobalKey();
  TextEditingController registerFullName = TextEditingController();
  TextEditingController registerEmail = TextEditingController();
  TextEditingController registerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        appBarTitle: 'إنشاء حساب جديد',
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            setState(() {
              _isLoading = false;
            });
            if (state is RegisterSuccess) {
              registerFormKey.currentState?.reset();
              registerFullName.clear();
              registerEmail.clear();
              registerPassword.clear();
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (_) => HomePage()),
              );
            } else if (state is RegisterFailure) {
              registerFormKey.currentState!.validate();
            } else if (state is RegisterLoading) {
              setState(() {
                _isLoading = true;
              });
            }
          },
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
                            controller: registerFullName,
                            labelText: 'الاسم *',
                            placeholderText: "اكتب اسمك",
                            prefixIcon: "assets/images/icons/user-01.svg",
                            fieldname: 'name',
                          ),
                          SizedBox(height: AppSpacing.spacingXL),
                          CustomTextFormField(
                            controller: registerEmail,
                            labelText: 'البريد الإلكتروني*',
                            placeholderText: "example@badihi.com",
                            prefixIcon: "assets/images/icons/mail-01.svg",
                            fieldname: 'email',
                          ),
                          SizedBox(height: AppSpacing.spacingXL),
                          CustomTextFormField(
                            controller: registerPassword,
                            labelText: 'كلمة المرور*',
                            placeholderText: "",
                            prefixIcon: "assets/images/icons/passcode-lock.svg",
                            isPasswordField: true,
                            fieldname: 'password',
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
                      isLoading: _isLoading,
                      onTap: () {
                        // Restore states to defaults
                        context.read<RegisterCubit>().reset();
                        context.read<ForgetPasswordCubit>().reset();
                        if (registerFormKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          context.read<RegisterCubit>().register(
                                registerFullName: registerFullName.text,
                                registerEmail: registerEmail.text,
                                registerPassword: registerPassword.text,
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
      ),
    );
  }
}

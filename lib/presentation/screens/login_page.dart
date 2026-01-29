import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/auth/login_cubit.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/custom_text_form_field.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/components/or_divider.dart';
import 'package:badihi/presentation/components/secondary_button.dart';
import 'package:badihi/presentation/components/text_button.dart';
import 'package:badihi/presentation/components/titles_text.dart';
import 'package:badihi/presentation/screens/forget_password_page.dart';
import 'package:badihi/presentation/screens/home_page.dart';
import 'package:badihi/presentation/screens/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  double _keyboardHeight = 0;
  bool _isLoading = false;
  final GlobalKey<FormState> signInFormKey = GlobalKey();
  final TextEditingController loginEmail = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();

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
        // Implement login logic
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            setState(() {
              _isLoading = false;
            });
            if (state is LoginSuccess) {
              signInFormKey.currentState?.reset();
              loginEmail.clear();
              loginPassword.clear();
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (_) => HomePage()),
              );
            } else if (state is LoginFailure) {
              showToast(context: context, message: state.errMessage, isError: true);
            } else if (state is LoginLoading) {
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
                            controller: loginEmail,
                            labelText: 'البريد الإلكتروني*',
                            placeholderText: "example@badihi.com",
                            prefixIcon: "assets/images/icons/mail-01.svg",
                            fieldname: 'email',
                          ),
                          SizedBox(height: AppSpacing.spacingXL),
                          CustomTextFormField(
                            controller: loginPassword,
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
                    TextBtn(
                      btnText: "هل نسيت كلمة المرور؟",
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) {
                              return ForgetPasswordPage();
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
                  isLoading: _isLoading,
                  onTap: () {
                    if (signInFormKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      context.read<LoginCubit>().login(
                            loginEmail: loginEmail.text,
                            loginPassword: loginPassword.text,
                          );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

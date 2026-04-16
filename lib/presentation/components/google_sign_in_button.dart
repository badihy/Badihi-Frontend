import 'package:badihi/cubit/auth/google_auth.dart';
import 'package:badihi/cubit/auth/login_cubit.dart';
import 'package:badihi/presentation/components/custom_circular_progress_indicator.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/components/secondary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleSignInButton extends StatefulWidget {
  final bool isPrimary;
  const GoogleSignInButton({super.key, this.isPrimary = true});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isLoading = false;

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final userCredentials = await GoogleSignInService.signInWithGoogle();

      if (!mounted) return;

      if (userCredentials != null) {
        context.read<LoginCubit>().googleAuth(uid: userCredentials.user!.uid);
        if (context.read<LoginCubit>().state is LoginSuccess) {
          // Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //     builder: (_) => HomeController(),
          //   ),
          // );
        } else {}
      }
    } catch (error) {
      if (!mounted) return;
      showToast(
        context: context,
        message: "خطأ في تسجيل الدخول باستخدام جوجل",
        isError: true,
      );
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
    return _isLoading
        ? Center(
            child: CustomCircularProgressIndicator(),
          )
        : widget.isPrimary
            ? MainButton(
                text: "تسجيل الدخول باستخدام جوجل",
                onTap: _signInWithGoogle,
                iconName: "googleIcon",
              )
            : SecondaryButton(
                text: "تسجيل الدخول باستخدام جوجل",
                onTap: _signInWithGoogle,
                iconName: "googleIcon",
              );
  }
}

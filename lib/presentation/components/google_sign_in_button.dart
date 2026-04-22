import 'package:badihi/core/services/google_auth_service.dart';
import 'package:badihi/cubit/auth/google_auth_cubit.dart';
import 'package:badihi/presentation/components/main_button.dart';
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
  Future _signInWithGoogle() async {
    final idToken = await GoogleAuthService.login();

    context.read<GoogleAuthCubit>().googleAuth(idToken: idToken ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return widget.isPrimary
        ? MainButton(
            text: "تسجيل الدخول باستخدام جوجل",
            onTap: () => _signInWithGoogle(),
            iconName: "googleIcon",
          )
        : SecondaryButton(
            text: "تسجيل الدخول باستخدام جوجل",
            onTap: () => _signInWithGoogle(),
            iconName: "googleIcon",
          );
  }
}

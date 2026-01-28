import 'dart:async';

import 'package:badihy/core/theme/app_tokens.dart';
import 'package:badihy/presentation/screens/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (_) => const LandingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(95, 47, 157, 1),
      body: Container(
        margin:
            const EdgeInsets.symmetric(vertical: AppSpacing.spacing4XL, horizontal: AppSpacing.spacing2XL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            SvgPicture.asset(
              'assets/images/logo1.svg',
              width: 96,
              height: 96,
            ),
            const Center(
              child: Text(
                "نسخة تجريبية",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 1.56,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

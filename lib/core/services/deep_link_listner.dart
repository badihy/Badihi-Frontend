import 'dart:developer';
import 'package:app_links/app_links.dart';
import 'package:badihi/presentation/screens/reset_password_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeepLinkListener extends StatefulWidget {
  const DeepLinkListener({super.key, required this.child});
  final Widget child;

  @override
  State<DeepLinkListener> createState() => _DeepLinkListenerState();
}

class _DeepLinkListenerState extends State<DeepLinkListener> {
  @override
  void initState() {
    // TODO: implement initState

    final appLinks = AppLinks(); // AppLinks is singleton

    // Subscribe to all events (initial link and further)
    final sub = appLinks.uriLinkStream.listen((uri) {
      final token = uri.queryParameters['token'];
      log('Received URI: $uri with token: $token');
      log('URI PathSegments: ${uri.pathSegments}');
      if (uri.pathSegments.contains('reset-password') && mounted) {
        log('Here');
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => ResetPasswordPage(token: token ?? "undefined")));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

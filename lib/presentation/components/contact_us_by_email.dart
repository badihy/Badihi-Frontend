import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/components/text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsByEmail extends StatelessWidget {
  final String btnText;
  const ContactUsByEmail({super.key, required this.btnText});

  @override
  Widget build(BuildContext context) {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map(
              (MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    void openEmail(String email) async {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: email,
        query: encodeQueryParameters(<String, String>{
          'subject': 'طلب تغيير البريد الألكترونى',
          'body': 'أكتب محتوى الرسالة هنا',
        }),
      );

      try {
        await launchUrl(emailUri);
      } catch (e) {
        // Could not launch email app
        showToast(context: context, message: "خطأ في التواصل, برجاء المحاوله في وقت لاحق");
      }
    }

    return TextBtn(
      btnText: btnText,
      onTap: () => openEmail('badihy.edu@gmail.com'),
      isLight: true,
    );
  }
}

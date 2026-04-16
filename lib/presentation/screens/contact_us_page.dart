import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/profile_action_link.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "تواصل معنا"),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
              AppSpacing.spacing2XL,
              AppSpacing.spacing3XL,
              AppSpacing.spacing2XL,
              AppSpacing.spacingXL,
            ),
            child: Text(
              'نقدّر تواصلكم ونجيب على استفساراتكم',
              style: TextStyle(
                color: context.appColors.textSecondary /* Colors-Text-text-secondary-(700) */,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.56,
              ),
            ),
          ),
          ProfileActionLink(
            onTap: () {},
            isContactLink: true,
            iconName: "Logo",
            settingTitle: "الموقع الإلكتروني",
            drawDivider: true,
          ),
          ProfileActionLink(
            onTap: () {},
            isContactLink: true,
            iconName: "whatsapp",
            settingTitle: "الواتساب",
            drawDivider: true,
          ),
          ProfileActionLink(
            onTap: () {},
            isContactLink: true,
            iconName: "facebook",
            settingTitle: "الفيسبوك",
            drawDivider: true,
          ),
          ProfileActionLink(
            onTap: () {},
            isContactLink: true,
            iconName: "linkedin",
            settingTitle: "لينكدان",
            drawDivider: true,
          ),
          ProfileActionLink(
            onTap: () {},
            isContactLink: true,
            iconName: "youtube",
            settingTitle: "يوتيوب",
            drawDivider: true,
          ),
          ProfileActionLink(
            onTap: () {},
            isContactLink: true,
            iconName: "tiktok",
            settingTitle: "تيك توك",
            drawDivider: true,
          ),
        ],
      ),
    );
  }
}

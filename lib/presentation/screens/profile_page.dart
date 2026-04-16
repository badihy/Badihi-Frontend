import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/users/update_user_cubit.dart';
import 'package:badihi/cubit/users/upload_profile_photo_cubit.dart';
import 'package:badihi/presentation/components/confirmation_bottom_sheet.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/custom_bottom_sheet.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/components/profile_action_link.dart';
import 'package:badihi/presentation/components/secondary_button.dart';
import 'package:badihi/presentation/components/setting_section_tag.dart';
import 'package:badihi/presentation/screens/FAQ_page.dart';
import 'package:badihi/presentation/screens/contact_us_page.dart';
import 'package:badihi/presentation/screens/login_page.dart';
import 'package:badihi/presentation/screens/privacy_policy_page.dart';
import 'package:badihi/presentation/screens/reporting_problem_page.dart';
import 'package:badihi/presentation/screens/terms_and_conditions_page.dart';
import 'package:badihi/presentation/screens/update_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "الحساب",
        isBasicBar: false,
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: AppSpacing.spacing3XL),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.spacingXL),
              margin: const EdgeInsets.fromLTRB(
                AppSpacing.spacing2XL,
                AppSpacing.spacing2XL,
                AppSpacing.spacing2XL,
                0,
              ),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: context.appColors.borderSecondary /* Colors-Border-border-secondary */,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  BlocBuilder<UploadProfilePhotoCubit, UploadProfilePhotoState>(
                    builder: (context, state) {
                      return Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: context.appColors.fgDisabledSubtle,
                            ),
                            borderRadius: BorderRadius.circular(9999),
                          ),
                        ),
                        child: getIt<CacheHelper>().getString(ApiKey.profileImage) != ""
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  getIt<CacheHelper>().getString(ApiKey.profileImage) ?? "",
                                  width: 65,
                                  height: 65,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(16),
                                child: SvgPicture.asset(
                                  'assets/images/icons/user-01.svg',
                                  width: 35,
                                  height: 35,
                                  colorFilter:
                                      ColorFilter.mode(context.appColors.fgSecondaryHover, BlendMode.srcIn),
                                ),
                              ),
                      );
                    },
                  ),
                  SizedBox(width: AppSpacing.spacingLG),
                  BlocBuilder<UpdateUserCubit, UpdateUserState>(
                    builder: (context, state) {
                      return Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getIt<CacheHelper>().getString(ApiKey.fullName) ?? "اسم المستخدم",
                              style: TextStyle(
                                color: context.appColors.textPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              getIt<CacheHelper>().getString(ApiKey.email) ?? "الإيميل",
                              style: TextStyle(
                                color: context.appColors.textSecondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.spacing3XL),
            SettingSectionTag(sectionTitle: 'إعدادت الحساب'),
            SizedBox(height: AppSpacing.spacingMD),
            ProfileActionLink(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return UpdateProfilePage();
                    },
                  ),
                );
              },
              iconName: "icons/settings-02",
              settingTitle: "تعديل بيانات الحساب",
              drawDivider: true,
            ),
            ProfileActionLink(
              onTap: () {
                showCustomBottomSheet(
                  context,
                  ConfirmationBottomSheet(
                    onConfirm: () {
                      showToast(
                          context: context,
                          message:
                              "أرسلنا رابط تغيير كلمة المرور إلى بريدك الإلكتروني. افتح الرابط لتغييرها.");
                    },
                    iconName: "passcode-lock",
                    titleText: "هل تريد تغيير كلمة المرور؟",
                    subTitleText:
                        "سنرسل لك رسالة على بريدك الإلكتروني diaasalman970@gmail.com تحتوي على خطوات تغيير كلمة المرور.",
                    buttonText1: "لا، إلغاء",
                    buttonText2: "نعم، أريد تغيير كلمة المرور",
                    isMainButton: false,
                    isWarning: false,
                  ),
                );
              },
              iconName: "icons/lock-02",
              settingTitle: "تغيير كلمة المرور",
            ),
            SizedBox(height: AppSpacing.spacingXL),
            SettingSectionTag(sectionTitle: 'إعدادت التطبيق'),
            SizedBox(height: AppSpacing.spacingMD),
            ProfileActionLink(
              onTap: () {},
              iconName: "icons/moon-01",
              settingTitle: 'الوضع الليلي',
              drawDivider: true,
              isDarkModeButton: true,
            ),
            SizedBox(height: AppSpacing.spacingXL),
            SettingSectionTag(sectionTitle: 'اتصل بنا'),
            SizedBox(height: AppSpacing.spacingMD),
            ProfileActionLink(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return ContactUsPage();
                    },
                  ),
                );
              },
              iconName: "icons/phone-call-01",
              settingTitle: 'تواصل معنا',
              drawDivider: true,
            ),
            ProfileActionLink(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return ReportingProblemPage();
                    },
                  ),
                );
              },
              iconName: "icons/message-alert-square",
              settingTitle: "الإبلاغ عن مشكلة",
              drawDivider: true,
            ),
            ProfileActionLink(
              onTap: () {},
              iconName: "icons/star-01",
              settingTitle: 'قيّمنا',
              drawDivider: true,
            ),
            ProfileActionLink(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return FAQPage();
                    },
                  ),
                );
              },
              iconName: "icons/message-question-square",
              settingTitle: 'الأسئلة الشائعة',
              drawDivider: true,
            ),
            ProfileActionLink(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return TermsAndConditionsPage();
                    },
                  ),
                );
              },
              iconName: "icons/file-05",
              settingTitle: 'الشروط والأحكام',
              drawDivider: true,
            ),
            ProfileActionLink(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return PrivacyPolicyPage();
                    },
                  ),
                );
              },
              iconName: "icons/file-shield-02",
              settingTitle: 'سياسة الخصوصية',
            ),
            SizedBox(height: AppSpacing.spacing3XL),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppSpacing.spacing2XL,
                vertical: 0,
              ),
              child: SecondaryButton(
                text: "تسجيل الخروج",
                textColor: context.appColors.textErrorPrimary,
                iconName: "icons/log-out-04",
                iconColor: context.appColors.borderErrorSubtle,
                borderColor: context.appColors.borderErrorSubtle,
                onTap: () {
                  showCustomBottomSheet(
                    context,
                    ConfirmationBottomSheet(
                      onConfirm: () async {
                        // Clear cache data
                        await getIt<CacheHelper>().clearUserData();
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) {
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      iconName: 'log-out-04',
                      titleText: 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
                      subTitleText: 'يمكنك تسجيل الدخول مرة أخرى في أي وقت.',
                      buttonText1: 'لا، إلغاء',
                      buttonText2: 'نعم، تسجيل الخروج',
                      isMainButton: false,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

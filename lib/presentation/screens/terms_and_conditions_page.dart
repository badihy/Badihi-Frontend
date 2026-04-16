import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/terms_and_policies_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> termsAndConditions = {
      "التعريفات": [
        "بديهي: منصة تعليمية تقدم دورات ومحتوى وتقييمات وتفاعلات تعليمية.",
        "المستخدم: كل شخص يقوم بالتسجيل أو التصفح أو استخدام أي جزء من خدمات المنصة.",
        "الخدمة: جميع الميزات التعليمية، المحتوى، الدورات، الأدوات، والتقييمات التي يوفرها بديهي.",
      ],
      "الموافقة على الشروط": [
        "يوافق المستخدم على الالتزام بالشروط والأحكام عند التسجيل أو استخدام التطبيق.",
        "لاستخدام التطبيق، يجب أن يكون المستخدم قد بلغ السن القانوني المسموح.",
      ],
      "إنشاء الحساب": [
        "يجب تقديم معلومات صحيحة وحديثة عند إنشاء الحساب.",
        "المستخدم مسؤول عن الحفاظ على سرية بيانات الحساب.",
      ],
      "استخدام التطبيق": [
        "يحظر على المستخدم استخدام التطبيق لأي أغراض غير قانونية.",
        "يجب احترام حقوق الملكية الفكرية لجميع المحتوى المتاح على التطبيق.",
      ],
      "المحتوى والملكية الفكرية": [
        "جميع حقوق الملكية الفكرية للمحتوى تعود لشركة بديهي.",
        "لا يجوز نسخ أو إعادة توزيع المحتوى دون إذن خطي من بديهي.",
      ],
    };

    final titles = termsAndConditions.keys.toList();

    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "الشروط والأحكام"),
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing4XL,
        ),
        child: ListView.builder(
          itemCount: termsAndConditions.length + 1, // +1 for header
          itemBuilder: (context, index) {
            if (index == 0) {
              // Header
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الشروط والأحكام – تطبيق بديهي',
                    style: TextStyle(
                      color: context.appColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.56,
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacingMD),
                  Text(
                    'مرحبًا بك في بديهي. باستخدامك للتطبيق، فإنك توافق على هذه الشروط والأحكام. يرجى قراءتها بعناية قبل البدء في استخدام هذا التطبيق.',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: context.appColors.textSecondary /* Colors-Text-text-secondary-(700) */,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacingXL),
                ],
              );
            }

            final title = titles[index - 1];
            final descriptionPoints = termsAndConditions[title]!;

            return index == termsAndConditions.length
                ? Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: AppSpacing.spacingXL),
                        child: TermsAndPoliciesComponent(
                          index: index,
                          title: title,
                          desciptionPoints: descriptionPoints,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: AppSpacing.spacingXL),
                        child: TermsAndPoliciesComponent(
                          index: index + 1,
                          title: "التواصل",
                          subTitle: "للأسئلة أو الدعم الفني، يمكن التواصل عبر:",
                          desciptionPoints: ['badihy.edu@gmail.com'],
                          isContact: true,
                        ),
                      ),
                    ],
                  )
                : Container(
                    margin: const EdgeInsets.only(bottom: AppSpacing.spacingXL),
                    child: TermsAndPoliciesComponent(
                      index: index,
                      title: title,
                      desciptionPoints: descriptionPoints,
                    ),
                  );
          },
        ),
      ),
    );
  }
}

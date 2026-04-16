import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/expanded_FAQ.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  final Map<String, String> faqList = const {
    "هل هناك نسخة تجريبية مجانية متاحة؟":
        "نعم، يمكنك تجربتها مجانًا لمدة 30 يومًا. إذا كنت تريد ذلك، فسنزودك بمكالمة تأهيل مجانية وشخصية مدتها 30 دقيقة لإعدادك وتشغيلك في أقرب وقت ممكن.",
    "هل يمكنني تغيير خطتي لاحقًا؟":
        "نعم، يمكنك تجربتها مجانًا لمدة 30 يومًا. إذا كنت تريد ذلك، فسنزودك بمكالمة تأهيل مجانية وشخصية مدتها 30 دقيقة لإعدادك وتشغيلك في أقرب وقت ممكن.",
    "ما هي سياسة الإلغاء الخاصة بك؟":
        "نعم، يمكنك تجربتها مجانًا لمدة 30 يومًا. إذا كنت تريد ذلك، فسنزودك بمكالمة تأهيل مجانية وشخصية مدتها 30 دقيقة لإعدادك وتشغيلك في أقرب وقت ممكن.",
    "هل يمكن إضافة معلومات أخرى إلى الفاتورة؟":
        "نعم، يمكنك تجربتها مجانًا لمدة 30 يومًا. إذا كنت تريد ذلك، فسنزودك بمكالمة تأهيل مجانية وشخصية مدتها 30 دقيقة لإعدادك وتشغيلك في أقرب وقت ممكن.",
    "كيف تعمل الفواتير؟":
        "نعم، يمكنك تجربتها مجانًا لمدة 30 يومًا. إذا كنت تريد ذلك، فسنزودك بمكالمة تأهيل مجانية وشخصية مدتها 30 دقيقة لإعدادك وتشغيلك في أقرب وقت ممكن.",
    "كيف أغير البريد الإلكتروني لحسابي؟":
        "نعم، يمكنك تجربتها مجانًا لمدة 30 يومًا. إذا كنت تريد ذلك، فسنزودك بمكالمة تأهيل مجانية وشخصية مدتها 30 دقيقة لإعدادك وتشغيلك في أقرب وقت ممكن.",
  };

  @override
  Widget build(BuildContext context) {
    final faqKeys = faqList.keys.toList(); // preserve order

    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "الأسئلة الشائعة"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.spacingXL,
          AppSpacing.spacing2XL,
          AppSpacing.spacingXL,
          AppSpacing.spacing4XL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اطّلع على إجابات لأهم الأسئلة المتعلقة بالتطبيق',
              style: TextStyle(
                color: context.appColors.textSecondary,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.56,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: faqList.length,
                itemBuilder: (context, index) {
                  final question = faqKeys[index];
                  final answer = faqList[question]!;
                  return Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(bottom: AppSpacing.spacing3XL, top: AppSpacing.spacing3XL),
                        child: ExpandedFaq(
                          isExpanded: index == 0 ? true : false,
                          question: question,
                          answer: answer,
                        ),
                      ),
                      index < faqList.length - 1
                          ? Divider(
                              height: 1,
                              color: context.appColors.borderSecondary,
                            )
                          : SizedBox(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoldenAndInsightfulInfo extends StatelessWidget {
  final String infoText;
  final bool isGoldenInfo;
  const GoldenAndInsightfulInfo({
    super.key,
    required this.infoText,
    this.isGoldenInfo = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSpacing.spacing3XL),
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: isGoldenInfo ? context.appColors.utilityWarning50 : context.appColors.utilityIndigo50,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: isGoldenInfo ? context.appColors.utilityWarning400 : context.appColors.utilityIndigo400,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                isGoldenInfo ? 'assets/images/icons/stars-02.svg' : 'assets/images/icons/lightbulb-02.svg',
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                    isGoldenInfo ? context.appColors.utilityWarning700 : context.appColors.utilityIndigo700,
                    BlendMode.srcIn),
              ),
              SizedBox(width: AppSpacing.spacingMD),
              Text(
                isGoldenInfo ? 'معلومة ذهبية' : "توضيح",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color:
                      isGoldenInfo ? context.appColors.utilityWarning700 : context.appColors.utilityIndigo700,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1.56,
                ),
              ),
            ],
          ),
          Text(
            infoText,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: isGoldenInfo ? context.appColors.utilityWarning700 : context.appColors.utilityIndigo700,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              height: 1.56,
            ),
          ),
        ],
      ),
    );
  }
}

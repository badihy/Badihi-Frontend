import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/confirmation_bottom_sheet.dart';
import 'package:badihi/presentation/components/custom_bottom_sheet.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LessonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String elevationIconName;
  final String appbarTitle;
  final int slidesNumber;
  final int currentSlide;
  final double lessonProgress;
  const LessonAppBar({
    super.key,
    this.elevationIconName = "arrow-narrow-right",
    required this.appbarTitle,
    required this.slidesNumber,
    required this.currentSlide,
    required this.lessonProgress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: context.appColors.bgPrimary,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/images/icons/$elevationIconName.svg',
          colorFilter: ColorFilter.mode(context.appColors.fgPrimary, BlendMode.srcIn),
        ),
        onPressed: () {
          showCustomBottomSheet(
            context,
            ConfirmationBottomSheet(
              onConfirm: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              iconName: "log-out-04",
              titleText: 'هل أنت متأكد أنك تريد الخروج من الدرس؟',
              subTitleText: 'لا تقلق، سيبقى تقدمك محفوظاً إذا قمت بالعودة مرة أخرى لإكمال الدرس',
              buttonText1: "إكمال الدرس",
              buttonText2: "الخروج وعدم الإكمال",
            ),
          );
        },
      ),
      elevation: 0,
      titleSpacing: 0,
      title: Row(
        children: [
          Expanded(
            child: Text(
              appbarTitle,
              style: TextStyle(
                color: context.appColors.textPrimary /* Colors-Text-text-primary-(900) */,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.56,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '0$currentSlide  من  0$slidesNumber',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: context.appColors.textBrandSecondary /* Colors-Text-text-brand-secondary-(700) */,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.50,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(width: AppSpacing.spacing2XL)
        ],
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: ClipRRect(
          child: LinearProgressIndicator(
            minHeight: 4,
            backgroundColor: context.appColors.bgQuaternary,
            color: context.appColors.fgBrandPrimary,
            value: lessonProgress,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSpacing.spacing7XL);
}

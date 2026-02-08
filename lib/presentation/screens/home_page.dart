import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/dashed_border_container.dart';
import 'package:badihi/presentation/components/course_card.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/screens/course_details_page.dart';
import 'package:badihi/presentation/screens/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBasicBar: false,
        isHomeBar: true,
        appBarTitle: "الرئيسية",
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing4XL,
        ),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.spacingXL),
              decoration: ShapeDecoration(
                color: context.appColors.bgPrimary,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: context.appColors.borderSecondary,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashedBorder(
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.spacingMD),
                      child: SvgPicture.asset(
                        "assets/images/icons/plus.svg",
                        width: 32,
                        height: 32,
                        colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacingLG),
                  Text(
                    'لم تبدأ أي دورة بعد',
                    style: TextStyle(
                      color: context.appColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.56,
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacingXL),
                  IntrinsicWidth(
                    child: MainButton(
                      text: "ابدأ دورة جديدة مجاناً",
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: AppSpacing.spacing2XL),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'دورات مناسبة لك',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: context.appColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.56,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return HomeController(
                              selectedPage: 1,
                            );
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'عرض جميع الدورات',
                          style: TextStyle(
                            color: context.appColors.textTertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.43,
                          ),
                        ),
                        SizedBox(width: AppSpacing.spacingXS),
                        SvgPicture.asset(
                          "assets/images/icons/arrow-narrow-left.svg",
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(context.appColors.fgQuaternary, BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.spacingMD),
            CarouselSlider(
              items: [1, 2, 3]
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) {
                              return CourseDetailsPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: AppSpacing.spacingXL),
                        child: e > 1
                            ? CourseCard(
                                isBusiness: true,
                              )
                            : CourseCard(),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 300,
                enableInfiniteScroll: false,
                viewportFraction: .75,
                padEnds: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

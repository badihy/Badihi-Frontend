import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/courses/get_all_courses_cubit.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/custom_circular_progress_indicator.dart';
import 'package:badihi/presentation/components/dashed_border_container.dart';
import 'package:badihi/presentation/components/course_card.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/screens/course_details_page.dart';
import 'package:badihi/presentation/screens/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllCoursesCubit>().getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBasicBar: false,
        isHomeBar: true,
        appBarTitle: "الرئيسية",
      ),
      body: Container(
        margin: const EdgeInsets.only(
          bottom: AppSpacing.spacing4XL,
        ),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                AppSpacing.spacing2XL,
                AppSpacing.spacing2XL,
                AppSpacing.spacing2XL,
                0,
              ),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) {
                              return HomeController(selectedPage: 1);
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: AppSpacing.spacing2XL),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: AppSpacing.spacing2XL,
              ),
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
            Container(
              margin: const EdgeInsets.only(
                right: AppSpacing.spacing2XL,
              ),
              child: BlocBuilder<GetAllCoursesCubit, GetAllCoursesState>(
                builder: (context, state) {
                  return state is GetAllCoursesLoading
                      ? Container(
                          margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.1),
                          child: Center(child: CustomCircularProgressIndicator()),
                        )
                      : state is GetAllCoursesSuccess
                          ? CarouselSlider(
                              items: state.allCourses.data
                                  .map(
                                    (currentCourse) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (BuildContext context) {
                                              return CourseDetailsPage(
                                                courseId: currentCourse.id,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: AppSpacing.spacingXL),
                                        child: CourseCard(
                                          imageUrl: currentCourse.coverImage,
                                          courseCategory: currentCourse.category?.name ?? "بدون تصنيف",
                                          courseShortDesc: currentCourse.name ?? "عنوان الكورس غير متوفر",
                                          courseDesc: currentCourse.description,
                                          estimationTime: currentCourse.estimationTime,
                                          isHomeCard: true,
                                          courseFollowers: currentCourse.enrollmentsCount,
                                          courseId: currentCourse.id,
                                          isBookmarked: currentCourse.isBookmarked,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              options: CarouselOptions(
                                height: 310,
                                enableInfiniteScroll: false,
                                viewportFraction: .75,
                                padEnds: false,
                              ),
                            )
                          : SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

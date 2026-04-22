import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/courses/get_all_courses_cubit.dart';
import 'package:badihi/cubit/courses/user_enrolled_courses_cubit.dart';
import 'package:badihi/presentation/components/card_badge.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/dashed_border_container.dart';
import 'package:badihi/presentation/components/course_card.dart';
import 'package:badihi/presentation/components/horizontal_progress_bar.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/screens/course_details_page.dart';
import 'package:badihi/presentation/screens/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    context.read<UserEnrolledCoursesCubit>().getCourseDetails();
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
              margin: const EdgeInsets.fromLTRB(
                AppSpacing.spacing2XL,
                AppSpacing.spacing2XL,
                AppSpacing.spacing2XL,
                0,
              ),
              child: BlocBuilder<UserEnrolledCoursesCubit, UserEnrolledCoursesState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      state is UserEnrolledCoursesSuccess
                          ? Text(
                              'تابع من حيث توقفت',
                              style: TextStyle(
                                color: context.appColors.textPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                height: 1.78,
                              ),
                            )
                          : SizedBox(),
                      state is UserEnrolledCoursesSuccess
                          ? SizedBox(height: AppSpacing.spacingMD)
                          : SizedBox(),
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.spacingXL),
                        width: double.infinity,
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
                        child: state is UserEnrolledCoursesSuccess
                            ? Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 150,
                                        child: Image.network(
                                          state.getAllEnrolledCourses.data.courses[0].coverImage,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) return child;

                                            return Container(
                                              color: context.appColors.bgDisabled,
                                              child: const Center(
                                                child: CircularProgressIndicator(),
                                              ),
                                            );
                                          },
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: context.appColors.bgDisabled,
                                              child: const Icon(
                                                Icons.image_not_supported_outlined,
                                                size: 40,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: AppSpacing.spacingXL),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CardBadge(badgeText: "برمجة"),
                                      SizedBox(height: AppSpacing.spacingMD),
                                      Text(
                                        'أساسيات البرمجة بلغة بايثون',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: context
                                              .appColors.textPrimary /* Colors-Text-text-primary-(900) */,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          height: 1.70,
                                        ),
                                      ),
                                      SizedBox(height: AppSpacing.spacingXXS),
                                      Text(
                                        'الدرس الحالي: أساسيات البرمجة',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: context
                                              .appColors.textSecondary /* Colors-Text-text-secondary-(700) */,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 1.71,
                                        ),
                                      ),
                                      SizedBox(height: AppSpacing.spacingMD),
                                      // HorizontalProgressBar(progress: 20),
                                      SizedBox(height: AppSpacing.spacingMD),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/icons/clock.svg',
                                            width: 16,
                                            height: 16,
                                            colorFilter: ColorFilter.mode(
                                                context.appColors.borderBrand, BlendMode.srcIn),
                                          ),
                                          SizedBox(width: AppSpacing.spacingXS),
                                          Text(
                                            '3 ساعات متبقية',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: context.appColors
                                                  .textSecondary /* Colors-Text-text-secondary-(700) */,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              height: 1.71,
                                            ),
                                          ),
                                        ],
                                      ),
                                      MainButton(
                                        text: "متابعة الدرس",
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DashedBorder(
                                    child: Container(
                                      padding: const EdgeInsets.all(AppSpacing.spacingMD),
                                      child: SvgPicture.asset(
                                        "assets/images/icons/plus.svg",
                                        width: 32,
                                        height: 32,
                                        colorFilter:
                                            ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
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
                    ],
                  );
                },
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
                    if (state is GetAllCoursesLoading) {
                      // Show skeleton loading for carousel
                      return Skeletonizer(
                        enabled: true,
                        effect: const ShimmerEffect(
                          duration: Duration(seconds: 1),
                        ),
                        child: CarouselSlider(
                          items: List.generate(
                            3, // Show 3 skeleton items
                            (index) => Container(
                              margin: const EdgeInsets.only(left: AppSpacing.spacingXL),
                              child: const CourseCard(
                                imageUrl: '', // Empty URL will show skeleton
                                courseCategory: 'تصنيف مؤقت',
                                courseShortDesc: 'جاري تحميل اسم الدورة...',
                                courseDesc: 'جاري تحميل وصف الدورة التدريبية...',
                                estimationTime: '00:00',
                                isHomeCard: true,
                                courseFollowers: 0,
                                courseId: '',
                                isBookmarked: false,
                              ),
                            ),
                          ),
                          options: CarouselOptions(
                            height: 310,
                            enableInfiniteScroll: false,
                            viewportFraction: .75,
                            padEnds: false,
                          ),
                        ),
                      );
                    } else if (state is GetAllCoursesSuccess) {
                      // Show actual data
                      return CarouselSlider(
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
                                  margin: const EdgeInsets.only(left: AppSpacing.spacingXL),
                                  child: CourseCard(
                                    imageUrl: currentCourse.coverImage,
                                    courseCategory: currentCourse.category?.name ?? "بدون تصنيف",
                                    courseShortDesc: currentCourse.name,
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
                      );
                    }
                    return const SizedBox();
                  },
                )),
          ],
        ),
      ),
    );
  }
}

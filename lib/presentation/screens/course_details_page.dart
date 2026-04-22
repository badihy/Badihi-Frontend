import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/bookmark/add_to_bookmarks_cubit.dart';
import 'package:badihi/cubit/bookmark/delete_bookmark_cubit.dart';
import 'package:badihi/cubit/bookmark/get_all_bookmarks_cubit.dart';
import 'package:badihi/cubit/courses/enroll_user_in_a_course_cubit.dart';
import 'package:badihi/cubit/courses/get_all_courses_cubit.dart';
import 'package:badihi/cubit/courses/get_course_by_id_cubit.dart';
import 'package:badihi/presentation/components/card_badge.dart';
import 'package:badihi/presentation/components/chapter_card_details.dart';
import 'package:badihi/presentation/components/horizontal_progress_bar.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CourseDetailsPage extends StatefulWidget {
  final String courseId;
  const CourseDetailsPage({super.key, required this.courseId});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  int selectedButtonIndex = 0;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    context.read<GetCourseByIdCubit>().getCourseDetails(courseId: widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GetCourseByIdCubit, GetCourseByIdState>(
        listener: (context, state) {
          if (state is GetCourseByIdSuccess) {
            setState(() {
              _isBookmarked = state.courseDetails.data.isBookmarked;
            });
          }
        },
        child: BlocBuilder<GetCourseByIdCubit, GetCourseByIdState>(
          builder: (context, state) {
            if (state is GetCourseByIdLoading) {
              return _buildSkeletonLoading();
            }

            if (state is GetCourseByIdSuccess) {
              return _buildCourseDetails(state);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  // Skeleton loading widget
  Widget _buildSkeletonLoading() {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        duration: Duration(seconds: 1),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header section with app bar and image skeleton
          Container(
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.spacingXL,
              0,
              AppSpacing.spacing2XL,
              AppSpacing.spacing6XL,
            ),
            decoration: BoxDecoration(
              color: context.appColors.bgDisabled,
            ),
            child: Column(
              children: [
                // App bar skeleton
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                        ),
                        const SizedBox(width: AppSpacing.spacingSM),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.spacingXL),
                // Image skeleton
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content section skeleton
          Container(
            margin: const EdgeInsets.fromLTRB(
              AppSpacing.spacing2XL,
              AppSpacing.spacing3XL,
              AppSpacing.spacing2XL,
              AppSpacing.spacing4XL,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badge skeleton
                Container(
                  width: 100,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: AppSpacing.spacingMD),
                // Title skeleton
                Container(
                  width: double.infinity,
                  height: 28,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: AppSpacing.spacingSM),
                // Description skeleton
                Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.grey[300],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 20,
                  margin: const EdgeInsets.only(top: 4),
                  color: Colors.grey[300],
                ),
                const SizedBox(height: AppSpacing.spacingMD),
                // Progress bar skeleton
                Container(
                  width: double.infinity,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: AppSpacing.spacingMD),
                // Stats row skeleton
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatSkeleton(),
                    _buildStatSkeleton(),
                    _buildStatSkeleton(),
                    _buildStatSkeleton(),
                    _buildStatSkeleton(),
                  ],
                ),
                const SizedBox(height: AppSpacing.spacingXL),
                // Button skeleton
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: AppSpacing.spacing4XL),
                // Tabs skeleton
                Row(
                  children: List.generate(
                    2,
                    (index) => Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          right: index == 1 ? AppSpacing.spacingMD : 0,
                        ),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.spacing3XL),
                // Chapters skeleton
                ...List.generate(
                  3,
                  (index) => Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.spacing3XL),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                            ),
                            const SizedBox(width: AppSpacing.spacingMD),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 20,
                                    color: Colors.grey[300],
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    height: 16,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (index < 2)
                        Container(
                          height: 1,
                          color: Colors.grey[300],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for stat item skeleton
  Widget _buildStatSkeleton() {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: Colors.grey[300],
        ),
        const SizedBox(width: AppSpacing.spacingXS),
        Container(
          width: 40,
          height: 16,
          color: Colors.grey[300],
        ),
      ],
    );
  }

  // Build actual course details
  Widget _buildCourseDetails(GetCourseByIdSuccess state) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 60),
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.spacingXL,
            0,
            AppSpacing.spacing2XL,
            AppSpacing.spacing6XL,
          ),
          decoration: BoxDecoration(
            color: context.appColors.bgDisabled,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(
                      "assets/images/icons/arrow-narrow-right.svg",
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(context.appColors.fgPrimary, BlendMode.srcIn),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/images/icons/share-07.svg",
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(context.appColors.fgPrimary, BlendMode.srcIn),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<GetAllCoursesCubit>().hasData = false;
                          context.read<GetAllBookmarksCubit>().hasData = false;

                          // Bookmark toggle logic here
                          if (_isBookmarked) {
                            context.read<DeleteBookmarkCubit>().deleteBookmark(
                                  courseId: widget.courseId,
                                );
                          } else {
                            context.read<AddToBookmarksCubit>().addToBookmarks(
                                  userId: getIt<CacheHelper>().getString(ApiKey.id) ?? "",
                                  courseId: widget.courseId,
                                );
                          }
                          setState(() {
                            _isBookmarked = !_isBookmarked;
                          });
                          context.read<GetAllCoursesCubit>().getAllCourses();
                          context.read<GetAllBookmarksCubit>().getAllBookmarks();
                        },
                        icon: Icon(
                          _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          size: 24,
                          color: _isBookmarked
                              ? context.appColors.fgBrandPrimary
                              : context.appColors.fgSecondaryHover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.spacingXL),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 140,
                    child: Image.network(
                      state.courseDetails.data.coverImage,
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
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(
            AppSpacing.spacing2XL,
            AppSpacing.spacing3XL,
            AppSpacing.spacing2XL,
            AppSpacing.spacing4XL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardBadge(
                badgeText: state.courseDetails.data.category?.name ?? "غير مصنف",
              ),
              const SizedBox(height: AppSpacing.spacingMD),
              Text(
                state.courseDetails.data.name,
                style: TextStyle(
                  color: context.appColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                ),
                maxLines: 1,
              ),
              Text(
                state.courseDetails.data.description,
                style: TextStyle(
                  color: context.appColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.43,
                ),
              ),
              const SizedBox(height: AppSpacing.spacingMD),
              HorizontalProgressBar(progress: .3),
              const SizedBox(height: AppSpacing.spacingMD),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/icons/grid-01.svg",
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
                      ),
                      const SizedBox(width: AppSpacing.spacingXS),
                      Text(
                        state.courseDetails.data.level ?? "مبتدئ",
                        style: TextStyle(
                          color: context.appColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: context.appColors.borderSecondary,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/icons/clock.svg",
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
                      ),
                      const SizedBox(width: AppSpacing.spacingXS),
                      Text(
                        state.courseDetails.data.estimationTime,
                        style: TextStyle(
                          color: context.appColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: context.appColors.borderSecondary,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/icons/users-03.svg",
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
                      ),
                      const SizedBox(width: AppSpacing.spacingXS),
                      Text(
                        "${state.courseDetails.data.enrollmentsCount}",
                        style: TextStyle(
                          color: context.appColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: context.appColors.borderSecondary,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/icons/star-01.svg",
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
                      ),
                      const SizedBox(width: AppSpacing.spacingXS),
                      Text(
                        "${state.courseDetails.data.averageRating} (${state.courseDetails.data.reviewsCount})",
                        style: TextStyle(
                          color: context.appColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.spacingXL),
              MainButton(
                text: "ابدأ الدورة مجانًا",
                onTap: () {
                  context.read<EnrollUserInACourseCubit>().enrollUserInCourse(courseId: widget.courseId);
                },
                btnHorizontalPadding: AppSpacing.spacingLG,
                btnVerticalPadding: 0,
              ),
              const SizedBox(height: AppSpacing.spacing4XL),
              Row(
                children: List.generate(
                  2,
                  (index) {
                    final isSelected = selectedButtonIndex == index;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: index == 1 ? AppSpacing.spacingMD : 0,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isSelected ? context.appColors.bgBrandSecondary : context.appColors.bgPrimary,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = index;
                            });
                          },
                          child: Text(
                            index == 0 ? 'منهج الدورة' : 'تفاصيل الدورة',
                            style: TextStyle(
                              color: isSelected
                                  ? context.appColors.textBrandSecondaryHover
                                  : context.appColors.textSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              selectedButtonIndex == 0
                  ? ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.courseDetails.data.chapters.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: AppSpacing.spacing3XL,
                            bottom: AppSpacing.spacing3XL,
                          ),
                          child: ChapterCardDetails(
                            index: index,
                            chapterId: state.courseDetails.data.chapters[index].description,
                            chapterTitle: state.courseDetails.data.chapters[index].title,
                            chapterLessons: state.courseDetails.data.chapters[index].lessons ?? [],
                            isExpandedByDefault: index == 0 ? true : false,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 1,
                          color: context.appColors.borderSecondary,
                        );
                      },
                    )
                  : Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: AppSpacing.spacing2XL),
                            Text(
                              "ماذا ستتعلم في هذه الدورة",
                              style: TextStyle(
                                color: context.appColors.textPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                height: 1.56,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.spacingXL),
                            Column(
                              children: List.generate(
                                state.courseDetails.data.willLearn.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/icons/check.svg",
                                          width: 20,
                                          height: 20,
                                          colorFilter: ColorFilter.mode(
                                              context.appColors.fgSuccessPrimary, BlendMode.srcIn),
                                        ),
                                        const SizedBox(width: AppSpacing.spacingMD),
                                        Expanded(
                                          child: Text(
                                            state.courseDetails.data.willLearn[index],
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: context.appColors.textSecondary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 1.50,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        )
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/bookmark/add_to_bookmarks_cubit.dart';
import 'package:badihi/cubit/bookmark/delete_bookmark_cubit.dart';
import 'package:badihi/cubit/bookmark/get_all_bookmarks_cubit.dart';
import 'package:badihi/cubit/courses/get_all_courses_cubit.dart';
import 'package:badihi/presentation/components/card_badge.dart';
import 'package:badihi/presentation/components/horizontal_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseCard extends StatefulWidget {
  final String imageUrl;
  final String courseCategory;
  final String courseShortDesc;
  final String courseDesc;
  final String estimationTime;
  final int courseFollowers;
  final bool isBusiness;
  final bool isBookmarked;
  final double progress;
  final bool isHomeCard;
  final String courseId;

  const CourseCard({
    super.key,
    required this.imageUrl,
    required this.courseCategory,
    required this.courseShortDesc,
    required this.courseDesc,
    required this.estimationTime,
    required this.courseFollowers,
    required this.courseId,
    this.isBusiness = false,
    this.isBookmarked = false,
    this.progress = -1,
    this.isHomeCard = false,
  });

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  late bool _isBookmarked = widget.isBookmarked;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // NETWORK IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: Image.network(
                    widget.imageUrl,
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

              Positioned(
                left: 12,
                top: 12,
                child: GestureDetector(
                  onTap: () {
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
                    // context.read<GetAllBookmarksCubit>().getAllBookmarks();
                  },
                  child: Icon(
                    _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    size: 24,
                    color:
                        _isBookmarked ? context.appColors.fgBrandPrimary : context.appColors.fgSecondaryHover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.spacingLG),
          CardBadge(
            badgeText: widget.courseCategory,
            isBusiness: widget.isBusiness,
          ),
          SizedBox(height: AppSpacing.spacingMD),
          Text(
            widget.courseShortDesc,
            style: TextStyle(
              color: context.appColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 1.50,
            ),
            maxLines: 1,
          ),
          Text(
            widget.courseDesc,
            style: TextStyle(
              color: context.appColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.43,
            ),
            maxLines: widget.isHomeCard ? 1 : 2,
          ),
          SizedBox(height: widget.progress == -1 ? 0 : AppSpacing.spacingMD),
          widget.progress == -1 ? const SizedBox() : HorizontalProgressBar(progress: widget.progress),
          SizedBox(height: AppSpacing.spacingMD),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/icons/grid-01.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
              ),
              SizedBox(width: AppSpacing.spacingXS),
              Text(
                'مبتديء',
                style: TextStyle(
                  color: context.appColors.textSecondary,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: AppSpacing.spacingLG),
              Container(
                width: 1,
                height: 20,
                color: context.appColors.borderSecondary,
              ),
              SizedBox(width: AppSpacing.spacingLG),
              SvgPicture.asset(
                'assets/images/icons/clock.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
              ),
              SizedBox(width: AppSpacing.spacingXS),
              Text(
                widget.estimationTime,
                style: TextStyle(
                  color: context.appColors.textSecondary,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: AppSpacing.spacingLG),
              Container(
                width: 1,
                height: 20,
                color: context.appColors.borderSecondary,
              ),
              SizedBox(width: AppSpacing.spacingLG),
              SvgPicture.asset(
                'assets/images/icons/users-03.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
              ),
              SizedBox(width: AppSpacing.spacingXS),
              Text(
                "${widget.courseFollowers}",
                style: TextStyle(
                  color: context.appColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

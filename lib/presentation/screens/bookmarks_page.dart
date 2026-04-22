import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/bookmark/get_all_bookmarks_cubit.dart';
import 'package:badihi/cubit/categories/get_all_categories_cubit.dart';
import 'package:badihi/presentation/components/course_card.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/filter_bar.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/screens/course_details_page.dart';
import 'package:badihi/presentation/screens/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  int selectedTagIndex = 0;
  String? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    context.read<GetAllBookmarksCubit>().getAllBookmarks();
    context.read<GetAllCategoriesCubit>().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "المحفوظات",
        isBasicBar: false,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          0,
        ),
        child: MultiBlocListener(
          listeners: [
            BlocListener<GetAllBookmarksCubit, GetAllBookmarksState>(
              listener: (context, state) {
                if (state is GetAllBookmarksFailure) {
                  showToast(
                    context: context,
                    message: state.errMessage,
                    isError: true,
                  );
                }
              },
            ),
            BlocListener<GetAllCategoriesCubit, GetAllCategoriesState>(
              listener: (context, state) {
                if (state is GetAllCategoriesFailure) {
                  showToast(
                    context: context,
                    message: state.errMessage,
                    isError: true,
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<GetAllBookmarksCubit, GetAllBookmarksState>(
            builder: (context, bookmarksState) {
              // Show skeleton while loading bookmarks
              if (bookmarksState is GetAllBookmarksLoading) {
                return _buildSkeletonLoading();
              }

              if (bookmarksState is! GetAllBookmarksSuccess) {
                return const SizedBox();
              }

              final allBookmarks = bookmarksState.allUserBookmarks.data;

              return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
                builder: (context, categoriesState) {
                  // Show skeleton while loading categories (if bookmarks exist)
                  if (categoriesState is GetAllCategoriesLoading && allBookmarks.isNotEmpty) {
                    return _buildSkeletonLoading();
                  }

                  List<dynamic> categories = [];

                  if (categoriesState is GetAllCategoriesSuccess) {
                    categories = categoriesState.allCategories.data.data;
                  }

                  // Add "All" filter at index 0
                  final filters = [
                    {"_id": null, "name": "الكل"},
                    ...categories.map((c) => {
                          "_id": c.id,
                          "name": c.name,
                        })
                  ];

                  // Apply filtering
                  final filteredBookmarks = selectedCategoryId == null
                      ? allBookmarks
                      : allBookmarks
                          .where((bookmark) => bookmark.course.category?.id == selectedCategoryId)
                          .toList();

                  // Check if there are no bookmarks at all
                  final hasNoBookmarks = allBookmarks.isEmpty;

                  // Check if filtered bookmarks are empty but there are bookmarks
                  final hasFilteredBookmarksEmpty = filteredBookmarks.isEmpty && !hasNoBookmarks;

                  return ListView(
                    children: [
                      // Only show filter bar if there are bookmarks
                      if (!hasNoBookmarks) ...[
                        FilterBar(
                          filters: filters,
                          selectedIndex: selectedTagIndex,
                          onChanged: (index) {
                            setState(() {
                              selectedTagIndex = index;
                              selectedCategoryId = filters[index]["_id"];
                            });
                          },
                        ),
                        const SizedBox(height: AppSpacing.spacingXL),
                      ],

                      // Show content based on state
                      if (hasNoBookmarks)
                        _buildEmptyBookmarksState()
                      else if (hasFilteredBookmarksEmpty)
                        _buildEmptyFilteredState()
                      else
                        ...List.generate(
                          filteredBookmarks.length,
                          (index) {
                            final currentBookmark = filteredBookmarks[index];

                            return Container(
                              margin: const EdgeInsets.only(bottom: AppSpacing.spacingXL),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (_) => CourseDetailsPage(courseId: currentBookmark.course.id),
                                    ),
                                  );
                                },
                                child: CourseCard(
                                  imageUrl: currentBookmark.course.coverImage ?? "",
                                  courseCategory: currentBookmark.course.category?.name ?? "بدون تصنيف",
                                  courseShortDesc: currentBookmark.course.name,
                                  courseDesc: currentBookmark.course.description,
                                  estimationTime: currentBookmark.course.estimationTime,
                                  courseId: currentBookmark.course.id,
                                  courseFollowers: currentBookmark.course.enrollmentsCount,
                                  isBookmarked: true,
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // Skeleton loading widget for bookmarks
  Widget _buildSkeletonLoading() {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        duration: Duration(seconds: 1),
      ),
      child: ListView(
        children: [
          // Skeleton FilterBar
          const _SkeletonFilterBar(),

          const SizedBox(height: AppSpacing.spacingXL),

          // Skeleton bookmark cards (show 3-4 cards as placeholder)
          ...List.generate(
            3,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.spacingXL),
              child: const CourseCard(
                imageUrl: '',
                courseCategory: 'تحميل التصنيف',
                courseShortDesc: 'جاري تحميل اسم الدورة التدريبية',
                courseDesc: 'جاري تحميل وصف الدورة التدريبية...',
                estimationTime: '00:00',
                courseId: '',
                courseFollowers: 0,
                isBookmarked: true, // Show bookmark icon in skeleton
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for when there are no bookmarks at all
  Widget _buildEmptyBookmarksState() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.233),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: context.appColors.fgDisabledSubtle,
                  ),
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
              child: SvgPicture.asset(
                'assets/images/icons/bookmark.svg',
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(context.appColors.fgSecondaryHover, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: AppSpacing.spacingXL),
            Text(
              'لا يوجد دورات محفوظة',
              style: TextStyle(
                color: context.appColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.50,
              ),
            ),
            const SizedBox(height: AppSpacing.spacingMD),
            Text(
              'ابدأ بتصفّح الدورات واحفظ ما يناسبك.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.appColors.textTertiaryHover,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
            const SizedBox(height: AppSpacing.spacingXL),
            IntrinsicWidth(
              child: MainButton(
                text: "تصفح الدورات المتاحة",
                btnHorizontalPadding: 14,
                btnVerticalPadding: 10,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for when filtered bookmarks are empty but there are bookmarks
  Widget _buildEmptyFilteredState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.23),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: context.appColors.fgDisabledSubtle,
                ),
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            child: Icon(
              Icons.filter_alt_off,
              size: 40,
              color: context.appColors.fgSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.spacingXL),
          Text(
            'لا توجد دورات في هذا التصنيف',
            style: TextStyle(
              color: context.appColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 1.50,
            ),
          ),
          const SizedBox(height: AppSpacing.spacingMD),
          Text(
            'جرب تصفية أخرى أو اطلع على جميع الدورات المحفوظة.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: context.appColors.textTertiaryHover,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
        ],
      ),
    );
  }
}

// Skeleton Filter Bar Widget
class _SkeletonFilterBar extends StatelessWidget {
  const _SkeletonFilterBar();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          // "الكل" chip - usually the first one
          Container(
            margin: const EdgeInsets.only(right: AppSpacing.spacingSM),
            child: ActionChip(
              label: Text(
                'الكل',
                style: TextStyle(
                  color: context.appColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: null, // Disabled for skeleton
              backgroundColor: context.appColors.bgPrimary,
              side: BorderSide(
                color: context.appColors.borderPrimary,
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.spacingMD,
                vertical: AppSpacing.spacingXS,
              ),
            ),
          ),

          // Category chips skeleton
          ...List.generate(
            3,
            (index) => Container(
              margin: const EdgeInsets.only(right: AppSpacing.spacingSM),
              child: ActionChip(
                label: Text(
                  'تحميل التصنيف',
                  style: TextStyle(
                    color: context.appColors.textSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: null, // Disabled for skeleton
                backgroundColor: context.appColors.bgPrimary,
                side: BorderSide(
                  color: context.appColors.borderPrimary,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.spacingMD,
                  vertical: AppSpacing.spacingXS,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

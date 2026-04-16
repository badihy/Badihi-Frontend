import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/categories/get_all_categories_cubit.dart';
import 'package:badihi/cubit/courses/get_all_courses_cubit.dart';
import 'package:badihi/presentation/components/course_card.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/custom_circular_progress_indicator.dart';
import 'package:badihi/presentation/components/filter_bar.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/screens/course_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int selectedTagIndex = 0;
  String? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    context.read<GetAllCategoriesCubit>().getAllCategories();
    context.read<GetAllCoursesCubit>().getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBasicBar: false,
        appBarTitle: "الدورات",
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
            BlocListener<GetAllCoursesCubit, GetAllCoursesState>(
              listener: (context, state) {
                if (state is GetAllCoursesFailure) {
                  showToast(
                    context: context,
                    message: state.errMessage,
                    isError: true,
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<GetAllCoursesCubit, GetAllCoursesState>(
            builder: (context, coursesState) {
              if (coursesState is GetAllCoursesLoading) {
                return const Center(
                  child: CustomCircularProgressIndicator(),
                );
              }

              if (coursesState is! GetAllCoursesSuccess) {
                return const SizedBox();
              }

              final allCourses = coursesState.allCourses.data;

              return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
                builder: (context, categoriesState) {
                  if (categoriesState is GetAllCategoriesLoading) {
                    return const Center(
                      child: CustomCircularProgressIndicator(),
                    );
                  }

                  List<dynamic> categories = [];

                  if (categoriesState is GetAllCategoriesSuccess) {
                    categories = categoriesState.allCategories.data;
                  }

                  final filters = [
                    {"_id": null, "name": "الكل"},
                    ...categories.map((c) => {
                          "_id": c.id,
                          "name": c.name,
                        })
                  ];

                  final filteredCourses = selectedCategoryId == null
                      ? allCourses
                      : allCourses.where((course) => course.category?.id == selectedCategoryId).toList();

                  return ListView(
                    children: [
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

                      // EMPTY STATE + LIST
                      if (filteredCourses.isEmpty)
                        Center(
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
                              SizedBox(height: AppSpacing.spacingXL),
                              Text(
                                'لا توجد دورات في هذا التصنيف',
                                style: TextStyle(
                                  color: context.appColors.textPrimary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 1.50,
                                ),
                              ),
                              SizedBox(height: AppSpacing.spacingMD),
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
                        )
                      else
                        ...List.generate(
                          filteredCourses.length,
                          (index) {
                            final currentCourse = filteredCourses[index];

                            return Container(
                              margin: const EdgeInsets.only(
                                bottom: AppSpacing.spacingXL,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (_) => CourseDetailsPage(
                                        courseId: currentCourse.id,
                                      ),
                                    ),
                                  );
                                },
                                child: CourseCard(
                                  imageUrl: currentCourse.coverImage,
                                  courseCategory: currentCourse.category?.name ?? "بدون تصنيف",
                                  courseShortDesc: currentCourse.name,
                                  courseDesc: currentCourse.description,
                                  estimationTime: currentCourse.estimationTime,
                                  courseId: currentCourse.id,
                                  courseFollowers: currentCourse.enrollmentsCount,
                                  isBookmarked: currentCourse.isBookmarked,
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
}

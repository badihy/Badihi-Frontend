part of 'get_all_categories_cubit.dart';

@immutable
sealed class GetAllCategoriesState {}

final class GetAllCategoriesInitial extends GetAllCategoriesState {}

// GetAllCategories states
final class GetAllCategoriesSuccess extends GetAllCategoriesState {
  final GetAllCategoriesModel allCategories;
  GetAllCategoriesSuccess({required this.allCategories});
}

final class GetAllCategoriesLoading extends GetAllCategoriesState {}

final class GetAllCategoriesFailure extends GetAllCategoriesState {
  final String errMessage;

  GetAllCategoriesFailure({required this.errMessage});
}

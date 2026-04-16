part of 'add_to_bookmarks_cubit.dart';

@immutable
sealed class AddToBookmarksState {}

final class AddToBookmarksInitial extends AddToBookmarksState {}

// addToBookmarks states
final class AddToBookmarksSuccess extends AddToBookmarksState {}

final class AddToBookmarksLoading extends AddToBookmarksState {}

final class AddToBookmarksFailure extends AddToBookmarksState {
  final String errMessage;

  AddToBookmarksFailure({required this.errMessage});
}

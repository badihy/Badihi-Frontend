part of 'get_all_bookmarks_cubit.dart';

@immutable
sealed class GetAllBookmarksState {}

final class GetAllBookmarksInitial extends GetAllBookmarksState {}

// getAllBookmarks states
final class GetAllBookmarksSuccess extends GetAllBookmarksState {
  GetAllBookmarksModel allUserBookmarks;
  GetAllBookmarksSuccess({required this.allUserBookmarks});
}

final class GetAllBookmarksLoading extends GetAllBookmarksState {}

final class GetAllBookmarksFailure extends GetAllBookmarksState {
  final String errMessage;

  GetAllBookmarksFailure({required this.errMessage});
}

part of 'delete_bookmark_cubit.dart';

@immutable
sealed class DeleteBookmarkState {}

final class DeleteBookmarkInitial extends DeleteBookmarkState {}

// deleteBookmark states
final class DeleteBookmarkSuccess extends DeleteBookmarkState {
  DeleteBookmarkSuccess();
}

final class DeleteBookmarkLoading extends DeleteBookmarkState {}

final class DeleteBookmarkFailure extends DeleteBookmarkState {
  final String errMessage;

  DeleteBookmarkFailure({required this.errMessage});
}

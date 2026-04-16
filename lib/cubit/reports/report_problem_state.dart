part of 'report_problem_cubit.dart';

@immutable
sealed class ReportProblemState {}

final class ReportProblemInitial extends ReportProblemState {}

// ReportProblem states
final class ReportProblemSuccess extends ReportProblemState {
  ReportProblemSuccess();
}

final class ReportProblemLoading extends ReportProblemState {}

final class ReportProblemFailure extends ReportProblemState {
  final String errMessage;

  ReportProblemFailure({required this.errMessage});
}

part of 'report_cubit.dart';

sealed class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

final class ReportInitial extends ReportState {}

final class ReportValid extends ReportState{}

final class ReportLoading extends ReportValid{}

final class ReportInvalid extends ReportState{}
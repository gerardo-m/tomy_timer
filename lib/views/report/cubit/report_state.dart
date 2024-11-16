part of 'report_cubit.dart';

sealed class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

final class ReportInitial extends ReportState {}

final class ReportValid extends ReportState{

  final EReport report;
  final List<EReportItem> speakers;
  final List<EReportItem> outOfTimeMembers;

  const ReportValid({required this.report, required this.speakers, required this.outOfTimeMembers});

  @override
  List<Object> get props => [report, speakers, outOfTimeMembers];
  
}

final class ReportLoading extends ReportValid{
  const ReportLoading({required super.report, required super.speakers, required super.outOfTimeMembers});
}

final class ReportInvalid extends ReportState{}
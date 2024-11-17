import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/report.dart';
import 'package:tomy_timer/models/report_item.dart';
import 'package:tomy_timer/services/reports_service.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());

  Report? _report;

  ReportsService get _reportsService => GetIt.instance.get<ReportsService>();

  Future<void> load(int reportId)async{
    Report? cand = await _reportsService.getReport(reportId);
    if (cand == null){
      emit(ReportInvalid());
      return;
    }
    cand.speakers = await _reportsService.getSpeakers(reportId);
    cand.outOfTimeMembers = await _reportsService.getOutOfTimeMembers(reportId);
    _report = cand;
    _emitValidState();
  }

  Future<void> generate(int meetingId)async{
    _report = await _reportsService.generateFromMeeting(meetingId);
    if (_report == null) emit(ReportInvalid());
    _emitValidState();
  }

  // void _loading(){
  //   ReportState currentState = state;
  //   if (currentState is ReportValid){
  //     List<EReportItem> eReportItems = _report!.items.map((e) => e.toEReportItem(),).toList();
  //     emit(ReportLoading(report: _report!.toEReport(), reportItems: eReportItems)); 
  //   }
  // }
  
  void _emitValidState(){
    List<EReportItem> speakers = _report!.speakers.map((e) => e.toEReportItem(),).toList();
    List<EReportItem> outOfTimeMembers = _report!.outOfTimeMembers.map((e) => e.toEReportItem(),).toList();
    emit(ReportValid(report: _report!.toEReport(), speakers: speakers, outOfTimeMembers: outOfTimeMembers));
  }
}

class ReportBlocBuilder extends RichBlocBuilder<ReportCubit, ReportState, ReportValid, ReportInvalid, ReportLoading>{
  const ReportBlocBuilder({super.key, required super.builder});
}
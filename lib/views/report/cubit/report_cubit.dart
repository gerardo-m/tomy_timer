import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/services/reports_service.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());

  ReportsService get _reportsService => GetIt.instance.get<ReportsService>();

  void _loading(){
    ReportState currentState = state;
    if (currentState is ReportValid){
      emit(ReportLoading()); 
    }
  }
  
}

class ReportBlocBuilder extends RichBlocBuilder<ReportCubit, ReportState, ReportValid, ReportInvalid, ReportLoading>{
  const ReportBlocBuilder({super.key, required super.builder});
}
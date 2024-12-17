import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/services/reports_service.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'past_meetings_state.dart';

class PastMeetingsCubit extends Cubit<PastMeetingsState> {
  PastMeetingsCubit() : super(PastMeetingsInitial());

  ReportsService get _reportsService => GetIt.instance.get<ReportsService>();

  // void _loading(){
  //   PastMeetingsState currentState = state;
  //   if (currentState is PastMeetingsValid){
  //     emit(PastMeetingsLoading()); 
  //   }
  // }
  
}

class PastMeetingsBlocBuilder extends RichBlocBuilder<PastMeetingsCubit, PastMeetingsState, PastMeetingsValid, PastMeetingsInvalid, PastMeetingsLoading>{
  const PastMeetingsBlocBuilder({super.key, required super.builder, super.buildWhen});
}
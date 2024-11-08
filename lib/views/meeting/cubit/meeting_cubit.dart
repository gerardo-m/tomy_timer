
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/services/meetings_service.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'meeting_state.dart';

class MeetingCubit extends Cubit<MeetingState> {
  MeetingCubit() : super(MeetingInitial());

  final MeetingsService _meetingsService = GetIt.instance.get<MeetingsService>();

  Meeting _meeting = Meeting.createEmptyMeeting();

  Future<void> load(int? id) async{
    if (id != null){
      Meeting? cand = await _meetingsService.getMeeting(id);
      if (cand == null){
        emit(MeetingInvalid());
      }else{
        _meeting = cand;
      }
    }
    _emitValidState();
  }

  // void _loading(){
  //   MeetingState currentState = state;
  //   if (currentState is MeetingValid){
  //     emit(MeetingLoading(meeting: _meeting.toEMeeting()));
  //   }
  // }

  void _emitValidState(){
    emit(MeetingValid(meeting: _meeting.toEMeeting()));
  }
  
}

class MeetingBlocBuilder extends RichBlocBuilder<MeetingCubit, MeetingState, MeetingValid, MeetingInvalid, MeetingLoading>{
  const MeetingBlocBuilder({super.key, required super.builder});
}
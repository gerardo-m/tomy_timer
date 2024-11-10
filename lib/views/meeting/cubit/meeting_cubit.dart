
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/services/meeting_items_service.dart';
import 'package:tomy_timer/services/meetings_service.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'meeting_state.dart';

class MeetingCubit extends Cubit<MeetingState> {
  MeetingCubit() : super(MeetingInitial());

  final MeetingsService _meetingsService = GetIt.instance.get<MeetingsService>();
  final MeetingItemsService _meetingItemsService = GetIt.instance.get<MeetingItemsService>();

  Meeting _meeting = Meeting.createEmptyMeeting();
  int _selectedItem = 0;
  List<MeetingItem> _meetingItems = [];

  Future<void> load(int? id) async{
    Meeting? cand;
    if (id != null){
      cand = await _meetingsService.getMeeting(id);
    }else{
      cand = await _meetingsService.saveMeeting(_meeting);
    }
    if (cand == null){
      emit(MeetingInvalid());
      return;
    }else{
      _meeting = cand;
    }
    _meetingItems = await _meetingItemsService.loadMeetingItems(_meeting.id);
    if (_meetingItems.isEmpty) _newMeetingItem();
    _selectedItem = _meetingItems.length - 1;
    _emitValidState();
  }

  Future<void> changeName(String name)async{
    _meetingItems[_selectedItem].name = name;
    // TODO save
    _emitValidState();
  }

  Future<void> changeRole(String role)async{
    _meetingItems[_selectedItem].role = role;
    // TODO save
    _emitValidState();
  }

  Future<void> addMeetingItem()async{
    _newMeetingItem();
    _selectedItem = _meetingItems.length - 1;
    _emitValidState();
  }

  Future<void> _newMeetingItem() async{
    MeetingItem item = MeetingItem.createEmptyMeetingItem(_meeting.id);
    _meetingItems.add(item);
  }

  // void _loading(){
  //   MeetingState currentState = state;
  //   if (currentState is MeetingValid){
  //     emit(MeetingLoading(meeting: _meeting.toEMeeting()));
  //   }
  // }

  void _emitValidState(){
    List<EMeetingItem> eMeetingItems = _meetingItems.map((e) => e.toEMeetingItem(),).toList();
    emit(MeetingValid(meeting: _meeting.toEMeeting(), meetingItems: eMeetingItems, selectedItem: _selectedItem));
  }
  
}

class MeetingBlocBuilder extends RichBlocBuilder<MeetingCubit, MeetingState, MeetingValid, MeetingInvalid, MeetingLoading>{
  const MeetingBlocBuilder({super.key, required super.builder});
}
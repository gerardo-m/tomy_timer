
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/services/meeting_items_service.dart';
import 'package:tomy_timer/services/meetings_service.dart';
import 'package:tomy_timer/utils/enums.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'meeting_state.dart';

class MeetingCubit extends Cubit<MeetingState> {
  MeetingCubit() : super(MeetingInitial());

  MeetingsService get _meetingsService => GetIt.instance.get<MeetingsService>();
  MeetingItemsService get _meetingItemsService => GetIt.instance.get<MeetingItemsService>();

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

  Future<void> playAction() async{
    MeetingItem item = _meetingItems[_selectedItem];
    item.startTime = DateTime.now();
    await _meetingItemsService.saveMeetingItem(item);
  }

  Future<void> stopNextAction()async{
    MeetingItem item = _meetingItems[_selectedItem];
    DateTime currentTime = DateTime.now();
    item.iduration = currentTime.difference(item.startTime).inMilliseconds;
    await _meetingItemsService.saveMeetingItem(item);
    _selectedItem++;
    if (_selectedItem >= _meetingItems.length){
      _newMeetingItem();
    }
    _emitValidState();
  }

  Future<void> addMeetingItem()async{
    _newMeetingItem();
    _selectedItem = _meetingItems.length - 1;
    _emitValidState();
  }

  Future<void> setMilestones(RoleType roleType)async{
    MeetingItem item = _meetingItems[_selectedItem];
    if (roleType == RoleType.speaker){
      item.greenTime = const Duration(minutes: 5).inMilliseconds;
      item.ambarTime = const Duration(minutes: 6).inMilliseconds;
      item.redTime = const Duration(minutes: 7).inMilliseconds;
    }
    if (roleType == RoleType.nonSpeaker){
      item.greenTime = null;
      item.ambarTime = null;
      item.redTime = const Duration(minutes: 1).inMilliseconds;
    }
    item.roleType = roleType;
    await _meetingItemsService.saveMeetingItem(item);
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
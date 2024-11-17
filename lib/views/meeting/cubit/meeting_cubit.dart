
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/models/report.dart';
import 'package:tomy_timer/services/meeting_items_service.dart';
import 'package:tomy_timer/services/meetings_service.dart';
import 'package:tomy_timer/services/reports_service.dart';
import 'package:tomy_timer/utils/enums.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'meeting_state.dart';

class MeetingCubit extends Cubit<MeetingState> {
  MeetingCubit() : super(MeetingInitial());

  MeetingsService get _meetingsService => GetIt.instance.get<MeetingsService>();
  MeetingItemsService get _meetingItemsService => GetIt.instance.get<MeetingItemsService>();
  ReportsService get _reportsService => GetIt.instance.get<ReportsService>();

  Meeting _meeting = Meeting.createEmptyMeeting();
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
    _meeting.selectedItem = _meetingItems.length - 1;
    _emitValidState();
  }

  Future<void> changeName(String name)async{
    _meetingItems[_meeting.selectedItem].name = name;
    await _meetingItemsService.saveMeetingItem(_meetingItems[_meeting.selectedItem]);
    _emitValidState();
  }

  Future<void> changeRole(String role)async{
    _meetingItems[_meeting.selectedItem].role = role;
    await _meetingItemsService.saveMeetingItem(_meetingItems[_meeting.selectedItem]);
    _emitValidState();
  }

  Future<void> playAction() async{
    MeetingItem item = _meetingItems[_meeting.selectedItem];
    item.startTime = DateTime.now();
    await _meetingItemsService.saveMeetingItem(item);
  }

  Future<void> stopNextAction()async{
    MeetingItem item = _meetingItems[_meeting.selectedItem];
    DateTime currentTime = DateTime.now();
    item.iduration = currentTime.difference(item.startTime).inMilliseconds;
    _meeting.selectedItem++;
    await _meetingItemsService.saveMeetingItem(item);
    await _meetingsService.saveMeeting(_meeting);
    if (_meeting.selectedItem >= _meetingItems.length){
      _newMeetingItem();
    }
    _emitValidState();
  }

  Future<void> addMeetingItem()async{
    _newMeetingItem();
    _meeting.selectedItem = _meetingItems.length - 1;
    _emitValidState();
  }

  Future<void> setMilestones(RoleType roleType)async{
    MeetingItem item = _meetingItems[_meeting.selectedItem];
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

  /// Return report id
  Future<int?> finishMeeting()async{
    _meeting.current = false;
    Report? report = await _reportsService.generateFromMeetingAndSave(_meeting.id);
    await _meetingsService.saveMeeting(_meeting);
    if (report == null){
      emit(MeetingInvalid());
      return null;
    }
    return report.id;
  }

  Future<void> _newMeetingItem() async{
    MeetingItem item = MeetingItem.createEmptyMeetingItem(_meeting.id, _meetingItems.length);
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
    emit(MeetingValid(meeting: _meeting.toEMeeting(), meetingItems: eMeetingItems, selectedItem: _meeting.selectedItem));
  }
  
}

class MeetingBlocBuilder extends RichBlocBuilder<MeetingCubit, MeetingState, MeetingValid, MeetingInvalid, MeetingLoading>{
  const MeetingBlocBuilder({super.key, required super.builder});
}
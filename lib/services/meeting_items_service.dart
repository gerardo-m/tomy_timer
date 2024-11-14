import 'dart:async';

import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/repositories/meeting_items_repository.dart';
import 'package:tomy_timer/repositories/meetings_repository.dart';
import 'package:tomy_timer/utils/constants.dart';

class MeetingItemsService{

  MeetingItemsRepository meetingItemsRepository;
  MeetingsRepository meetingsRepository;
  
  MeetingItemsService._({
    required this.meetingItemsRepository,
    required this.meetingsRepository,
  });

  factory MeetingItemsService(MeetingItemsRepository meetingItemsRepository, MeetingsRepository meetingsRepository){
    return MeetingItemsService._(meetingItemsRepository: meetingItemsRepository, meetingsRepository: meetingsRepository);
  }

  Future<List<MeetingItem>> loadMeetingItems(int meetingId) async{
    return meetingItemsRepository.getMeetingItems(meetingId);
  }

  Future<MeetingItem?> getMeetingItem(int id) async{
    return meetingItemsRepository.getMeetingItem(id);
  }

  Future<MeetingItem?> saveMeetingItem(MeetingItem meetingItem) async{
    if (meetingItem.id == Constants.newRecordId){
      return meetingItemsRepository.createMeetingItem(meetingItem);
    }else{
      return meetingItemsRepository.updateMeetingItem(meetingItem);
    }
  }

  Future<void> deleteMeetingItem(int id){
    return meetingItemsRepository.deleteMeetingItem(id);
  }

  Future<MeetingItem?> getCurrentMeetingItem()async{
    Meeting? currentMeeting = await meetingsRepository.getCurrentMeeting();
    if (currentMeeting == null) return null;
    return meetingItemsRepository.getFromMeeting(currentMeeting.id, currentMeeting.selectedItem);
  }
}
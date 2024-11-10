import 'dart:async';

import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/repositories/meeting_items_repository.dart';
import 'package:tomy_timer/utils/constants.dart';

class MeetingItemsService{

  MeetingItemsRepository meetingItemsRepository;
  
  MeetingItemsService._({
    required this.meetingItemsRepository,
  });

  factory MeetingItemsService(MeetingItemsRepository meetingItemsRepository){
    return MeetingItemsService._(meetingItemsRepository: meetingItemsRepository);
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
}